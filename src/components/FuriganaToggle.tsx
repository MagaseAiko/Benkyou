import { useFuriganaPreference } from '../hooks/usePreferences'

type Props = {
  className?: string
}

export function FuriganaToggle({ className }: Props) {
  const [always, setAlways] = useFuriganaPreference()

  return (
    <button
      type="button"
      className={`furigana-toggle ${always ? 'furigana-toggle--on' : ''} ${className ?? ''}`}
      aria-pressed={always}
      onClick={() => setAlways(!always)}
      title={always ? 'Ocultar leitura dos kanji' : 'Mostrar leitura acima dos kanji'}
    >
      <span className="furigana-toggle__glyph" aria-hidden="true">あ</span>
      Furigana
    </button>
  )
}
