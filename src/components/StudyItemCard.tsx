import type { StudyItem } from '../types'
import { Link } from 'react-router-dom'
import { useReviewSystem } from '../hooks/useReviewSystem'

type Props = {
  item: StudyItem
}

export function StudyItemCard({ item }: Props) {
  const { progress } = useReviewSystem()

  const isStudiedOrReviewing =
    progress.masteredItems.includes(item.id) ||
    progress.studyingItems.includes(item.id) ||
    progress.reviewQueue.some((review) => review.id === item.id)

  return (
    <li id={`study-item-${item.id}`} className="study-item-card">
      <Link
        to={`/level/${item.level}/${item.type}/${item.id}`}
        state={{ fromLevel: true }}
        className="study-item-card__link"
      >
        <div className="study-item-card__header">
          <label className="study-item-card__checkbox">
            <input type="checkbox" checked={isStudiedOrReviewing} disabled />
            <div className="checkmark"></div>
          </label>
          <span className="study-item-card__id">{item.id}</span>
        </div>
        <div className="study-item-card__main">
          <strong className="study-item-card__japanese">{item.japanese}</strong>
          {item.reading && <span className="study-item-card__reading">{item.reading}</span>}
        </div>
        <div className="study-item-card__translation">{item.translation}</div>
      </Link>
    </li>
  )
}
