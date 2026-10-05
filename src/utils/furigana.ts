/**
 * Um segmento do texto japonês com sua leitura.
 *
 * Kanjis consecutivos formam UM segmento (ex.: 写真 → しゃしん), para que a
 * leitura fique centralizada sobre a palavra inteira, e não só sobre o 1º kanji.
 * Os demais caracteres (kana, pontuação etc.) ficam um por segmento.
 * A concatenação de todos os `char` é sempre igual ao texto original.
 */
export type FuriganaItem = {
  char: string
  reading: string | null
}

export function isKanji(char: string) {
  const code = char.codePointAt(0) ?? 0
  return (
    (code >= 0x4e00 && code <= 0x9fff) || // CJK unificados
    (code >= 0x3400 && code <= 0x4dbf) || // extensão A
    (code >= 0xf900 && code <= 0xfaff) || // compatibilidade
    (code >= 0x20000 && code <= 0x2ebef) || // extensões B–F
    code === 0x3005 // 々 (repetição de kanji, ex.: 時々)
  )
}

function isKana(char: string) {
  const code = char.codePointAt(0) ?? 0
  return (
    (code >= 0x3040 && code <= 0x309f) || // hiragana
    (code >= 0x30a0 && code <= 0x30ff) // katakana
  )
}

/** Katakana → hiragana, mantendo o mesmo tamanho (para comparar leituras). */
function toHiragana(text: string) {
  return text.replace(/[\u30a1-\u30f6]/g, (char) => String.fromCharCode(char.charCodeAt(0) - 0x60))
}

function escapeRegExp(text: string) {
  return text.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')
}

type Segment = { text: string; kind: 'kanji' | 'kana' | 'other' }

function splitSegments(japanese: string): Segment[] {
  const segments: Segment[] = []
  for (const char of Array.from(japanese)) {
    const kind: Segment['kind'] = isKanji(char) ? 'kanji' : isKana(char) ? 'kana' : 'other'
    const last = segments[segments.length - 1]
    // Agrupa kanjis consecutivos (e kanas consecutivos, para o alinhamento)
    if (last && last.kind === kind && kind !== 'other') {
      last.text += char
    } else {
      segments.push({ text: char, kind })
    }
  }
  return segments
}

/** Converte os segmentos em itens finais: kanji em bloco, o resto caractere a caractere. */
function toItems(segments: Segment[], kanjiReadings: (string | null)[]): FuriganaItem[] {
  const items: FuriganaItem[] = []
  let kanjiIndex = 0
  for (const segment of segments) {
    if (segment.kind === 'kanji') {
      items.push({ char: segment.text, reading: kanjiReadings[kanjiIndex] ?? null })
      kanjiIndex += 1
    } else {
      for (const char of Array.from(segment.text)) {
        items.push({ char, reading: null })
      }
    }
  }
  return items
}

/**
 * Alinha a leitura usando os kanas do próprio texto como âncoras.
 * Ex.: 食べ物 + たべもの → 食=た, べ, 物=もの · 母は + ははは → 母=はは, は
 * Retorna null se a leitura não "encaixa" no texto.
 */
function alignWithAnchors(segments: Segment[], reading: string): (string | null)[] | null {
  let pattern = '^'
  for (const segment of segments) {
    if (segment.kind === 'kanji') {
      pattern += '(.+?)'
    } else if (segment.kind === 'kana') {
      pattern += escapeRegExp(toHiragana(segment.text))
    } else {
      // Pontuação/símbolos podem ou não aparecer na leitura
      pattern += `(?:${escapeRegExp(segment.text)})?`
    }
  }
  pattern += '$'

  let match: RegExpMatchArray | null = null
  try {
    match = toHiragana(reading).match(new RegExp(pattern, 'su'))
  } catch {
    return null
  }
  if (!match) return null

  // Como toHiragana preserva o tamanho, recorta da leitura original (mantém katakana)
  const readings: (string | null)[] = []
  let cursor = 0
  let groupIndex = 1
  const normalized = toHiragana(reading)
  for (const segment of segments) {
    if (segment.kind === 'kanji') {
      const group = match[groupIndex] ?? ''
      const start = normalized.indexOf(group, cursor)
      readings.push(reading.slice(start, start + group.length))
      cursor = start + group.length
      groupIndex += 1
    } else if (segment.kind === 'kana') {
      cursor += segment.text.length
    } else if (normalized.startsWith(segment.text, cursor)) {
      cursor += segment.text.length
    }
  }
  return readings
}

/**
 * Plano B, quando a leitura não encaixa no texto (ex.: leitura em romaji ou
 * com diferenças): cada bloco de kanji recebe a leitura até o próximo kana.
 */
function alignGreedy(segments: Segment[], reading: string): (string | null)[] {
  const readings: (string | null)[] = []
  const normalized = toHiragana(reading)
  let rIdx = 0

  segments.forEach((segment, index) => {
    if (segment.kind !== 'kanji') {
      rIdx += Array.from(segment.text).length
      return
    }

    const nextKana = segments.slice(index + 1).find((next) => next.kind === 'kana')
    if (!nextKana) {
      readings.push(reading.slice(rIdx) || null)
      rIdx = reading.length
      return
    }

    // Cada kanji lê pelo menos 1 caractere
    const anchor = toHiragana(nextKana.text[0])
    let boundary = normalized.indexOf(anchor, rIdx + 1)
    if (boundary === -1) boundary = reading.length
    readings.push(reading.slice(rIdx, boundary) || null)
    rIdx = boundary
  })

  return readings
}

export function buildFuriganaMap(japanese: string, reading: string): FuriganaItem[] {
  const segments = splitSegments(japanese)
  const cleanReading = (reading ?? '').trim()

  if (!cleanReading || !segments.some((segment) => segment.kind === 'kanji')) {
    return toItems(segments, [])
  }

  const readings = alignWithAnchors(segments, cleanReading) ?? alignGreedy(segments, cleanReading)
  return toItems(segments, readings)
}
