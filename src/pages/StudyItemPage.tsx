import { useMemo, useState } from 'react'
import { useLocation, useNavigate, useParams } from 'react-router-dom'
import { useStudyItem, useStudyData } from '../hooks/useStudyData'
import { useUserProgress } from '../hooks/useUserProgress'
import { useToast } from '../hooks/useToast'
import { Toast } from '../components/Toast'
import { STUDY_TYPES } from '../utils/constants'
import { highlightGrammar } from '../utils/highlight'
import { buildFuriganaMap, isKanji } from '../utils/furigana'
import type { GrammarItem } from '../types'
import { ArrowLeft, ArrowRight, Volume2 } from 'lucide-react'
import { playJapaneseAudio } from '../utils/tts'
import { FuriganaToggle } from '../components/FuriganaToggle'

const JAPANESE_TEXT_PATTERN = /([\p{Script=Han}\p{Script=Hiragana}\p{Script=Katakana}ー。、！？「」『』（）・：；〜…]+)/gu
const JAPANESE_TEXT_SEGMENT_PATTERN = /^[\p{Script=Han}\p{Script=Hiragana}\p{Script=Katakana}ー。、！？「」『』（）・：；〜…]+$/u

function JapaneseHighlightedText({ text }: { text: string }) {
  return (
    <>
      {text.split(JAPANESE_TEXT_PATTERN).map((part, index) =>
        JAPANESE_TEXT_SEGMENT_PATTERN.test(part) ? (
          <span key={index} className="grammar-highlight">{part}</span>
        ) : (
          part
        ),
      )}
    </>
  )
}

function furiganaSpanHTML(text: string, reading: string | null): string {
  const showTooltip = Boolean(reading && reading.trim()) && isKanji(text)
  const isPunctuation = /[。、！？]/.test(text)
  const classes = `furigana-wrapper ${isPunctuation ? 'furigana-punctuation' : ''}`
  let html = `<span class="${classes}">`
  html += `<span class="furigana-target">${text}</span>`
  if (showTooltip) {
    html += `<span class="furigana-tooltip">${reading}</span>`
  }
  html += '</span>'
  return html
}

function generateFuriganaHTML(japanese: string, reading: string): string {
  return buildFuriganaMap(japanese, reading)
    .map((item) => furiganaSpanHTML(item.char, item.reading))
    .join('')
}

function applyFuriganaToHighlightedText(highlightedText: string, reading: string): string {
  if (!highlightedText.includes('<span class="grammar-highlight">')) {
    return generateFuriganaHTML(highlightedText, reading)
  }

  const originalText = highlightedText
    .replace(/<span class="grammar-highlight">/g, '')
    .replace(/<\/span>/g, '')

  // Cada segmento pode ter mais de um caractere (bloco de kanjis), então
  // guardamos a posição dele no texto original para cruzar com os destaques.
  let offset = 0
  const segments = buildFuriganaMap(originalText, reading).map((item) => {
    const segment = { ...item, start: offset, end: offset + item.char.length }
    offset = segment.end
    return segment
  })

  let result = ''
  let textOffset = 0

  const parts = highlightedText.split(/(<span class="grammar-highlight">|<\/span>)/)

  for (const part of parts) {
    if (part === '<span class="grammar-highlight">' || part === '</span>') {
      result += part
      continue
    }
    if (!part) continue

    const partStart = textOffset
    const partEnd = textOffset + part.length

    for (const segment of segments) {
      if (segment.end <= partStart || segment.start >= partEnd) continue

      const sliceStart = Math.max(segment.start, partStart)
      const sliceEnd = Math.min(segment.end, partEnd)
      // Se o destaque cortar um bloco de kanjis, a leitura fica no pedaço inicial
      const segmentReading = sliceStart === segment.start ? segment.reading : null
      result += furiganaSpanHTML(originalText.slice(sliceStart, sliceEnd), segmentReading)
    }

    textOffset = partEnd
  }

  return result
}

