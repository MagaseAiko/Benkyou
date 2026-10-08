import type { IncomingMessage, ServerResponse } from 'node:http'
import { createClient } from '@supabase/supabase-js'
import webpush from 'web-push'

/*
 * Lembrete diário (Vercel Cron, ver vercel.json → 12:00 UTC = 9h em Brasília).
 *
 * Para cada aparelho inscrito em push_subscriptions, conta as revisões do
 * usuário que vencem até o fim do dia e envia "Você tem N revisões para hoje".
 * Quem não tem revisões não recebe nada. Inscrições expiradas são removidas.
 *
 * Variáveis de ambiente (só no servidor):
 *   SUPABASE_SERVICE_ROLE_KEY, VITE_SUPABASE_URL (ou SUPABASE_URL),
 *   VAPID_PUBLIC_KEY, VAPID_PRIVATE_KEY, VAPID_SUBJECT, CRON_SECRET
 */

// Brasil não tem horário de verão desde 2019: UTC-3 o ano todo
const TIMEZONE_OFFSET_HOURS = -3

type SubscriptionRow = {
  user_id: string
  endpoint: string
  p256dh: string
  auth: string
}

function sendJson(res: ServerResponse, status: number, payload: Record<string, unknown>) {
  res.statusCode = status
  res.setHeader('Content-Type', 'application/json; charset=utf-8')
  res.end(JSON.stringify(payload))
}

/** Fim do dia de hoje no fuso do Brasil, como timestamp UTC. */
function endOfLocalDay(now = new Date()) {
  const offsetMs = TIMEZONE_OFFSET_HOURS * 60 * 60 * 1000
  const local = new Date(now.getTime() + offsetMs)
  local.setUTCHours(23, 59, 59, 999)
  return new Date(local.getTime() - offsetMs)
}

function reminderText(count: number) {
  return count === 1
    ? 'Você tem 1 revisão para hoje. がんばって！'
    : `Você tem ${count} revisões para hoje. がんばって！`
}

export default async function handler(req: IncomingMessage, res: ServerResponse) {
  // A Vercel envia "Authorization: Bearer <CRON_SECRET>" nas chamadas do cron
  const cronSecret = process.env.CRON_SECRET
  if (!cronSecret || req.headers.authorization !== `Bearer ${cronSecret}`) {
    sendJson(res, 401, { error: 'Não autorizado' })
    return
  }

  const supabaseUrl = process.env.SUPABASE_URL ?? process.env.VITE_SUPABASE_URL
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY
  const vapidPublic = process.env.VAPID_PUBLIC_KEY
  const vapidPrivate = process.env.VAPID_PRIVATE_KEY
  const vapidSubject = process.env.VAPID_SUBJECT ?? 'https://benkyou-alpha.vercel.app'

  if (!supabaseUrl || !serviceKey || !vapidPublic || !vapidPrivate) {
    sendJson(res, 500, { error: 'Variáveis de ambiente do lembrete não configuradas' })
    return
  }

  webpush.setVapidDetails(vapidSubject, vapidPublic, vapidPrivate)
  // Chave de serviço: lê dados de todos os usuários (nunca vai para o navegador)
  const supabase = createClient(supabaseUrl, serviceKey, { auth: { persistSession: false } })

  const { data: subscriptions, error: subscriptionsError } = await supabase
    .from('push_subscriptions')
    .select('user_id, endpoint, p256dh, auth')

  if (subscriptionsError) {
    sendJson(res, 500, { error: subscriptionsError.message })
    return
  }

  const rows = (subscriptions ?? []) as SubscriptionRow[]
  const userIds = [...new Set(rows.map((row) => row.user_id))]
  if (userIds.length === 0) {
    sendJson(res, 200, { sent: 0, users: 0 })
    return
  }

  const { data: dueRows, error: dueError } = await supabase
    .from('user_review_queue')
    .select('user_id')
    .in('user_id', userIds)
    .lte('next_review', endOfLocalDay().toISOString())

  if (dueError) {
    sendJson(res, 500, { error: dueError.message })
    return
  }

  const dueByUser = new Map<string, number>()
  for (const row of (dueRows ?? []) as { user_id: string }[]) {
    dueByUser.set(row.user_id, (dueByUser.get(row.user_id) ?? 0) + 1)
  }

  let sent = 0
  const expired: string[] = []

  await Promise.all(
    rows.map(async (row) => {
      const count = dueByUser.get(row.user_id) ?? 0
      if (count === 0) return

      try {
        await webpush.sendNotification(
          { endpoint: row.endpoint, keys: { p256dh: row.p256dh, auth: row.auth } },
          JSON.stringify({ title: 'Benkyou', body: reminderText(count), url: '/review' }),
          { TTL: 60 * 60 * 12 },
        )
        sent += 1
      } catch (error) {
        const statusCode = (error as { statusCode?: number }).statusCode
        // 404/410: o aparelho cancelou a inscrição ou ela expirou
        if (statusCode === 404 || statusCode === 410) expired.push(row.endpoint)
        else console.error('Falha ao enviar lembrete:', statusCode, (error as Error).message)
      }
    }),
  )

  if (expired.length > 0) {
    await supabase.from('push_subscriptions').delete().in('endpoint', expired)
  }

  sendJson(res, 200, { sent, users: dueByUser.size, removed: expired.length })
}
