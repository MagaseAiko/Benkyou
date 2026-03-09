import { useCallback, useEffect, useState } from 'react'
import { useNavigate, useParams, Navigate } from 'react-router-dom'
import { useStudyItem } from '../hooks/useStudyData'
import { useReviewSystem } from '../hooks/useReviewSystem'
import { STUDY_TYPES } from '../utils/constants'

export function StudyItemPage() {
  const params = useParams<{ level: string; type: string; id: string }>()
  const navigate = useNavigate()
  const { id, type } = params

  const item = useStudyItem(id ?? '')
  const { addToReview, markMastered, resetItemProgress } = useReviewSystem()

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
    window.setTimeout(() => navigate(-1), 2000)
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

  return (
    <main className="page">
      <header className="page__header">
        <button type="button" className="link-button" onClick={() => navigate(-1)}>
        ← Voltar
        </button>
        <h1>{item.japanese}</h1>
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
                <div className="example-item__japanese">{example.japanese}</div>
                {example.reading && <div className="example-item__reading">{example.reading}</div>}
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
        <button className="button" type="button" onClick={handleAddToReview}>
          Revisar
        </button>
        <button className="button button--primary" type="button" onClick={handleMarkMastered}>
          Já sei
        </button>
        <button className="button button--secondary" type="button" onClick={handleResetItemProgress}>
          Apagar Progresso
        </button>
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
