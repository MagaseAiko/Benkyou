import { useMemo } from 'react'
import { LevelCard } from '../components/LevelCard'
import { JLPT_LEVELS } from '../utils/constants'
import { useReviewSystem } from '../hooks/useReviewSystem'
import { getAllStudyItems, getTotalItemsByLevel } from '../services/studyDataService'

export function HomePage() {
  const { progress } = useReviewSystem()

  const itemsByLevel = useMemo(() => {
    const allItems = getAllStudyItems()
    const studiedSet = new Set([...progress.studyingItems, ...progress.masteredItems])
    const counts: Record<string, number> = {}

    allItems.forEach((item) => {
      if (!counts[item.level]) counts[item.level] = 0
      if (studiedSet.has(item.id)) {
        counts[item.level] += 1
      }
    })

    return counts
  }, [progress.masteredItems, progress.studyingItems])

  return (
    <main className="page">
      <header className="page__header">
        <h1>Vamos estudar!</h1>
        <p>Escolha um nível para ver gramática e vocabulário.</p>
      </header>

      <section className="card-grid">
        {JLPT_LEVELS.map((level) => (
          <LevelCard
            key={level}
            level={level}
            totalItems={getTotalItemsByLevel(level)}
            studiedItems={itemsByLevel[level] ?? 0}
          />
        ))}
      </section>
    </main>
  )
}