function HighlightedText({ japanese, reading, grammar }: { japanese: string; reading?: string; grammar?: GrammarItem }) {
  const highlightedText = useMemo(() => {
    if (!grammar) {
      return reading ? generateFuriganaHTML(japanese, reading) : japanese
    }
    const highlightedPlain = highlightGrammar(japanese, grammar)

    if (reading) {
      return applyFuriganaToHighlightedText(highlightedPlain, reading)
    } else {
      return highlightedPlain
    }
  }, [japanese, reading, grammar])

  return <span dangerouslySetInnerHTML={{ __html: highlightedText }} />
}

export { HighlightedText }

export function StudyItemPage() {
  const params = useParams<{ level: string; type: string; id: string }>()
  const location = useLocation()
  const navigate = useNavigate()

  const { item, isLoading: itemLoading } = useStudyItem(params.id ?? '')
  const { grammar, vocabulary, isLoading: dataLoading } = useStudyData((params.level as any) ?? 'N5')
  const { progress, addToReview, markMastered, resetItemProgress } = useUserProgress()

  const items = params.type === 'grammar' ? grammar : vocabulary
  const currentIndex = params.id ? items.findIndex((study) => study.id === params.id) : -1
  const nextItem = params.id && currentIndex >= 0 && currentIndex < items.length - 1 ? items[currentIndex + 1] : undefined

  const isInReview = useMemo(
    () => progress.reviewQueue.some((reviewItem) => reviewItem.id === item?.id),
    [progress.reviewQueue, item?.id],
  )

  const isMastered = useMemo(
    () => progress.masteredItems.includes(item?.id ?? ''),
    [progress.masteredItems, item?.id],
  )

  const { message, toastType, showToast, closeToast } = useToast()
  const [isResetModalOpen, setIsResetModalOpen] = useState(false)
  const [isPlayingAudio, setIsPlayingAudio] = useState(false)

  const isValidRoute =
    !!params.level &&
    !!params.id &&
    !!params.type &&
    STUDY_TYPES.includes(params.type as any) &&
    !!item &&
    item.type === params.type

  const isLoading = itemLoading || (dataLoading && !item)

  if (!params.id || !params.type || !params.level) {
    return (
      <main className="page">
        <p className="empty-state">Parâmetros da rota inválidos</p>
      </main>
    )
  }

  if (isLoading) {
    return (
      <main className="page">
        <p className="empty-state">Carregando item de estudo...</p>
      </main>
    )
  }

  if (!isValidRoute || !item) {
    return (
      <main className="page">
        <p className="empty-state">Item não encontrado</p>
      </main>
    )
  }

  const { id, type } = params

  const handleMarkMastered = () => {
    markMastered(item.id)
    showToast('Item marcado como dominado — não será adicionado à revisão.')
  }

  const handleResetItemProgress = () => {
    setIsResetModalOpen(true)
  }

  const handleConfirmReset = () => {
    resetItemProgress(item.id)
    showToast('Progresso do item reiniciado.')
    setIsResetModalOpen(false)
  }

  const handleCancelReset = () => {
    setIsResetModalOpen(false)
  }

  const handleAddToReview = () => {
    if (isInReview) {
      showToast('Este item já foi adicionado à revisão.')
      return
    }

    if (isMastered) {
      showToast('Este item já foi dominado e não pode ser enviado para revisão.')
      return
    }

    addToReview(item.id)
    showToast('Item adicionado para revisão!')
  }

  const shouldGoToLevel = Boolean((location.state as any)?.fromLevel)

  const handlePlayAudio = async (text: string) => {
    if (isPlayingAudio) return

    setIsPlayingAudio(true)
    try {
      await playJapaneseAudio(text)
    } catch (error) {
      console.error('Erro ao reproduzir áudio:', error)
      showToast('Erro ao reproduzir áudio. Tente novamente.')
    } finally {
      setIsPlayingAudio(false)
    }
  }

  const handleNext = () => {
    if (!nextItem) return
    window.scrollTo({ top: 0, behavior: 'smooth' })
    navigate(`/level/${params.level}/${type}/${nextItem.id}`, {
      replace: shouldGoToLevel,
      state: { fromLevel: shouldGoToLevel },
    })
  }

  return (
    <main className="page">
      <header className="page__header">
        <div className="page__header-top">
          <button
            type="button"
            className="link-button"
            onClick={() => {
              if (shouldGoToLevel) {
                navigate(`/level/${params.level}?scrollTo=${encodeURIComponent(id ?? '')}`)
              } else {
                navigate(-1)
              }
            }}
          >
            <ArrowLeft size={16} className="link-button__arrow" /> Voltar
          </button>
          <div className="item-status">
            <FuriganaToggle />
            {isMastered ? (
              <span className="item-status__badge item-status__badge--mastered">Dominado</span>
            ) : isInReview ? (
              <span className="item-status__badge item-status__badge--review">Adicionado à revisão</span>
            ) : (
              <span className="item-status__badge item-status__badge--pending">Ainda não adicionado à revisão</span>
            )}
          </div>
        </div>
        <span className="page__eyebrow">
          {params.level.toLowerCase()} · {type === 'grammar' ? 'gramática' : 'vocabulário'} · {id}
        </span>
        <h1 className="grammar-heading">{item.japanese}</h1>
        {item.reading && <p className="subheading">{item.reading}</p>}
        <p className="translation">{item.translation}</p>
      </header>

      {item.structure && (
        <section className="section">
          <h2>Estrutura</h2>
          <p className="structure" style={{ whiteSpace: 'pre-line' }}>
            <JapaneseHighlightedText text={item.structure.replace(/^\r?\n/, '')} />
          </p>
        </section>
      )}

      <section className="section">
        <h2>Explicação</h2>
        <p className="preserved-line-breaks">
          <JapaneseHighlightedText text={item.explanation.replace(/^\r?\n/, '')} />
        </p>
      </section>

      {item.examples.length > 0 && (
        <section className="section">
          <h2>Exemplos</h2>
          <ul className="example-list">
            {item.examples.map((example) => (
              <li key={example.japanese} className="example-item">
                <div className="example-item__japanese">
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
                <div className="example-item__translation">{example.translation}</div>
              </li>
            ))}
          </ul>
        </section>
      )}

      {item.notes && (
        <section className="section">
          <h2>Observações</h2>
          <p className="notes preserved-line-breaks">
            <JapaneseHighlightedText text={item.notes.replace(/^\r?\n/, '')} />
          </p>
        </section>
      )}

      <footer className="actions">
        <div className="actions__group">
          <button className="button" type="button" onClick={handleAddToReview}>
            Revisar
          </button>
          <button className="button button--primary" type="button" onClick={handleMarkMastered}>
            Já sei
          </button>
          <button className="button button--secondary button--danger" type="button" onClick={handleResetItemProgress}>
            Apagar Progresso
          </button>
        </div>

        <div className="next-nav">
          <div className="next-preview">
            <span>Próximo:</span>
            <span className="next-preview__text">
              {nextItem ? nextItem.japanese : '—'}
            </span>
          </div>
          <button
            className="button button--primary"
            type="button"
            onClick={handleNext}
            disabled={!nextItem}
          >
            Próximo <ArrowRight size={16} strokeWidth={2.2} />
          </button>
        </div>
      </footer>

      <Toast message={message} onClose={closeToast} type={toastType} />

      {isResetModalOpen && (
        <div className="modal" role="dialog" aria-modal="true">
          <div className="modal__backdrop" onClick={handleCancelReset} />
          <div className="modal__content">
            <h2>Apagar progresso</h2>
            <p>
              Isso vai apagar o progresso atual deste item e restaurar o estado original.
              Deseja continuar?
            </p>
            <div className="modal__actions">
              <button className="button" type="button" onClick={handleCancelReset}>
                Cancelar
              </button>
              <button className="button button--danger" type="button" onClick={handleConfirmReset}>
                Confirmar
              </button>
            </div>
          </div>
        </div>
      )}
    </main>
  )
}
