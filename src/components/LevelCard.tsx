import type { JLPTLevel } from '../types'
import { Link } from 'react-router-dom'
import { ArrowRight } from 'lucide-react'

type Props = {
  level: JLPTLevel
  totalItems: number
  studiedItems: number
}

const LEVEL_LABELS: Record<JLPTLevel, string> = {
  N5: 'iniciante',
  N4: 'básico',
  N3: 'intermediário',
  N2: 'avançado',
  N1: 'fluente',
}

export function LevelCard({ level, totalItems, studiedItems }: Props) {
  const percent = totalItems ? Math.round((studiedItems / totalItems) * 100) : 0

  return (
    <Link to={`/level/${level}`} className={`card level-card level-card--${level.toLowerCase()}`}>
      <div className="level-card__top">
        <h2 className="level-card__level">{level}</h2>
        <span className="level-card__label">{LEVEL_LABELS[level]}</span>
      </div>
      <div className="level-card__body">
        <div
          className="level-card__progress"
          role="progressbar"
          aria-valuenow={percent}
          aria-valuemin={0}
          aria-valuemax={100}
          aria-label={`Progresso do nível ${level}`}
        >
          <div className="level-card__progress-fill" style={{ width: `${percent}%` }} />
        </div>
        <div className="level-card__footer">
          <span className="level-card__count">
            {studiedItems}/{totalItems} estudados
          </span>
          <ArrowRight size={16} className="level-card__arrow" />
        </div>
      </div>
    </Link>
  )
}
