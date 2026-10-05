import { useCallback, useEffect, useMemo, useState, useRef, Fragment } from 'react'
import { Flashcard } from '../components/Flashcard'
import { useAuth } from '../hooks/useAuth'
import { useUserProgress } from '../hooks/useUserProgress'
import { useStudyItem } from '../hooks/useStudyData'
import { useToast } from '../hooks/useToast'
import { Toast } from '../components/Toast'
import { HighlightedText } from './StudyItemPage'
import type { ReviewSentence } from '../types/study'
import * as wanakana from 'wanakana'
import { Lightbulb, Languages, CheckCircle, XCircle, AlertCircle, Info, X, Volume2 } from 'lucide-react'
import { Link } from 'react-router-dom'
import { useTourRunning } from '../hooks/useTourState'
import { useDailyGoal } from '../hooks/usePreferences'
import { playJapaneseAudio } from '../utils/tts'
import { StreakFlame } from '../components/Logo'
import './ReviewPage.css'

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

const JAPANESE_CHAR_PATTERN = /[\p{Script=Han}\p{Script=Hiragana}\p{Script=Katakana}]/u

type SessionStats = {
  reviewed: number
  remembered: number
  continued: number
  forgot: number
  firstTryCorrect: number
}

const EMPTY_SESSION: SessionStats = { reviewed: 0, remembered: 0, continued: 0, forgot: 0, firstTryCorrect: 0 }

