import { useEffect, useMemo, useState } from 'react'
import { LevelCard } from '../components/LevelCard'
import { JLPT_LEVELS } from '../utils/constants'
import { useUserProgress } from '../hooks/useUserProgress'
import { getAllStudyItems } from '../services/studyDataService'
import type { StudyItem } from '../types'

export function HomePage() {
  const { progress } = useUserProgress()
  const [allItems, setAllItems] = useState<StudyItem[]>([])

  useEffect(() => {
    let isMounted = true

    getAllStudyItems()
      .then((items) => {
        if (!isMounted) return
        setAllItems(items)
      })
      .catch((error) => {
        console.error('Erro ao carregar itens:', error)
      })

    return () => {
      isMounted = false
    }
  }, [])

  const itemsByLevel = useMemo(() => {
    const studiedSet = new Set([...progress.studyingItems, ...progress.masteredItems])
    const counts: Record<string, number> = {}

    allItems.forEach((item) => {
      if (!counts[item.level]) counts[item.level] = 0
      if (studiedSet.has(item.id)) {
        counts[item.level] += 1
      }
    })

    return counts
  }, [allItems, progress.masteredItems, progress.studyingItems])

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
            totalItems={allItems.filter((item) => item.level === level).length}
            studiedItems={itemsByLevel[level] ?? 0}
          />
        ))}
      </section>
    </main>
  )
}
