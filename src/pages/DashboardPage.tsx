import { useEffect, useMemo, useState } from 'react'
import {
  BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer,
  PieChart, Pie, Cell as PieCell
} from 'recharts'
import { useUserProgress } from '../hooks/useUserProgress'
import { findStudyItemById, getAllStudyItems } from '../services/studyDataService'
import { JLPT_LEVELS } from '../utils/constants'
import type { StudyItem } from '../types'
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
      { name: 'Agora', value: buckets.now, fill: 'var(--danger)' },
      { name: 'Hoje', value: buckets.today, fill: '#f59e0b' },
      { name: 'Esta Semana', value: buckets.thisWeek, fill: 'var(--accent)' },
      { name: 'Depois', value: buckets.later, fill: '#10b981' },
    ]
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
      const studied = allStudyItems.filter((item) => item.level === level && studiedSet.has(item.id)).length

      return { level, studied }
    })
  }, [allStudyItems, progress.masteredItems, progress.studyingItems])

  const FlameIcon = () => (
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <path d="M8.5 14.5A2.5 2.5 0 0 0 11 12c0-1.38-.5-2-1-3-1.072-2.143-.224-4.054 2-6 .5 2.5 2 4.9 4 6.5 2 1.6 3 3.5 3 5.5a7 7 0 1 1-14 0c0-1.153.433-2.294 1-3a2.5 2.5 0 0 0 2.5 2.5z"/>
    </svg>
  );

  const TrophyIcon = () => (
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"/>
      <path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"/>
      <path d="M4 22h16"/>
      <path d="M10 14.66V17c0 .55-.47.98-.97 1.21C7.85 18.75 7 20.24 7 22"/>
      <path d="M14 14.66V17c0 .55.47.98.97 1.21C16.15 18.75 17 20.24 17 22"/>
      <path d="M18 2H6v7a6 6 0 0 0 12 0V2Z"/>
    </svg>
  );

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
        <div>
          <h1>Dashboard</h1>
          <p>Bem-vindo de volta! Aqui está o seu progresso.</p>
        </div>
        
        <div className="streak-container">
          <div className="streak-card current">
            <div className="icon"><FlameIcon /></div>
            <div className="streak-info">
              <h4>Ofensiva Atual</h4>
              <p className="value">{profile.currentStreak} dias</p>
            </div>
          </div>
          <div className="streak-card longest">
            <div className="icon"><TrophyIcon /></div>
            <div className="streak-info">
              <h4>Maior Ofensiva</h4>
              <p className="value">{profile.longestStreak} dias</p>
            </div>
          </div>
        </div>
      </header>

      <section className="stats-grid">
        <div className="stat-box">
          <svg className="stat-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg>
          <span className="stat-title">Total de itens</span>
          <span className="stat-value">{totalItems}</span>
          <span className="stat-desc">Cadastrados no sistema</span>
        </div>
        <div className="stat-box highlight">
          <svg className="stat-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
          <span className="stat-title">Estudados</span>
          <span className="stat-value">{studiedCount}</span>
          <span className="stat-desc">{studiedPercent}% concluído</span>
        </div>
        <div className="stat-box">
          <svg className="stat-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
          <span className="stat-title">Dominados</span>
          <span className="stat-value">{progress.masteredItems.length}</span>
          <span className="stat-desc">Aprendizado consolidado</span>
        </div>
        <div className="stat-box review">
          <svg className="stat-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
          <span className="stat-title">Em Revisão</span>
          <span className="stat-value">{progress.reviewQueue.length}</span>
          <span className="stat-desc">{reviewQueueDue.length} prontos agora</span>
        </div>
      </section>

      <section className="charts-grid">
        <div className="chart-card">
          <h3>
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg>
            Progresso por Nível
          </h3>
          <div className="chart-container">
            <ResponsiveContainer width="100%" height="100%">
              <BarChart data={statsByLevel} margin={{ top: 20, right: 30, left: -20, bottom: 5 }}>
                <XAxis dataKey="level" stroke="var(--text-disabled)" fontSize={12} tickLine={false} axisLine={false} />
                <YAxis stroke="var(--text-disabled)" fontSize={12} tickLine={false} axisLine={false} />
                <Tooltip content={<CustomTooltip />} cursor={{fill: 'var(--surface-alt)'}} />
                <Bar dataKey="studied" fill="var(--accent)" radius={[4, 4, 0, 0]} maxBarSize={50} />
              </BarChart>
            </ResponsiveContainer>
          </div>
        </div>

        <div className="chart-card">
          <h3>
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M21.21 15.89A10 10 0 1 1 8 2.83"/><path d="M22 12A10 10 0 0 0 12 2v10z"/></svg>
            Revisões Agendadas
          </h3>
          <div className="chart-container">
            <ResponsiveContainer width="100%" height="100%">
              <PieChart>
                <Pie
                  data={reviewDistribution.filter(d => d.value > 0)}
                  innerRadius={60}
                  outerRadius={80}
                  paddingAngle={5}
                  dataKey="value"
                  stroke="none"
                >
                  {reviewDistribution.map((entry, index) => (
                    <PieCell key={`cell-${index}`} fill={entry.fill} />
                  ))}
                </Pie>
                <Tooltip content={<CustomTooltip />} />
              </PieChart>
            </ResponsiveContainer>
          </div>
        </div>
      </section>

      <section className="reviews-card">
        <h3>Próximos Itens para Revisar</h3>
        {nextReviewItems.length === 0 ? (
          <div className="empty-state">
            <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
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
