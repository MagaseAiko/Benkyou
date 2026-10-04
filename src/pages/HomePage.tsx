import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { ArrowRight } from 'lucide-react'
import { LevelCard } from '../components/LevelCard'
import { JLPT_LEVELS } from '../utils/constants'
import { useUserProgress } from '../hooks/useUserProgress'
import { getAllStudyItems } from '../services/studyDataService'
import type { StudyItem } from '../types'

export function HomePage() {
  const { progress, reviewQueueDue } = useUserProgress()
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

  const today = new Date()
  const day = today.getDate()
  const month = today.toLocaleDateString('pt-BR', { month: 'short' }).replace('.', '')
  const dueCount = reviewQueueDue.length

  return (
    <main className="page">
      <header className="page__header">
        <span className="page__eyebrow">início</span>
        <h1>Vamos estudar!</h1>
        <p>Escolha um nível para ver gramática e vocabulário.</p>
      </header>

      <section className="today-strip" aria-label="Resumo de hoje">
        <div className="today-strip__date" aria-hidden="true">
          <span className="today-strip__day">{day}</span>
          <span className="today-strip__month">{month}</span>
        </div>
        <div className="today-strip__text">
          <p className="today-strip__title">
            {dueCount > 0
              ? `${dueCount} ${dueCount === 1 ? 'item pronto' : 'itens prontos'} para revisar`
              : 'Nenhuma revisão pendente'}
          </p>
          <p className="today-strip__meta">
            {dueCount > 0
              ? 'Revise agora para manter a memória fresca.'
              : 'Aproveite para estudar algo novo hoje.'}
          </p>
        </div>
        {dueCount > 0 && (
          <Link to="/review" className="button button--primary">
            Revisar <ArrowRight size={16} strokeWidth={2.2} />
          </Link>
        )}
      </section>

      <section className="level-grid" data-tour="home-levels">
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
