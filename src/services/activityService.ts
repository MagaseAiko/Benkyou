import { supabase } from '../utils/supabase'
import { getLocalDateKey } from '../hooks/usePreferences'

/*
 * Dias de estudo do usuário (calendário do Dashboard).
 *
 * A tabela user_daily_activity não era preenchida por nenhuma parte do app,
 * então o histórico é reconstruído a partir das datas que já existem:
 *   - user_daily_activity (registrada a partir de agora, ver recordDailyActivity)
 *   - user_study_items: quando cada item foi estudado/dominado
 *   - user_review_queue: quando cada item entrou na revisão e a última revisão
 */

type TimestampRow = { created_at?: string | null; updated_at?: string | null }

/** Converte um timestamp do banco (UTC, às vezes sem fuso) para a data local. */
function timestampToLocalDateKey(value: string | null | undefined): string | null {
  if (!value) return null
  // Fuso curto ("+00", comum no Postgres) não é entendido pelo Date: vira "+00:00"
  const normalized = value.replace(' ', 'T').replace(/([+-]\d{2})$/, '$1:00')
  const hasZone = /[zZ]$|[+-]\d{2}:?\d{2}$/.test(normalized)
  const date = new Date(hasZone ? normalized : `${normalized}Z`)
  return Number.isNaN(date.getTime()) ? null : getLocalDateKey(date)
}

export async function fetchStudyDays(userId: string, since: Date): Promise<Set<string>> {
  const sinceKey = getLocalDateKey(since)
  // Itens e revisões são poucas linhas por usuário: o filtro por data é feito aqui

  const [activity, studyItems, reviewQueue] = await Promise.all([
    supabase
      .from('user_daily_activity')
      .select('activity_date')
      .eq('user_id', userId)
      .gte('activity_date', sinceKey),
    supabase
      .from('user_study_items')
      .select('created_at,updated_at')
      .eq('user_id', userId),
    supabase
      .from('user_review_queue')
      .select('created_at,updated_at')
      .eq('user_id', userId),
  ])

  const days = new Set<string>()

  if (activity.error) {
    console.warn('Histórico: não foi possível ler user_daily_activity', activity.error)
  } else {
    for (const row of (activity.data ?? []) as { activity_date: string | null }[]) {
      if (row.activity_date) days.add(row.activity_date.slice(0, 10))
    }
  }

  for (const [table, result] of [
    ['user_study_items', studyItems],
    ['user_review_queue', reviewQueue],
  ] as const) {
    if (result.error) {
      console.warn(`Histórico: não foi possível ler ${table}`, result.error)
      continue
    }
    for (const row of (result.data ?? []) as TimestampRow[]) {
      for (const value of [row.created_at, row.updated_at]) {
        const key = timestampToLocalDateKey(value)
        if (key && key >= sinceKey) days.add(key)
      }
    }
  }

  return days
}

/**
 * Registra que o usuário estudou hoje. Roda no máximo uma vez por dia por
 * navegador e nunca interrompe o estudo se algo falhar.
 */
export async function recordDailyActivity(userId: string): Promise<void> {
  const today = getLocalDateKey()
  const storageKey = `benkyou:activity-recorded:${userId}:${today}`

  try {
    if (window.localStorage.getItem(storageKey)) return
  } catch {
    // Sem localStorage: segue e consulta o banco
  }

  try {
    const { data, error } = await supabase
      .from('user_daily_activity')
      .select('id')
      .eq('user_id', userId)
      .eq('activity_date', today)
      .limit(1)

    if (error) throw error

    if (!data || data.length === 0) {
      const { error: insertError } = await supabase
        .from('user_daily_activity')
        .insert({ user_id: userId, activity_date: today })
      if (insertError) throw insertError
    }

    try {
      window.localStorage.setItem(storageKey, '1')
    } catch {
      // Sem localStorage: apenas consulta o banco de novo na próxima vez
    }
  } catch (error) {
    console.warn('Não foi possível registrar a atividade de hoje:', error)
  }
}
