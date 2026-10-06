import { SlidersHorizontal, Sun, Moon, Monitor, Compass } from 'lucide-react'
import { useAuth } from '../hooks/useAuth'
import {
  DAILY_GOAL_OPTIONS,
  useDailyGoal,
  useFuriganaPreference,
  useThemePreference,
} from '../hooks/usePreferences'
import type { ThemePreference } from '../hooks/usePreferences'
import { requestTourRestart } from '../hooks/useTourState'

const THEME_OPTIONS: { id: ThemePreference; label: string; icon: React.ReactNode }[] = [
  { id: 'system', label: 'Sistema', icon: <Monitor size={15} strokeWidth={1.8} /> },
  { id: 'light', label: 'Claro', icon: <Sun size={15} strokeWidth={1.8} /> },
  { id: 'dark', label: 'Escuro', icon: <Moon size={15} strokeWidth={1.8} /> },
]

export function PreferencesCard() {
  const { user } = useAuth()
  const [theme, setTheme] = useThemePreference()
  const [furiganaAlways, setFuriganaAlways] = useFuriganaPreference()
  const { goal, setGoal } = useDailyGoal(user?.id)

  return (
    <section className="options-card tour-preferences">
      <div className="options-card-header">
        <div className="options-card-icon options-card-icon--butter">
          <SlidersHorizontal size={20} strokeWidth={1.8} />
        </div>
        <div>
          <h2 className="options-card-title">Preferências</h2>
          <p className="options-card-desc">Aparência e hábitos de estudo. Ficam salvas neste navegador.</p>
        </div>
      </div>

      <div className="preferences-list">
        <div className="preference-row">
          <div className="preference-row__text">
            <span className="preference-row__title">Tema</span>
            <span className="preference-row__desc">Siga o sistema ou escolha um tema fixo.</span>
          </div>
          <div className="segmented" role="radiogroup" aria-label="Tema">
            {THEME_OPTIONS.map((option) => (
              <button
                key={option.id}
                type="button"
                role="radio"
                aria-checked={theme === option.id}
                className={`segmented__option ${theme === option.id ? 'segmented__option--active' : ''}`}
                onClick={() => setTheme(option.id)}
              >
                {option.icon}
                {option.label}
              </button>
            ))}
          </div>
        </div>

        <div className="preference-row">
          <div className="preference-row__text">
            <span className="preference-row__title">Furigana sempre visível</span>
            <span className="preference-row__desc">Mostra a leitura acima dos kanji, sem precisar passar o mouse.</span>
          </div>
          <button
            type="button"
            role="switch"
            aria-checked={furiganaAlways}
            aria-label="Furigana sempre visível"
            className={`switch ${furiganaAlways ? 'switch--on' : ''}`}
            onClick={() => setFuriganaAlways(!furiganaAlways)}
          >
            <span className="switch__thumb" />
          </button>
        </div>

        <div className="preference-row">
          <div className="preference-row__text">
            <span className="preference-row__title">Meta diária</span>
            <span className="preference-row__desc">Quantas revisões você quer fazer por dia.</span>
          </div>
          <div className="segmented" role="radiogroup" aria-label="Meta diária de revisões">
            {DAILY_GOAL_OPTIONS.map((option) => (
              <button
                key={option}
                type="button"
                role="radio"
                aria-checked={goal === option}
                className={`segmented__option segmented__option--compact ${goal === option ? 'segmented__option--active' : ''}`}
                onClick={() => setGoal(option)}
              >
                {option}
              </button>
            ))}
          </div>
        </div>

        <div className="preference-row">
          <div className="preference-row__text">
            <span className="preference-row__title">Tour guiado</span>
            <span className="preference-row__desc">Reveja a apresentação das funcionalidades do Benkyou.</span>
          </div>
          <button type="button" className="options-btn" onClick={requestTourRestart}>
            <Compass size={18} /> Ver tour novamente
          </button>
        </div>
      </div>
    </section>
  )
}
