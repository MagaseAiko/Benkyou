import { useParams, Navigate, useNavigate} from 'react-router-dom'
import { useStudyData } from '../hooks/useStudyData'
import { JLPT_LEVELS } from '../utils/constants'
import { StudyItemCard } from '../components/StudyItemCard'

export function LevelPage() {
  
  const navigate = useNavigate()
  const params = useParams<{ level: string }>()
  const level = params.level as any

  if (!level || !JLPT_LEVELS.includes(level)) {
    return <Navigate to="/" replace />
  }

  const { grammar, vocabulary } = useStudyData(level as any)

  return (
    <main className="page">
      <header className="page__header">
        <button type="button" className="link-button" onClick={() => navigate(-1)}>
          ← Voltar
        </button>
        <h1>Nível {level}</h1>
        <p>Escolha um item para estudar ou revisar.</p>
      </header>

      <section className="section">
        <h2>Gramática</h2>
        {grammar.length === 0 ? (
          <p className="empty-state">Ainda não há itens de gramática neste nível.</p>
        ) : (
          <ul className="study-item-list">
            {grammar.map((item) => (
              <StudyItemCard key={item.id} item={item} />
            ))}
          </ul>
        )}
      </section>

      <section className="section">
        <h2>Vocabulário</h2>
        {vocabulary.length === 0 ? (
          <p className="empty-state">Ainda não há itens de vocabulário neste nível.</p>
        ) : (
          <ul className="study-item-list">
            {vocabulary.map((item) => (
              <StudyItemCard key={item.id} item={item} />
            ))}
          </ul>
        )}
      </section>
    </main>
  )
}
