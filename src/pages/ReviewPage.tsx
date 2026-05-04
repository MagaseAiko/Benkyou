import { useCallback, useEffect, useMemo, useState, useRef, Fragment } from 'react'
import { Flashcard } from '../components/Flashcard'
import { useAuth } from '../hooks/useAuth'
import { useUserProgress } from '../hooks/useUserProgress'
import { useStudyItem } from '../hooks/useStudyData'
import { useToast } from '../hooks/useToast'
import { Toast } from '../components/Toast'
import { HighlightedText } from './StudyItemPage'
import { buildFuriganaMap, isKanji } from '../utils/furigana'
import type { ReviewSentence } from '../types/study'
import * as wanakana from 'wanakana'
import { Lightbulb, Languages, CheckCircle, XCircle, AlertCircle, Info, X } from 'lucide-react'
import './ReviewPage.css'

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
  const { user } = useAuth()
  const { reviewQueueDue, updateReviewForQuality, profile } = useUserProgress()
  const { message, toastType, showToast, closeToast } = useToast()
  
  const [completionAnswer, setCompletionAnswer] = useState('')
  const [showCompletionResult, setShowCompletionResult] = useState(false)
  const [completionResultStatus, setCompletionResultStatus] = useState<'correct' | 'close' | 'wrong' | null>(null)
  
  const [showTranslationHint, setShowTranslationHint] = useState(false)
  const [showStructureHint, setShowStructureHint] = useState(false)
  const [showGrammarModal, setShowGrammarModal] = useState(false)
  
  const inputRef = useRef<HTMLInputElement>(null)

  const isTourActive =
    user &&
    profile.jlptLevel !== null &&
    profile.hasCompletedOnboarding === false

  let currentId = reviewQueueDue[0]?.id
  let isMock = false

  if (!currentId && isTourActive) {
    currentId = 'mock-tour'
    isMock = true
  }

  const { item: realItem, isLoading: itemLoading } = useStudyItem(currentId === 'mock-tour' ? '' : (currentId ?? ''))

  const mockItem = useMemo(() => ({
    id: 'mock-tour',
    level: 'N5',
    type: 'grammar',
    japanese: 'は',
    reading: 'wa',
    translation: 'Partícula de tópico',
    explanation: 'A partícula は marca o tópico da frase.',
    structure: '[Substantivo] は [Predicado]',
    examples: []
  }), [])

  const item = isMock ? mockItem as any : realItem
  const current = isMock ? { id: 'mock-tour' } : reviewQueueDue[0]

  const mockSentence = useMemo(() => ({
    sentence: "これ____何ですか。",
    translation: "O que é isto?",
    answers: ["は", "wa"]
  }), [])

  const completionSentence = useMemo<ReviewSentence | null>(() => {
    if (isMock) return mockSentence
    if (!item?.review_sentences || item.review_sentences.length === 0) return null
    const index = Math.floor(Math.random() * item.review_sentences.length)
    return item.review_sentences[index]
  }, [item?.id, isMock, mockSentence])

  if (current && itemLoading && !isMock) {
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

      if (isMock) {
        showToast('Esta foi apenas uma demonstração prática do tour!')
        return
      }

      const toastMsg =
        quality === 'forgot'
          ? 'Você verá este item novamente hoje.'
          : quality === 'continue'
          ? 'Você verá este item novamente em alguns dias.'
          : 'Item dominado! Não será mais revisado.'

      showToast(toastMsg)
      updateReviewForQuality(current.id, quality)
    },
    [current, showToast, updateReviewForQuality, isMock],
  )

  const handleCheckCompletion = useCallback(() => {
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

    if (isMock) {
      setTimeout(() => {
        window.dispatchEvent(new Event('tour-next-step'))
      }, 100)
    }
  }, [completionSentence, completionAnswer, isMock])

  useEffect(() => {
    const handleForceVerify = () => handleCheckCompletion()
    window.addEventListener('tour-force-verify', handleForceVerify)
    return () => window.removeEventListener('tour-force-verify', handleForceVerify)
  }, [handleCheckCompletion])

  const renderInlineSentence = () => {
    if (!completionSentence) return null
    
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
              
              {/* Botões de Dica */}
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

              {/* Dica de Tradução */}
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

              {/* Input de Frase Inline */}
              {renderInlineSentence()}

              {/* Botão de Verificação */}
              {!showCompletionResult && (
                <div className="review-verify-action">
                  <button
                    className="button button--primary"
                    type="button"
                    onClick={handleCheckCompletion}
                    disabled={completionAnswer.trim() === '' && !isMock}
                  >
                    Verificar
                  </button>
                </div>
              )}

              {/* Feedback Simples */}
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
                    <button className="button button-show-info" type="button" onClick={() => setShowGrammarModal(true)}>
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

      {/* Modal de Gramática */}
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
                  {item.examples.map((example: any) => (
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
