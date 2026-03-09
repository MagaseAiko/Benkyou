import type { JLPTLevel } from '../types'
import { Link } from 'react-router-dom'

type Props = {
  level: JLPTLevel
  totalItems: number
  studiedItems: number
}

export function LevelCard({ level, totalItems, studiedItems }: Props) {
  return (
    <Link to={`/level/${level}`} className="card level-card">
      <div className="level-card__header">
        <h2>{level}</h2>
        <span className="level-card__badge">{totalItems} itens</span>
      </div>
      <div className="level-card__footer">
        <span>
          Estudados: {studiedItems} / {totalItems}
        </span>
      </div>
    </Link>
  )
}
