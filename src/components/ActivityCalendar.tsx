import { useEffect, useMemo, useRef, useState } from 'react'
import { CalendarDays } from 'lucide-react'
import { fetchStudyDays } from '../services/activityService'
import { useAuth } from '../hooks/useAuth'
import { getLocalDateKey, useDailyGoal } from '../hooks/usePreferences'

const WEEKS = 18
const WEEKDAY_LABELS = ['', 'seg', '', 'qua', '', 'sex', '']

type Props = {
  lastActivityDate: string | null
}

type Cell = {
  key: string
  date: Date
  isFuture: boolean
}

function buildWeeks(today: Date): Cell[][] {
  const start = new Date(today)
  start.setHours(0, 0, 0, 0)
  // Começa no domingo de (WEEKS - 1) semanas atrás
  start.setDate(start.getDate() - start.getDay() - (WEEKS - 1) * 7)

  const weeks: Cell[][] = []
  const cursor = new Date(start)
  for (let w = 0; w < WEEKS; w++) {
    const week: Cell[] = []
    for (let d = 0; d < 7; d++) {
      week.push({ key: getLocalDateKey(cursor), date: new Date(cursor), isFuture: cursor > today })
      cursor.setDate(cursor.getDate() + 1)
    }
    weeks.push(week)
  }
  return weeks
}

export function ActivityCalendar({ lastActivityDate }: Props) {
  const { user } = useAuth()
  const { done: reviewsToday } = useDailyGoal(user?.id)
  const [activeDays, setActiveDays] = useState<Set<string>>(new Set())
  const scrollRef = useRef<HTMLDivElement>(null)

  const weeks = useMemo(() => buildWeeks(new Date()), [])
  const firstDayKey = weeks[0][0].key
  const todayKey = getLocalDateKey()

  useEffect(() => {
    if (!user?.id) return
    let isMounted = true

    fetchStudyDays(user.id, weeks[0][0].date)
      .then((days) => {
        if (isMounted) setActiveDays(days)
      })
      .catch((error) => {
        console.warn('Não foi possível carregar o histórico de atividade:', error)
      })

    return () => {
      isMounted = false
    }
  }, [user?.id, firstDayKey, weeks])

  // Semana mais recente fica à direita; no celular, rola até ela
  useEffect(() => {
    const element = scrollRef.current
    if (element) element.scrollLeft = element.scrollWidth
  }, [])

  const studiedDays = useMemo(() => {
    const days = new Set(activeDays)
    if (lastActivityDate) days.add(lastActivityDate.slice(0, 10))
    if (reviewsToday > 0) days.add(todayKey)
    return days
  }, [activeDays, lastActivityDate, reviewsToday, todayKey])

  const studiedInRange = weeks.flat().filter((cell) => studiedDays.has(cell.key)).length

  return (
    <section className="activity-card">
      <div className="activity-card__header">
        <h3>
          <CalendarDays size={18} strokeWidth={1.8} />
          Dias de estudo
        </h3>
        <span className="activity-card__total">
          {studiedInRange} {studiedInRange === 1 ? 'dia' : 'dias'} nas últimas {WEEKS} semanas
        </span>
      </div>

      <div className="activity-calendar" ref={scrollRef}>
        <div className="activity-calendar__weekdays" aria-hidden="true">
          {WEEKDAY_LABELS.map((label, index) => (
            <span key={index}>{label}</span>
          ))}
        </div>
        <div className="activity-calendar__body">
          <div className="activity-calendar__months" aria-hidden="true">
            {weeks.map((week, index) => {
              const firstOfMonth = week.find((cell) => cell.date.getDate() === 1)
              // A 1ª coluna mostra o mês inicial, a menos que um mês novo comece logo em seguida
              const monthStartsSoon = weeks
                .slice(1, 3)
                .some((nextWeek) => nextWeek.some((cell) => cell.date.getDate() === 1))
              const label = index === 0 ? (firstOfMonth?.date ?? (monthStartsSoon ? undefined : week[0].date)) : firstOfMonth?.date
              return (
                <span key={week[0].key}>
                  {label ? label.toLocaleDateString('pt-BR', { month: 'short' }).replace('.', '') : ''}
                </span>
              )
            })}
          </div>
          <div className="activity-calendar__grid" role="img" aria-label={`${studiedInRange} dias de estudo nas últimas ${WEEKS} semanas`}>
            {weeks.flat().map((cell) => (
              <span
                key={cell.key}
                className={[
                  'activity-calendar__cell',
                  studiedDays.has(cell.key) ? 'activity-calendar__cell--on' : '',
                  cell.key === todayKey ? 'activity-calendar__cell--today' : '',
                  cell.isFuture ? 'activity-calendar__cell--future' : '',
                ].join(' ')}
                title={cell.date.toLocaleDateString('pt-BR', { day: '2-digit', month: 'long' })}
              />
            ))}
          </div>
        </div>
      </div>

      <div className="activity-card__legend" aria-hidden="true">
        <span className="activity-calendar__cell" /> sem estudo
        <span className="activity-calendar__cell activity-calendar__cell--on" /> estudou
      </div>
    </section>
  )
}
