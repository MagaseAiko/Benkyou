import { useCallback, useEffect, useMemo, useState } from 'react'
import { useLocation, useNavigate, useParams, Navigate } from 'react-router-dom'
import { useStudyItem, useStudyData } from '../hooks/useStudyData'
import { useReviewSystem } from '../hooks/useReviewSystem'
import { STUDY_TYPES } from '../utils/constants'

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
        // no more kana, take rest
        const rest = reading.slice(rIdx) || ''
        result.push({ char, reading: rest })
        rIdx = reading.length
      } else {
        // try to find boundary in reading where next kana begins
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

    // Fallback: just render plain
    const readChar = reading[rIdx] ?? ''
    result.push({ char, reading: readChar })
    rIdx += 1
  }

  return result
}

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

export function StudyItemPage() {
  const params = useParams<{ level: string; type: string; id: string }>()
  const location = useLocation()
  const navigate = useNavigate()
  const { id, type } = params

  const item = useStudyItem(id ?? '')
  const studyData = useStudyData(params.level as any)
  const { addToReview, markMastered, resetItemProgress } = useReviewSystem()

  const items = type === 'grammar' ? studyData.grammar : studyData.vocabulary
  const currentIndex = items.findIndex((study) => study.id === id)
  const nextItem = currentIndex >= 0 && currentIndex < items.length - 1 ? items[currentIndex + 1] : undefined

  const [toastMessage, setToastMessage] = useState<string | null>(null)
  const [isResetModalOpen, setIsResetModalOpen] = useState(false)

  const isValidRoute =
    !!params.level &&
    !!id &&
    !!type &&
    STUDY_TYPES.includes(type as any) &&
    !!item &&
    item.type === type

  if (!isValidRoute || !item) {
    return <Navigate to="/" replace />
  }

  const showToast = useCallback((message: string) => {
    setToastMessage(message)
  }, [])

  useEffect(() => {
    if (!toastMessage) return
    const timer = window.setTimeout(() => setToastMessage(null), 2500)
    return () => window.clearTimeout(timer)
  }, [toastMessage])

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
    addToReview(item.id)
    showToast('Item adicionado para revisão!')
  }

  const shouldGoToLevel = Boolean((location.state as any)?.fromLevel)

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
        <h1>
          {item.reading ? (
            <FuriganaText japanese={item.japanese} reading={item.reading} />
          ) : (
            item.japanese
          )}
        </h1>
        {item.reading && <p className="subheading">{item.reading}</p>}
        <p className="translation">{item.translation}</p>
      </header>

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
                  {example.reading ? (
                    <FuriganaText japanese={example.japanese} reading={example.reading} />
                  ) : (
                    example.japanese
                  )}
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
          <button className="button button--secondary" type="button" onClick={handleResetItemProgress}>
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
