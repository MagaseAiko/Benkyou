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

function FuriganaText({ japanese, reading }: { japanese: string; reading: string }) {
  const mapping = useMemo(() => buildFuriganaMap(japanese, reading), [japanese, reading])

  return (
    <span>
      {mapping.map((item, index) => {
        const showTooltip = Boolean(item.reading && item.reading.trim()) && isKanji(item.char)
        const isPunctuation = /[。、！？]/.test(item.char)
        return (
          <span key={`${item.char}-${index}`} className={`furigana-wrapper ${isPunctuation ? 'furigana-punctuation' : ''}`}>
            <span className="furigana-target">{item.char}</span>
            {showTooltip && (
              <span className="furigana-tooltip">{item.reading}</span>
            )}
          </span>
        )
      })}
    </span>
  )
}

function generateFuriganaHTML(japanese: string, reading: string): string {
  const mapping = buildFuriganaMap(japanese, reading)
  return mapping.map((item) => {
    const showTooltip = Boolean(item.reading && item.reading.trim()) && isKanji(item.char)
    const isPunctuation = /[。、！？]/.test(item.char)
    const classes = `furigana-wrapper ${isPunctuation ? 'furigana-punctuation' : ''}`
    let html = `<span class="${classes}">`
    html += `<span class="furigana-target">${item.char}</span>`
    if (showTooltip) {
      html += `<span class="furigana-tooltip">${item.reading}</span>`
    }
    html += '</span>'
    return html
  }).join('')
}

function applyFuriganaToHighlightedText(highlightedText: string, reading: string): string {
  if (!highlightedText.includes('<span class="grammar-highlight">')) {
    return generateFuriganaHTML(highlightedText, reading)
  }

  const originalText = highlightedText
    .replace(/<span class="grammar-highlight">/g, '')
    .replace(/<\/span>/g, '')

  const mapping = buildFuriganaMap(originalText, reading)

  let result = ''
  let mappingIndex = 0

  const parts = highlightedText.split(/(<span class="grammar-highlight">|<\/span>)/)

  for (const part of parts) {
    if (part === '<span class="grammar-highlight">') {
      result += part
    } else if (part === '</span>') {
      result += part
    } else if (part) {
      for (let i = 0; i < part.length; i++) {
        if (mappingIndex < mapping.length) {
          const item = mapping[mappingIndex]
          const showTooltip = Boolean(item.reading && item.reading.trim()) && isKanji(item.char)
          const isPunctuation = /[。、！？]/.test(item.char)
          const classes = `furigana-wrapper ${isPunctuation ? 'furigana-punctuation' : ''}`

          result += `<span class="${classes}">`
          result += `<span class="furigana-target">${item.char}</span>`
          if (showTooltip) {
            result += `<span class="furigana-tooltip">${item.reading}</span>`
          }
          result += '</span>'

          mappingIndex++
        }
      }
    }
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
      const response = await fetch('https://api.deepgram.com/v1/speak?model=aura-2-fujin-ja', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token 1f9c4cbfd649eaa2c3dbf76bac8be178bc75f965',
        },
        body: JSON.stringify({ text }),
      })

      if (!response.ok) {
        throw new Error(`Erro na requisição: ${response.statusText}`)
      }

      const audioBlob = await response.blob()
      const audioUrl = URL.createObjectURL(audioBlob)
      const audio = new Audio(audioUrl)

      audio.onended = () => {
        setIsPlayingAudio(false)
        URL.revokeObjectURL(audioUrl)
      }

      audio.onerror = () => {
        setIsPlayingAudio(false)
        showToast('Erro ao reproduzir áudio.')
        URL.revokeObjectURL(audioUrl)
      }

      audio.play()
    } catch (error) {
      console.error('Erro ao reproduzir áudio:', error)
      showToast('Erro ao reproduzir áudio. Tente novamente.')
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
            ← Voltar
          </button>
          <div className="item-status">
            {isMastered ? (
              <span className="item-status__badge item-status__badge--mastered">Dominado</span>
            ) : isInReview ? (
              <span className="item-status__badge item-status__badge--review">Adicionado à revisão</span>
            ) : (
              <span className="item-status__badge item-status__badge--pending">Ainda não adicionado à revisão</span>
            )}
          </div>
        </div>
        <h1 className="grammar-heading">
          {item.reading ? (
            <FuriganaText japanese={item.japanese} reading={item.reading} />
          ) : (
            item.japanese
          )}
        </h1>
        {item.reading && <p className="subheading">{item.reading}</p>}
        <p className="translation">{item.translation}</p>
      </header>

      {item.structure && (
        <section className="section">
          <h2>Estrutura</h2>
          <p className="structure" style={{ whiteSpace: 'pre-line' }}>
            {item.structure}
          </p>
        </section>
      )}

      <section className="section">
        <h2>Explicação</h2>
        <p>{item.explanation}</p>
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
                    🔊
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
          <p className="notes">{item.notes}</p>
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
              {nextItem ? (
                <FuriganaText japanese={nextItem.japanese} reading={nextItem.reading ?? ''} />
              ) : (
                '—'
              )}
            </span>
          </div>
          <button
            className="button button--primary"
            type="button"
            onClick={handleNext}
            disabled={!nextItem}
          >
            Próximo
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
              <button className="button button--primary" type="button" onClick={handleConfirmReset}>
                Confirmar
              </button>
            </div>
          </div>
        </div>
      )}
    </main>
  )
}
