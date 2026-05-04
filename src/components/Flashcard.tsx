import { useEffect, useMemo, useState } from 'react'
import type { StudyItem } from '../types'
import { buildFuriganaMap, isKanji } from '../utils/furigana'

type Props = {
  item: StudyItem
  onQuality: (quality: 'forgot' | 'continue' | 'remembered') => void
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