function isTypingTarget(target: EventTarget | null) {
  if (!(target instanceof HTMLElement)) return false
  if (target.isContentEditable) return true
  if (target instanceof HTMLTextAreaElement || target instanceof HTMLSelectElement) return true
  return target instanceof HTMLInputElement && !target.disabled
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
  const [session, setSession] = useState<SessionStats>(EMPTY_SESSION)
  const [isPlayingAudio, setIsPlayingAudio] = useState(false)
  const { registerReview } = useDailyGoal(user?.id)
  const isTourRunning = useTourRunning()

  const isTourActive =
    (user &&
      profile.jlptLevel !== null &&
      profile.hasCompletedOnboarding === false) ||
    isTourRunning

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
      registerReview()
      setSession((prev) => ({
        reviewed: prev.reviewed + 1,
        remembered: prev.remembered + (quality === 'remembered' ? 1 : 0),
        continued: prev.continued + (quality === 'continue' ? 1 : 0),
        forgot: prev.forgot + (quality === 'forgot' ? 1 : 0),
        firstTryCorrect: prev.firstTryCorrect + (completionResultStatus === 'correct' ? 1 : 0),
      }))
    },
    [current, showToast, updateReviewForQuality, isMock, registerReview, completionResultStatus],
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

  const fullSentence = useMemo(() => {
    if (!completionSentence) return ''
    const answer =
      completionSentence.answers.find((candidate) => JAPANESE_CHAR_PATTERN.test(candidate)) ??
      completionSentence.answers[0] ??
      ''
    return completionSentence.sentence.replace(/_{2,}/, answer)
  }, [completionSentence])

  const handlePlayAudio = useCallback(async (text: string) => {
    if (!text || isPlayingAudio) return
    setIsPlayingAudio(true)
    try {
      await playJapaneseAudio(text)
    } catch (error) {
      console.error('Erro ao reproduzir áudio:', error)
      showToast('Erro ao reproduzir áudio. Tente novamente.')
    } finally {
      setIsPlayingAudio(false)
    }
  }, [isPlayingAudio, showToast])

  const handlePlaySentence = useCallback(() => handlePlayAudio(fullSentence), [handlePlayAudio, fullSentence])

  // Atalhos de teclado depois de verificar: 1/2/3 avaliam, I abre a explicação, O toca o áudio
  useEffect(() => {
    if (!current || !item || !completionSentence) return

    const handleKeyDown = (event: KeyboardEvent) => {
      if (event.defaultPrevented || event.repeat || event.altKey || event.ctrlKey || event.metaKey) return

      if (showGrammarModal) {
        if (event.key === 'Escape') setShowGrammarModal(false)
        return
      }

      if (!showCompletionResult || isTypingTarget(event.target)) return

      const key = event.key.toLowerCase()
      if (key === 'i') {
        setShowGrammarModal(true)
      } else if (key === 'o') {
        handlePlaySentence()
      } else if (key === '1') {
        handleQuality('forgot')
      } else if (key === '2') {
        handleQuality('continue')
      } else if (key === '3' && completionResultStatus === 'correct') {
        handleQuality('remembered')
      }
    }

    window.addEventListener('keydown', handleKeyDown)
    return () => window.removeEventListener('keydown', handleKeyDown)
  }, [current, item, completionSentence, showGrammarModal, showCompletionResult, completionResultStatus, handleQuality, handlePlaySentence])

  if (current && itemLoading && !isMock) {
    return (
      <main className="page">
        <header className="page__header">
          <span className="page__eyebrow">revisão</span>
          <h1>Revisão</h1>
          <p>Use este espaço para revisar os itens estudados.</p>
        </header>
        <p className="empty-state">Carregando item de revisão...</p>
      </main>
    )
  }

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
        <span className="page__eyebrow">revisão{reviewQueueDue.length > 0 ? ` · ${reviewQueueDue.length} na fila` : ''}</span>
        <h1>Revisão</h1>
        <p>Use este espaço para revisar os itens estudados.</p>
      </header>

      {current && item ? (
        completionSentence ? (
          <section className="flashcard">
            <header className="flashcard__header">
              <p className="flashcard__meta">{item.level} · {item.type} · completar frase</p>
            </header>
            <div className="flashcard__content">
              
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
                    Verificar <span className="kbd">Enter</span>
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

                  <button
                    type="button"
                    className="review-listen"
                    onClick={handlePlaySentence}
                    disabled={isPlayingAudio}
                  >
                    <Volume2 size={16} /> {isPlayingAudio ? 'Tocando...' : 'Ouvir frase'} <span className="kbd">O</span>
                  </button>

                  <div className="review-actions">
                    <button className="button button--ghost button-show-info" type="button" onClick={() => setShowGrammarModal(true)}>
                      <Info size={17} /> Ver explicação <span className="kbd">I</span>
                    </button>
                    {completionResultStatus === 'correct' ? (
                      <>
                        <button className="button button--forgot" type="button" onClick={() => handleQuality('forgot')}>
                          Esqueci <span className="kbd">1</span>
                        </button>
                        <button className="button button--again" type="button" onClick={() => handleQuality('continue')}>
                          Continuar estudando <span className="kbd">2</span>
                        </button>
                        <button className="button button--remembered" type="button" onClick={() => handleQuality('remembered')}>
                          Decorei <span className="kbd">3</span>
                        </button>
                      </>
                    ) : (
                      <>
                        <button className="button button--forgot" type="button" onClick={() => handleQuality('forgot')}>
                          Estudar de novo <span className="kbd">1</span>
                        </button>
                        <button className="button button--primary" type="button" onClick={() => handleQuality('continue')}>
                          Avançar <span className="kbd">2</span>
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
      ) : session.reviewed > 0 ? (
        <section className="session-summary">
          <span className="page__eyebrow">sessão concluída</span>
          <h2 className="session-summary__title">
            Você revisou {session.reviewed} {session.reviewed === 1 ? 'item' : 'itens'}!
          </h2>
          <ul className="session-summary__stats">
            <li className="session-summary__stat session-summary__stat--remembered">
              <span className="session-summary__value">{session.remembered}</span>
              <span className="session-summary__label">decorados</span>
            </li>
            <li className="session-summary__stat session-summary__stat--continue">
              <span className="session-summary__value">{session.continued}</span>
              <span className="session-summary__label">continuar estudando</span>
            </li>
            <li className="session-summary__stat session-summary__stat--forgot">
              <span className="session-summary__value">{session.forgot}</span>
              <span className="session-summary__label">para rever hoje</span>
            </li>
          </ul>
          <p className="session-summary__meta">
            {session.firstTryCorrect > 0 && (
              <>Acertou {session.firstTryCorrect} de primeira. </>
            )}
            <span className="session-summary__streak">
              <StreakFlame size={16} /> Ofensiva de {profile.currentStreak} {profile.currentStreak === 1 ? 'dia' : 'dias'}
            </span>
          </p>
          <div className="session-summary__actions">
            <Link to="/" className="button">Voltar ao início</Link>
            <Link to="/dashboard" className="button button--primary">Ver progresso</Link>
          </div>
        </section>
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
              <X size={20} />
            </button>
            <div className="grammar-modal-header">
              <span className="page__eyebrow">{item.level} · detalhes</span>
              <h2>
                {item.japanese}
              </h2>
              {item.translation && <p className="grammar-modal-translation">{item.translation}</p>}
            </div>

            <p className="completion-result__text preserved-line-breaks">
              {item.explanation}
            </p>
            
            {item.examples.length > 0 && (
              <div className="completion-result__examples">
                <h3>Exemplos</h3>
                <ul>
                  {item.examples.map((example: any) => (
                    <li key={example.japanese}>
                      <div className="completion-result__example-jp">
                        <HighlightedText
                          japanese={example.japanese}
                          reading={example.reading}
                          grammar={item.type === 'grammar' && 'match_regex' in item ? item : undefined}
                        />
                        <button
                          type="button"
                          className="example-item__audio-btn"
                          onClick={() => handlePlayAudio(example.japanese)}
                          aria-label="Reproduzir áudio da frase"
                          disabled={isPlayingAudio}
                        >
                          <Volume2 size={15} strokeWidth={2} />
                        </button>
                      </div>
                      <div className="completion-result__example-tr">{example.translation}</div>
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
