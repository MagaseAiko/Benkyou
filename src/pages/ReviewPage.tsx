import { useCallback, useEffect, useState } from 'react'
import { Flashcard } from '../components/Flashcard'
import { useReviewSystem } from '../hooks/useReviewSystem'
import { useStudyItem } from '../hooks/useStudyData'

export function ReviewPage() {
  const { reviewQueueDue, updateReviewForQuality } = useReviewSystem()

  const [toastMessage, setToastMessage] = useState<string | null>(null)

  const current = reviewQueueDue[0]
  const item = useStudyItem(current?.id ?? '')

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

  return (
    <main className="page">
      <header className="page__header">
        <h1>Revisão</h1>
        <p>Use este espaço para revisar os itens estudados.</p>
      </header>

      {current && item ? (
        <Flashcard item={item} onQuality={handleQuality} />
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
