import { useMemo } from 'react'
import { useReviewSystem } from '../hooks/useReviewSystem'
import { findStudyItemById, getAllStudyItems, getTotalItemsByLevel } from '../services/studyDataService'
import { JLPT_LEVELS } from '../utils/constants'

export function DashboardPage() {
  const { progress, reviewQueueDue } = useReviewSystem()

  const allStudyItems = useMemo(() => getAllStudyItems(), [])
  const totalItems = allStudyItems.length
  const studiedCount = progress.studyingItems.length + progress.masteredItems.length
  const studiedPercent = totalItems ? Math.round((studiedCount / totalItems) * 100) : 0
  const remainingCount = Math.max(0, totalItems - studiedCount)

  const reviewDistribution = useMemo(() => {
    const now = Date.now()
    const endOfToday = new Date()
    endOfToday.setHours(23, 59, 59, 999)

    const endOfWeek = new Date()
    endOfWeek.setDate(endOfWeek.getDate() + 7)
    endOfWeek.setHours(23, 59, 59, 999)

    const buckets = {
      now: 0,
      today: 0,
      thisWeek: 0,
      later: 0,
    }

    progress.reviewQueue.forEach((item) => {
      if (item.nextReview <= now) {
        buckets.now += 1
      } else if (item.nextReview <= endOfToday.getTime()) {
        buckets.today += 1
      } else if (item.nextReview <= endOfWeek.getTime()) {
        buckets.thisWeek += 1
      } else {
        buckets.later += 1
      }
    })

    return buckets
  }, [progress.reviewQueue])

  const nextReviewItems = useMemo(() => {
    return [...progress.reviewQueue]
      .sort((a, b) => a.nextReview - b.nextReview)
      .slice(0, 5)
      .map((item) => ({
        ...item,
        studyItem: findStudyItemById(item.id),
      }))
  }, [progress.reviewQueue])

  const statsByLevel = useMemo(() => {
    const studiedSet = new Set([...progress.studyingItems, ...progress.masteredItems])

    return JLPT_LEVELS.map((level) => {
      const total = getTotalItemsByLevel(level)
      const studied = allStudyItems.filter((item) => item.level === level && studiedSet.has(item.id)).length

      return { level, total, studied }
    })
  }, [allStudyItems, progress.masteredItems, progress.studyingItems])

  return (
    <main className="page">
      <header className="page__header">
        <h1>Dashboard</h1>
        <p>Visão geral do seu progresso.</p>
      </header>

      <section className="section stats">
        <div className="stat-card">
          <h3>Total de itens</h3>
          <p className="stat-value">{totalItems}</p>
        </div>
        <div className="stat-card">
          <h3>Estudados</h3>
          <p className="stat-value">{studiedCount}</p>
          <p className="stat-note">{studiedPercent}% concluído</p>
        </div>
        <div className="stat-card">
          <h3>Dominados</h3>
          <p className="stat-value">{progress.masteredItems.length}</p>
        </div>
        <div className="stat-card">
          <h3>Itens em revisão</h3>
          <p className="stat-value">{progress.reviewQueue.length}</p>
          <p className="stat-note">{reviewQueueDue.length} prontos para revisar</p>
        </div>
      </section>

      <section className="section">
        <h2>Progresso geral</h2>
        <div className="progress-overview">
          <div className="progress-overview__meta">
            <span>
              {studiedCount} / {totalItems} estudados
            </span>
            <span>{studiedPercent}%</span>
          </div>
          <div className="progress-overview__bar" aria-label="Progresso geral">
            <div
              className="progress-overview__fill"
              style={{ width: `${studiedPercent}%` }}
            />
          </div>
          {remainingCount > 0 && (
            <p className="stat-note">{remainingCount} itens restantes para completar o conjunto</p>
          )}
        </div>
      </section>

      <section className="section">
        <h2>Progresso por nível</h2>
        <ul className="progress-list">
          {statsByLevel.map((row) => {
            const percent = row.total ? Math.round((row.studied / row.total) * 100) : 0
            return (
              <li key={row.level} className="progress-item">
                <span className="progress-item__level">{row.level}</span>
                <div className="level-progress">
                  <div
                    className="level-progress__fill"
                    style={{ width: `${percent}%` }}
                  />
                </div>
                <span className="progress-item__count">
                  {row.studied} / {row.total} ({percent}%)
                </span>
              </li>
            )
          })}
        </ul>
      </section>

      <section className="section">
        <h2>Agenda de revisão</h2>
        <div className="review-grid">
          <div className="review-card">
            <h3>Próximas revisões</h3>
            <ul className="review-distribution">
              <li>
                <span>Agora</span>
                <span>{reviewDistribution.now}</span>
              </li>
              <li>
                <span>Hoje</span>
                <span>{reviewDistribution.today}</span>
              </li>
              <li>
                <span>Até 7 dias</span>
                <span>{reviewDistribution.thisWeek}</span>
              </li>
              <li>
                <span>Depois</span>
                <span>{reviewDistribution.later}</span>
              </li>
            </ul>
          </div>
          <div className="review-card">
            <h3>Próximos itens</h3>
            {nextReviewItems.length === 0 ? (
              <p className="empty-state">Nenhum item agendado para revisão.</p>
            ) : (
              <ul className="progress-list">
                {nextReviewItems.map((item) => (
                  <li key={item.id} className="progress-item">
                    <span className="progress-item__level">
                      {item.studyItem?.japanese ?? item.id}
                    </span>
                    <span className="progress-item__count">
                      {new Date(item.nextReview).toLocaleString(undefined, {
                        day: '2-digit',
                        month: '2-digit',
                        hour: '2-digit',
                        minute: '2-digit',
                      })}
                    </span>
                  </li>
                ))}
              </ul>
            )}
          </div>
        </div>
      </section>
    </main>
  )
}
