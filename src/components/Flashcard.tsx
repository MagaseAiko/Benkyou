import { useEffect, useMemo, useState } from 'react'
import type { StudyItem } from '../types'

type Props = {
  item: StudyItem
  onQuality: (quality: 'forgot' | 'continue' | 'remembered') => void
}

function isKanji(char: string) {
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

function buildFuriganaMap(japanese: string, reading: string) {
  const result: Array<{ char: string; reading: string | null }> = []
  let rIdx = 0

  const nextKanaIndex = (start: number) => {
    for (let i = start; i < japanese.length; i += 1) {
      if (isKana(japanese[i])) return i
    }
    return -1
  }

  for (let i = 0; i < japanese.length; i += 1) {
    const char = japanese[i]

    if (isKana(char) || /[。、！？]/.test(char)) {
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

function FuriganaText({ japanese, reading }: { japanese: string; reading?: string }) {
  const mapping = useMemo(() => {
    if (!reading || reading.trim() === '') return [{ char: japanese, reading: null }]
    return buildFuriganaMap(japanese, reading)
  }, [japanese, reading])

  return (
    <span>
      {mapping.map((item, index) => {
        const showTooltip = Boolean(item.reading && item.reading.trim()) && isKanji(item.char)
        const isPunctuation = /[。、！？]/.test(item.char)
        return (
          <span key={`${item.char}-${index}`} className={`furigana-wrapper ${isPunctuation ? 'furigana-punctuation' : ''}`}>
            <span className="furigana-target">{item.char}</span>
            {showTooltip && <span className="furigana-tooltip">{item.reading}</span>}
          </span>
        )
      })}
    </span>
  )
}

export function Flashcard({ item, onQuality }: Props) {
  const [showAnswer, setShowAnswer] = useState(false)

  useEffect(() => {
    setShowAnswer(false)
  }, [item.id])

  const handleQuality = (quality: 'forgot' | 'continue' | 'remembered') => {
    onQuality(quality)
    setShowAnswer(false)
  }

  return (
    <article className="flashcard">
      <header className="flashcard__header">
        <p className="flashcard__meta">
          {item.level} • {item.type}
        </p>
      </header>

      <section className="flashcard__content">
        <p className="flashcard__front">
          <FuriganaText japanese={item.japanese} reading={item.reading} />
        </p>

        {showAnswer ? (
          <div className="flashcard__back">
            <p className="flashcard__translation">{item.translation}</p>
            <p className="flashcard__explanation">{item.explanation}</p>
            {item.examples.length > 0 && (
              <div className="flashcard__examples">
                <h3>Exemplos</h3>
                <ul>
                  {item.examples.map((example) => (
                    <li key={example.japanese} className="flashcard__example">
                      <div className="flashcard__example-jp">
                        <FuriganaText japanese={example.japanese} reading={example.reading} />
                      </div>
                      {example.reading && <div className="flashcard__example-reading">{example.reading}</div>}
                      <div className="flashcard__example-translation">{example.translation}</div>
                    </li>
                  ))}
                </ul>
              </div>
            )}
          </div>
        ) : (
          <button className="button button--primary" type="button" onClick={() => setShowAnswer(true)}>
            Mostrar resposta
          </button>
        )}
      </section>

      {showAnswer && (
        <footer className="flashcard__actions">
          <button className="button" onClick={() => handleQuality('forgot')}>
            Esqueci
          </button>
          <button className="button" onClick={() => handleQuality('continue')}>
            Continuar estudando
          </button>
          <button className="button button--primary" onClick={() => handleQuality('remembered')}>
            Decorei
          </button>
        </footer>
      )}

    </article>
  )
}
