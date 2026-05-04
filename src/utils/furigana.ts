export type FuriganaItem = {
  char: string
  reading: string | null
}

export function isKanji(char: string) {
  const code = char.codePointAt(0) ?? 0
  return (code >= 0x4e00 && code <= 0x9fff) || (code >= 0x3400 && code <= 0x4dbf)
}

function isKana(char: string) {
  const code = char.codePointAt(0) ?? 0
  return (
    (code >= 0x3040 && code <= 0x309f) || // hiragana
    (code >= 0x30a0 && code <= 0x30ff) // katakana
  )
}

function isPunctuation(char: string) {
  return /[。、！？]/.test(char)
}

export function buildFuriganaMap(japanese: string, reading: string) {
  const result: FuriganaItem[] = []
  let rIdx = 0

  const nextKanaIndex = (start: number) => {
    for (let i = start; i < japanese.length; i += 1) {
      if (isKana(japanese[i])) return i
    }
    return -1
  }

  for (let i = 0; i < japanese.length; i += 1) {
    const char = japanese[i]

    if (isKana(char) || isPunctuation(char)) {
      const readChar = reading[rIdx] ?? ''
      result.push({ char, reading: readChar })
      rIdx += 1
      continue
    }

    if (isKanji(char)) {
      const nextKanaPos = nextKanaIndex(i + 1)
      if (nextKanaPos === -1) {
        const rest = reading.slice(rIdx) || ''
        result.push({ char, reading: rest })
        rIdx = reading.length
      } else {
        const nextKanaChar = japanese[nextKanaPos]
        let boundary = rIdx

        while (boundary < reading.length && reading[boundary] !== nextKanaChar) {
          boundary += 1
        }

        if (
          boundary === rIdx &&
          reading[boundary] === nextKanaChar &&
          !isKanji(japanese[i - 1] ?? '')
        ) {
          boundary += 1
        }

        const furigana = reading.slice(rIdx, boundary) || ''
        result.push({ char, reading: furigana })
        rIdx = boundary
      }
      continue
    }

    const readChar = reading[rIdx] ?? ''
    result.push({ char, reading: readChar })
    rIdx += 1
  }

  return result
}
