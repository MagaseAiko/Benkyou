import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { useAuth } from '../hooks/useAuth'
import { useUserProgress } from '../hooks/useUserProgress'
import type { JLPTLevel } from '../types'
import { Check, ChevronRight, Sprout, BookOpen, MessageCircle, Mountain, Crown, Sparkles, Info } from 'lucide-react'
import './OnboardingPage.css'

const LEVELS: { id: JLPTLevel; title: string; desc: string; icon: React.ReactNode }[] = [
  { id: 'N5', title: 'N5', desc: 'Iniciante. Sei o básico do básico.', icon: <Sprout size={28} /> },
  { id: 'N4', title: 'N4', desc: 'Básico. Entendo o japonês do dia a dia.', icon: <BookOpen size={28} /> },
  { id: 'N3', title: 'N3', desc: 'Intermediário. Consigo me comunicar em diversas situações.', icon: <MessageCircle size={28} /> },
  { id: 'N2', title: 'N2', desc: 'Avançado. Entendo japonês em situações variadas.', icon: <Mountain size={28} /> },
  { id: 'N1', title: 'N1', desc: 'Fluente. Entendo japonês complexo em qualquer situação.', icon: <Crown size={28} /> },
]

export function OnboardingPage() {
  const navigate = useNavigate()
  const { user } = useAuth()
  const { setLevel } = useUserProgress()
  const [selectedLevel, setSelectedLevel] = useState<JLPTLevel | null>(null)
  const [loading, setLoading] = useState(false)

  const handleConfirm = async () => {
    if (!selectedLevel || !user?.id) return

    try {
      setLoading(true)
      await setLevel(selectedLevel)
      navigate('/')
    } catch (error) {
      console.error(error)
      setLoading(false)
    }
  }

  return (
    <div className="onboarding-page">
      <div className="onboarding-container">
        <header className="onboarding-header">
          <h1 className="onboarding-title">
            <Sparkles className="title-icon" size={36} color="var(--accent)" />
            Bem-vindo ao Benkyou!
          </h1>
          <p className="onboarding-subtitle">
            Qual é o seu nível de japonês atual?
          </p>
          <div className="onboarding-info">
            <Info size={24} className="info-icon" />
            <p>
              Níveis anteriores ao selecionado serão marcados como dominados automaticamente para que você não precise revisá-los.
            </p>
          </div>
        </header>

        <div className="onboarding-levels">
          {LEVELS.map((level, index) => (
            <button
              key={level.id}
              className={`onboarding-level-card ${selectedLevel === level.id ? 'selected' : ''}`}
              onClick={() => setSelectedLevel(level.id)}
              disabled={loading}
              style={{ animationDelay: `${index * 0.1}s` }}
            >
              <div className="level-card-content">
                <div className="level-icon-wrapper">
                  {level.icon}
                </div>
                <div className="level-card-info">
                  <span className="level-id">{level.title}</span>
                  <span className="level-desc">{level.desc}</span>
                </div>
              </div>
              <div className="level-card-check">
                <Check size={18} strokeWidth={3} />
              </div>
            </button>
          ))}
        </div>

        <button
          className="button button--primary onboarding-submit"
          disabled={!selectedLevel || loading}
          onClick={handleConfirm}
        >
          {loading ? 'Salvando...' : 'Começar jornada'}
          {!loading && <ChevronRight size={24} />}
        </button>
      </div>
    </div>
  )
}
