import { useCallback, useEffect, useMemo, useState } from 'react'
import { Flashcard } from '../components/Flashcard'
import { useReviewSystem } from '../hooks/useReviewSystem'
import { useStudyItem } from '../hooks/useStudyData'
import type { ReviewSentence } from '../types/study'

function isKanji(char: string) {
  const code = char.codePointAt(0) ?? 0
  return (code >= 0x4e00 && code <= 0x9fff) || (code >= 0x3400 && code <= 0x4dbf)
}

function isKana(char: string) {
  const code = char.codePointAt(0) ?? 0
  return (code >= 0x3040 && code <= 0x309f) || (code >= 0x30a0 && code <= 0x30ff)
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
    if (!reading || reading.trim().length === 0) {
      return [{ char: japanese, reading: null }]
    }
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

function normalizeAnswer(value: string) {
  return value.trim().toLowerCase().replace(/\s+/g, ' ')
}

function isCloseAnswer(answer: string, expected: string) {
  const normAnswer = normalizeAnswer(answer)
  const normExpected = normalizeAnswer(expected)

  if (normExpected.length === 0 || normAnswer.length === 0) return false
  if (normExpected.includes(normAnswer) || normAnswer.includes(normExpected)) return true

  const answerWords = new Set(normAnswer.split(' '))
  const expectedWords = new Set(normExpected.split(' '))
  const common = [...answerWords].filter((word) => expectedWords.has(word)).length
  const ratio = common / Math.max(expectedWords.size, 1)
  return ratio >= 0.6
}

export function ReviewPage() {
  const { reviewQueueDue, updateReviewForQuality } = useReviewSystem()

  const [toastMessage, setToastMessage] = useState<string | null>(null)
  const [completionAnswer, setCompletionAnswer] = useState('')
  const [showCompletionResult, setShowCompletionResult] = useState(false)
  const [completionResultStatus, setCompletionResultStatus] = useState<'correct' | 'close' | 'wrong' | null>(null)
  const [showTranslation, setShowTranslation] = useState(false)

  const current = reviewQueueDue[0]
  const item = useStudyItem(current?.id ?? '')

  const completionSentence = useMemo<ReviewSentence | null>(() => {
    if (!item?.review_sentences || item.review_sentences.length === 0) return null
    const index = Math.floor(Math.random() * item.review_sentences.length)
    return item.review_sentences[index]
  }, [item?.id])

  useEffect(() => {
    setCompletionAnswer('')
    setShowCompletionResult(false)
    setCompletionResultStatus(null)
    setShowTranslation(false)
  }, [item?.id])

  useEffect(() => {
    if (!toastMessage) return
    const timer = window.setTimeout(() => setToastMessage(null), 2500)
    return () => window.clearTimeout(timer)
  }, [toastMessage])

  const showToast = useCallback((message: string) => {
    setToastMessage(message)
  }, [])

  const handleQuality = useCallback(
    (quality: 'forgot' | 'continue' | 'remembered') => {
      if (!current) return

      const message =
        quality === 'forgot'
          ? 'Você verá este item novamente amanhã.'
          : quality === 'continue'
          ? 'Você verá este item novamente em alguns dias.'
          : 'Item dominado! Não será mais revisado.'

      showToast(message)
      updateReviewForQuality(current.id, quality)
    },
    [current, showToast, updateReviewForQuality],
  )

  const handleCheckCompletion = () => {
    if (!completionSentence) return
    const normalizedAnswer = normalizeAnswer(completionAnswer)
    const isCorrect = completionSentence.answers.some((answer) => normalizeAnswer(answer) === normalizedAnswer)
    if (isCorrect) {
      setCompletionResultStatus('correct')
    } else {
      const isClose = completionSentence.answers.some((answer) => isCloseAnswer(completionAnswer, answer))
      setCompletionResultStatus(isClose ? 'close' : 'wrong')
    }
    setShowCompletionResult(true)
  }

  return (
    <main className="page">
      <header className="page__header">
        <h1>Revisão</h1>
        <p>Use este espaço para revisar os itens estudados.</p>
      </header>

      {current && item ? (
        completionSentence ? (
          <section className="flashcard">
            <header className="flashcard__header">
              <p className="flashcard__meta">{item.level} • {item.type} • completude</p>
            </header>
            <div className="flashcard__content">
              <p className="flashcard__front" style={{ whiteSpace: 'pre-wrap' }}>
                {completionSentence.sentence}
              </p>
              {showTranslation && completionSentence.translation && (
                <p className="flashcard__translation" style={{ marginTop: '0.5rem' }}>
                  {completionSentence.translation}
                </p>
              )}
              <label className="label" htmlFor="completion-answer">
                Complete com a estrutura correta:
              </label>
              <input
                id="completion-answer"
                className="review-input"
                type="text"
                value={completionAnswer}
                onChange={(event) => setCompletionAnswer(event.target.value)}
                placeholder="Insira a resposta aqui"
              />
              <div style={{ display: 'flex', gap: '0.5rem', flexWrap: 'wrap', marginBottom: '0.5rem' }}>
                <button
                  className="button button--primary"
                  type="button"
                  onClick={handleCheckCompletion}
                  disabled={completionAnswer.trim() === ''}
                >
                  Verificar
                </button>
                <button
                  className="button button--secondary"
                  type="button"
                  onClick={() => setShowTranslation((prev) => !prev)}
                >
                  {showTranslation ? 'Ocultar tradução' : 'Mostrar tradução'}
                </button>
              </div>

              {showCompletionResult && (
                <div className={`completion-result ${completionResultStatus || 'wrong'}`}>
                  <p className="completion-result__status">
                    {completionResultStatus === 'correct'
                      ? '✅ Acertou! Excelente.'
                      : completionResultStatus === 'close'
                      ? '⚠️ Quase lá! Boa tentativa.'
                      : '💡 Vamos revisar um pouco mais.'}
                  </p>
                  <p className="completion-result__text"><strong>Resposta correta:</strong> {completionSentence.answers.join(' / ')}</p>
                  <p className="completion-result__text"><strong>Estrutura:</strong> <FuriganaText japanese={item.japanese} reading={item.reading} /></p>
                  <p className="completion-result__text">{item.explanation}</p>
                  {item.examples.length > 0 && (
                    <div className="completion-result__examples">
                      <h3>Exemplos</h3>
                      <ul>
                        {item.examples.map((example) => (
                          <li key={example.japanese}>
                            <div><FuriganaText japanese={example.japanese} reading={example.reading} /></div>
                            <div>{example.translation}</div>
                          </li>
                        ))}
                      </ul>
                    </div>
                  )}
                </div>
              )}
            </div>
            {showCompletionResult && (
              <footer className="flashcard__actions">
                <button className="button" type="button" onClick={() => handleQuality('forgot')}>
                  Esqueci
                </button>
                <button className="button" type="button" onClick={() => handleQuality('continue')}>
                  Continuar estudando
                </button>
                <button className="button button--primary" type="button" onClick={() => handleQuality('remembered')}>
                  Decorei
                </button>
              </footer>
            )}
          </section>
        ) : (
          <Flashcard item={item} onQuality={handleQuality} />
        )
      ) : (
        <section className="empty-state">
          <p>Não há itens prontos para revisão no momento.</p>
          <p>
            Volte mais tarde ou marque itens para revisão na página de estudo.
          </p>
        </section>
      )}

      {toastMessage && (
        <div className="toast" role="status" aria-live="polite">
          <div className="toast__content">
            <span>{toastMessage}</span>
            <button
              type="button"
              className="toast__close"
              aria-label="Fechar"
              onClick={() => setToastMessage(null)}
            >
              ×
            </button>
          </div>
        </div>
      )}
    </main>
  )
}
