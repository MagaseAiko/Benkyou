import { useCallback } from 'react'
import { useNavigate } from 'react-router-dom'
import { Flashcard } from '../components/Flashcard'
import { useReviewSystem } from '../hooks/useReviewSystem'
import { useStudyItem } from '../hooks/useStudyData'

export function ReviewPage() {
  const navigate = useNavigate()
  const { reviewQueueDue, updateReviewForQuality } = useReviewSystem()

  const current = reviewQueueDue[0]
  const item = useStudyItem(current?.id ?? '')

  const handleQuality = useCallback(
    (quality: 'forgot' | 'continue' | 'remembered') => {
      if (!current) return
      updateReviewForQuality(current.id, quality)
    },
    [current, updateReviewForQuality],
  )

  return (
    <main className="page">
      <header className="page__header">
        <button type="button" className="link-button" onClick={() => navigate(-1)}>
          ← Voltar
        </button>
        <h1>Revisão</h1>
        <p>Use este espaço para revisar itens com repetição espaçada.</p>
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
    </main>
  )
}
