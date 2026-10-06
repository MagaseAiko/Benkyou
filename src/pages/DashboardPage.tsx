import { useEffect, useMemo, useState } from 'react'
import {
  BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer,
  PieChart, Pie, Cell as PieCell
} from 'recharts'
import { Trophy, Library, CircleCheck, Star, Clock, ChartColumn, ChartPie } from 'lucide-react'
import { useUserProgress } from '../hooks/useUserProgress'
import { findStudyItemById, getAllStudyItems } from '../services/studyDataService'
import { JLPT_LEVELS } from '../utils/constants'
import type { StudyItem } from '../types'
import { StreakFlame } from '../components/Logo'
import { ActivityCalendar } from '../components/ActivityCalendar'
import './DashboardPage.css'

export function DashboardPage() {
  const { progress, reviewQueueDue, profile } = useUserProgress()
  const [allStudyItems, setAllStudyItems] = useState<StudyItem[]>([])

  useEffect(() => {
    let isMounted = true

    getAllStudyItems()
      .then((items) => {
        if (!isMounted) return
        setAllStudyItems(items)
      })
      .catch((error) => {
        console.error('Erro ao carregar itens:', error)
      })

    return () => {
      isMounted = false
    }
  }, [])

  const totalItems = allStudyItems.length
  const studiedCount = progress.studyingItems.length + progress.masteredItems.length
  const studiedPercent = totalItems ? Math.round((studiedCount / totalItems) * 100) : 0

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

    return [
      { name: 'Agora', value: buckets.now, fill: 'var(--rose)' },
      { name: 'Hoje', value: buckets.today, fill: 'var(--butter)' },
      { name: 'Esta Semana', value: buckets.thisWeek, fill: 'var(--lilac)' },
      { name: 'Depois', value: buckets.later, fill: 'var(--mint)' },
    ]
  }, [progress.reviewQueue])

  const nextReviewItems = useMemo(() => {
    return [...progress.reviewQueue]
      .sort((a, b) => a.nextReview - b.nextReview)
      .slice(0, 5)
      .map((item) => ({
        ...item,
        // Recalcula quando a lista completa chega (antes mostrava só o id)
        studyItem: allStudyItems.find((studyItem) => studyItem.id === item.id) ?? findStudyItemById(item.id),
      }))
  }, [progress.reviewQueue, allStudyItems])

  const statsByLevel = useMemo(() => {
    const studiedSet = new Set([...progress.studyingItems, ...progress.masteredItems])

    return JLPT_LEVELS.map((level) => {
      const studied = allStudyItems.filter((item) => item.level === level && studiedSet.has(item.id)).length

      return { level, studied }
    })
  }, [allStudyItems, progress.masteredItems, progress.studyingItems])

  const scheduledSlices = reviewDistribution.filter((entry) => entry.value > 0)

  const CustomTooltip = ({ active, payload, label }: any) => {
    if (active && payload && payload.length) {
      return (
        <div className="custom-tooltip">
          <p className="label">{label || payload[0].name}</p>
          <p className="desc">{`${payload[0].value} itens`}</p>
        </div>
      );
    }
    return null;
  };

  return (
    <main className="dashboard-container">
      <header className="dashboard-header">
        <div className="page__header">
          <span className="page__eyebrow">dashboard</span>
          <h1>Seu progresso</h1>
          <p>Bem-vindo de volta! Aqui está o seu progresso.</p>
        </div>

        <div className="streak-container">
          <div className="streak-card current">
            <div className="icon"><StreakFlame size={24} /></div>
            <div className="streak-info">
              <h4>Ofensiva atual</h4>
              <p className="value">{profile.currentStreak} <small>dias</small></p>
            </div>
          </div>
          <div className="streak-card longest">
            <div className="icon"><Trophy size={20} strokeWidth={1.8} /></div>
            <div className="streak-info">
              <h4>Maior ofensiva</h4>
              <p className="value">{profile.longestStreak} <small>dias</small></p>
            </div>
          </div>
        </div>
      </header>

      <section className="stats-grid">
        <div className="stat-box">
          <div className="stat-box__top">
            <span className="stat-title">Total de itens</span>
            <Library className="stat-icon" size={20} strokeWidth={1.8} />
          </div>
          <span className="stat-value">{totalItems}</span>
          <span className="stat-desc">Cadastrados no sistema</span>
        </div>
        <div className="stat-box highlight">
          <div className="stat-box__top">
            <span className="stat-title">Estudados</span>
            <CircleCheck className="stat-icon" size={20} strokeWidth={1.8} />
          </div>
          <span className="stat-value">{studiedCount}</span>
          <div className="stat-meter" aria-hidden="true">
            <span style={{ width: `${studiedPercent}%` }} />
          </div>
          <span className="stat-desc">{studiedPercent}% concluído</span>
        </div>
        <div className="stat-box mastered">
          <div className="stat-box__top">
            <span className="stat-title">Dominados</span>
            <Star className="stat-icon" size={20} strokeWidth={1.8} />
          </div>
          <span className="stat-value">{progress.masteredItems.length}</span>
          <span className="stat-desc">Aprendizado consolidado</span>
        </div>
        <div className="stat-box review">
          <div className="stat-box__top">
            <span className="stat-title">Em revisão</span>
            <Clock className="stat-icon" size={20} strokeWidth={1.8} />
          </div>
          <span className="stat-value">{progress.reviewQueue.length}</span>
          <span className="stat-desc">{reviewQueueDue.length} prontos agora</span>
        </div>
      </section>

      <ActivityCalendar lastActivityDate={profile.lastActivityDate} />

      <section className="charts-grid">
        <div className="chart-card">
          <h3>
            <ChartColumn size={18} strokeWidth={1.8} />
            Progresso por nível
          </h3>
          <div className="chart-container">
            <ResponsiveContainer width="100%" height="100%">
              <BarChart data={statsByLevel} margin={{ top: 20, right: 12, left: -20, bottom: 5 }}>
                <XAxis dataKey="level" stroke="var(--ink-faint)" fontSize={12} tickLine={false} axisLine={false} />
                <YAxis stroke="var(--ink-faint)" fontSize={12} tickLine={false} axisLine={false} allowDecimals={false} />
                <Tooltip content={<CustomTooltip />} cursor={{ fill: 'var(--paper-sunk)' }} />
                <Bar dataKey="studied" fill="var(--lilac)" stroke="var(--edge)" strokeWidth={1.5} radius={[6, 6, 0, 0]} maxBarSize={46} />
              </BarChart>
            </ResponsiveContainer>
          </div>
        </div>

        <div className="chart-card">
          <h3>
            <ChartPie size={18} strokeWidth={1.8} />
            Revisões agendadas
          </h3>
          <div className="chart-container chart-container--pie">
            {scheduledSlices.length === 0 ? (
              <p className="chart-empty">Nenhuma revisão agendada ainda.</p>
            ) : (
              <ResponsiveContainer width="100%" height="100%">
                <PieChart>
                  <Pie
                    data={scheduledSlices}
                    innerRadius={58}
                    outerRadius={82}
                    paddingAngle={3}
                    dataKey="value"
                    stroke="var(--edge)"
                    strokeWidth={1.5}
                  >
                    {scheduledSlices.map((entry) => (
                      <PieCell key={entry.name} fill={entry.fill} />
                    ))}
                  </Pie>
                  <Tooltip content={<CustomTooltip />} />
                </PieChart>
              </ResponsiveContainer>
            )}
          </div>
          <ul className="chart-legend">
            {reviewDistribution.map((entry) => (
              <li key={entry.name}>
                <span className="chart-legend__dot" style={{ background: entry.fill }} />
                <span className="chart-legend__name">{entry.name}</span>
                <span className="chart-legend__value">{entry.value}</span>
              </li>
            ))}
          </ul>
        </div>
      </section>

      <section className="reviews-card">
        <h3>Próximos itens para revisar</h3>
        {nextReviewItems.length === 0 ? (
          <div className="reviews-card__empty">
            <CircleCheck size={36} strokeWidth={1.6} />
            <p>Excelente trabalho! Nenhum item agendado para revisão no momento.</p>
          </div>
        ) : (
          <ul className="review-list">
            {nextReviewItems.map((item) => (
              <li key={item.id} className="review-item">
                <span className="review-item-word">
                  {item.studyItem?.japanese ?? item.id}
                  {item.studyItem?.level && (
                    <span className="review-item-level">{item.studyItem.level}</span>
                  )}
                </span>
                <span className="review-item-time">
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
      </section>
    </main>
  )
}
