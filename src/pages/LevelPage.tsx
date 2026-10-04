import { useEffect } from 'react'
import { useLocation, useParams, Navigate, useNavigate} from 'react-router-dom'
import { useStudyData } from '../hooks/useStudyData'
import { JLPT_LEVELS } from '../utils/constants'
import { StudyItemCard } from '../components/StudyItemCard'
import { ArrowLeft } from 'lucide-react'

export function LevelPage() {
  const navigate = useNavigate()
  const location = useLocation()
  const params = useParams<{ level: string }>()
  const level = params.level as any

  const scrollTo = new URLSearchParams(location.search).get('scrollTo')

  useEffect(() => {
    if (!scrollTo) return
    const element = document.getElementById(`study-item-${scrollTo}`)
    if (!element) return
    element.scrollIntoView({ behavior: 'smooth', block: 'center' })
  }, [scrollTo])

  if (!level || !JLPT_LEVELS.includes(level)) {
    return <Navigate to="/" replace />
  }

  const { grammar, isLoading } = useStudyData(level as any)

  return (
    <main className="page">
      <header className="page__header">
        <div className="page__header-top">
          <button type="button" className="link-button" onClick={() => navigate('/')}>
            <ArrowLeft size={16} className="link-button__arrow" /> Voltar
          </button>
        </div>
        <span className="page__eyebrow">jlpt · {String(level).toLowerCase()}</span>
        <h1>Nível {level}</h1>
        <p>Escolha um item para estudar ou revisar.</p>
      </header>

      <section className="section">
        <h2>
          Gramática
          {!isLoading && grammar.length > 0 && <span className="section__count">{grammar.length}</span>}
        </h2>
        {isLoading ? (
          <p className="empty-state">Carregando itens de gramática...</p>
        ) : grammar.length === 0 ? (
          <p className="empty-state">Ainda não há itens de gramática neste nível.</p>
        ) : (
          <ul className="study-item-list">
            {grammar.map((item) => (
              <StudyItemCard key={item.id} item={item} />
            ))}
          </ul>
        )}
      </section>
    </main>
  )
}
