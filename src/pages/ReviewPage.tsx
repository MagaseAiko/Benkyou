import { useCallback, useEffect, useMemo, useState, useRef, Fragment } from 'react'
import { Flashcard } from '../components/Flashcard'
import { useUserProgress } from '../hooks/useUserProgress'
import { useStudyItem } from '../hooks/useStudyData'
import { useToast } from '../hooks/useToast'
import { Toast } from '../components/Toast'
import { HighlightedText } from './StudyItemPage'
import type { ReviewSentence } from '../types/study'
import * as wanakana from 'wanakana'
import { Lightbulb, Languages, CheckCircle, XCircle, AlertCircle, Info, X } from 'lucide-react'
import './ReviewPage.css'

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
  const { reviewQueueDue, updateReviewForQuality } = useUserProgress()
  const { message, toastType, showToast, closeToast } = useToast()
  
  const [completionAnswer, setCompletionAnswer] = useState('')
  const [showCompletionResult, setShowCompletionResult] = useState(false)
  const [completionResultStatus, setCompletionResultStatus] = useState<'correct' | 'close' | 'wrong' | null>(null)
  
  const [showTranslationHint, setShowTranslationHint] = useState(false)
  const [showStructureHint, setShowStructureHint] = useState(false)
  const [showGrammarModal, setShowGrammarModal] = useState(false)
  
  const inputRef = useRef<HTMLInputElement>(null)

  const current = reviewQueueDue[0]
  const { item, isLoading: itemLoading } = useStudyItem(current?.id ?? '')

  const completionSentence = useMemo<ReviewSentence | null>(() => {
    if (!item?.review_sentences || item.review_sentences.length === 0) return null
    const index = Math.floor(Math.random() * item.review_sentences.length)
    return item.review_sentences[index]
  }, [item?.id])

  if (current && itemLoading) {
    return (
      <main className="page">
        <header className="page__header">
          <h1>Revisão</h1>
          <p>Use este espaço para revisar os itens estudados.</p>
        </header>
        <p className="empty-state">Carregando item de revisão...</p>
      </main>
    )
  }

  useEffect(() => {
    setCompletionAnswer('')
    setShowCompletionResult(false)
    setCompletionResultStatus(null)
    setShowTranslationHint(false)
    setShowStructureHint(false)
    setShowGrammarModal(false)
  }, [item?.id])

  const handleQuality = useCallback(
    (quality: 'forgot' | 'continue' | 'remembered') => {
      if (!current) return

      const toastMsg =
        quality === 'forgot'
          ? 'Você verá este item novamente hoje.'
          : quality === 'continue'
          ? 'Você verá este item novamente em alguns dias.'
          : 'Item dominado! Não será mais revisado.'

      showToast(toastMsg)
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

  const renderInlineSentence = () => {
    if (!completionSentence) return null
    
    // Split by at least 2 underscores, as it's typically ____
    const parts = completionSentence.sentence.split(/_{2,}/)
    
    return (
      <div className="review-sentence-inline">
        {parts.map((part, index) => (
          <Fragment key={index}>
            <span>{part}</span>
            {index < parts.length - 1 && (
              <input
                ref={index === 0 ? inputRef : null}
                className={`review-inline-input ${showCompletionResult ? completionResultStatus || '' : ''}`}
                type="text"
                value={completionAnswer}
                onChange={(e) => {
                  // Converte o texto digitado (romaji) para kana automaticamente
                  const kanaText = wanakana.toKana(e.target.value, { IMEMode: true })
                  setCompletionAnswer(kanaText)
                }}
                onKeyDown={(e) => {
                  if (e.key === 'Enter' && completionAnswer.trim() !== '' && !showCompletionResult) {
                    handleCheckCompletion()
                  }
                }}
                disabled={showCompletionResult}
                autoFocus
                placeholder="Resposta"
                style={{
                  width: `${Math.max(5, completionAnswer.length * 1.2)}em`
                }}
                spellCheck="false"
              />
            )}
          </Fragment>
        ))}
      </div>
    )
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
            <div className="flashcard__content" style={{ padding: '2rem 1.5rem' }}>
              
              {/* Hints Buttons */}
              <div className="review-hints">
                <button
                  className={`hint-button ${showTranslationHint ? 'active' : ''}`}
                  type="button"
                  onClick={() => setShowTranslationHint(!showTranslationHint)}
                >
                  <Languages size={16} /> Tradução
                </button>
                <button
                  className={`hint-button ${showStructureHint ? 'active' : ''}`}
                  type="button"
                  onClick={() => setShowStructureHint(!showStructureHint)}
                >
                  <Lightbulb size={16} /> Estrutura
                </button>
              </div>

              {/* Hints Content */}
              {showTranslationHint && completionSentence.translation && (
                <div className="hint-content">
                  <span>Tradução da Frase</span>
                  <p>{completionSentence.translation}</p>
                </div>
              )}
              {showStructureHint && item.translation && (
                <div className="hint-content">
                  <span>Sentido da Estrutura</span>
                  <p>{item.translation}</p>
                </div>
              )}

              {/* Inline Sentence Input */}
              {renderInlineSentence()}

              {/* Verify Button (only if not verified) */}
              {!showCompletionResult && (
                <div className="review-verify-action">
                  <button
                    className="button button--primary"
                    type="button"
                    onClick={handleCheckCompletion}
                    disabled={completionAnswer.trim() === ''}
                  >
                    Verificar
                  </button>
                </div>
              )}

              {/* Simple Dynamic Feedback */}
              {showCompletionResult && (
                <div className="review-feedback-simple">
                  <div className={`status-text ${completionResultStatus || 'wrong'}`}>
                    {completionResultStatus === 'correct' && <><CheckCircle size={24} /> Acertou! Excelente.</>}
                    {completionResultStatus === 'close' && <><AlertCircle size={24} /> Quase lá! Boa tentativa.</>}
                    {completionResultStatus === 'wrong' && <><XCircle size={24} /> Erro. Vamos revisar.</>}
                  </div>
                  
                  {completionResultStatus !== 'correct' && (
                    <div className="correct-answer">
                      <strong>Resposta correta:</strong> {completionSentence.answers.join(' / ')}
                    </div>
                  )}

                  <div className="review-actions">
                    <button className="button" type="button" onClick={() => setShowGrammarModal(true)}>
                      <Info size={18} style={{ marginRight: '0.5rem' }} /> Ver explicação
                    </button>
                    {completionResultStatus === 'correct' ? (
                      <>
                        <button className="button" type="button" onClick={() => handleQuality('forgot')}>
                          Esqueci
                        </button>
                        <button className="button" type="button" onClick={() => handleQuality('continue')}>
                          Continuar estudando
                        </button>
                        <button className="button button--primary" type="button" onClick={() => handleQuality('remembered')} autoFocus>
                          Decorei
                        </button>
                      </>
                    ) : (
                      <>
                        <button className="button" type="button" onClick={() => handleQuality('forgot')}>
                          Estudar de novo
                        </button>
                        <button className="button button--primary" type="button" onClick={() => handleQuality('continue')} autoFocus>
                          Avançar
                        </button>
                      </>
                    )}
                  </div>
                </div>
              )}
            </div>
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

      {/* Grammar Modal */}
      {showGrammarModal && current && item && (
        <div className="grammar-modal-overlay" onClick={() => setShowGrammarModal(false)}>
          <div className="grammar-modal-content" onClick={(e) => e.stopPropagation()}>
            <button className="grammar-modal-close" onClick={() => setShowGrammarModal(false)} aria-label="Fechar modal">
              <X size={24} />
            </button>
            <div className="grammar-modal-header">
              <h2>Detalhes da Gramática</h2>
            </div>
            
            <p className="completion-result__text" style={{ fontSize: '1.25rem', marginBottom: '1rem' }}>
              <strong>Estrutura:</strong> <FuriganaText japanese={item.japanese} reading={item.reading} />
            </p>
            <p className="completion-result__text" style={{ marginBottom: '1.5rem', lineHeight: '1.6' }}>
              {item.explanation}
            </p>
            
            {item.examples.length > 0 && (
              <div className="completion-result__examples">
                <h3 style={{ marginBottom: '1rem' }}>Exemplos</h3>
                <ul style={{ listStyle: 'none', padding: 0, display: 'flex', flexDirection: 'column', gap: '1rem' }}>
                  {item.examples.map((example) => (
                    <li key={example.japanese} style={{ background: 'var(--surface-alt)', padding: '1rem', borderRadius: '8px' }}>
                      <div style={{ fontSize: '1.1rem', marginBottom: '0.5rem' }}>
                        <HighlightedText
                          japanese={example.japanese}
                          reading={example.reading}
                          grammar={item.type === 'grammar' && 'match_regex' in item ? item : undefined}
                        />
                      </div>
                      <div style={{ color: 'var(--text-muted)' }}>{example.translation}</div>
                    </li>
                  ))}
                </ul>
              </div>
            )}
          </div>
        </div>
      )}

      <Toast message={message} onClose={closeToast} type={toastType} />
    </main>
  )
}
