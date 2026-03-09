import { useMemo, useState } from 'react'
import type { StudyItem } from '../types'

type Props = {
  item: StudyItem
  onQuality: (quality: 'forgot' | 'continue' | 'remembered') => void
}

export function Flashcard({ item, onQuality }: Props) {
  const [showAnswer, setShowAnswer] = useState(false)

  const frontText = useMemo(() => {
    if (item.type === 'vocabulary') {
      return `${item.japanese} ${item.reading ? `(${item.reading})` : ''}`.trim()
    }

    return item.japanese
  }, [item])

  return (
    <article className="flashcard">
      <header className="flashcard__header">
        <h2>Revisão</h2>
        <p className="flashcard__meta">
          {item.level} • {item.type}
        </p>
      </header>

      <section className="flashcard__content">
        <p className="flashcard__front">{frontText}</p>

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
                      <div className="flashcard__example-jp">{example.japanese}</div>
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
          <button className="button" onClick={() => onQuality('forgot')}>
            Esqueci
          </button>
          <button className="button" onClick={() => onQuality('continue')}>
            Continuar estudando
          </button>
          <button className="button button--primary" onClick={() => onQuality('remembered')}>
            Decorei
          </button>
        </footer>
      )}
    </article>
  )
}
