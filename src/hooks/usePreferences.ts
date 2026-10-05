import { useCallback, useSyncExternalStore } from 'react'

/*
 * Preferências guardadas no navegador (localStorage).
 * Um pequeno "store" com useSyncExternalStore mantém todas as telas
 * sincronizadas quando a preferência muda em qualquer lugar do app.
 */

const listeners = new Set<() => void>()

function emitChange() {
  listeners.forEach((listener) => listener())
}

function subscribe(listener: () => void) {
  listeners.add(listener)
  window.addEventListener('storage', listener)
  return () => {
    listeners.delete(listener)
    window.removeEventListener('storage', listener)
  }
}

function readStorage(key: string): string | null {
  try {
    return window.localStorage.getItem(key)
  } catch {
    return null
  }
}

function writeStorage(key: string, value: string) {
  try {
    window.localStorage.setItem(key, value)
  } catch {
    // Armazenamento indisponível (modo privado etc.): mantém só em memória.
  }
  emitChange()
}

/* ── Tema ── */

export type ThemePreference = 'system' | 'light' | 'dark'

const THEME_KEY = 'benkyou:theme'

function getThemePreference(): ThemePreference {
  const value = readStorage(THEME_KEY)
  return value === 'light' || value === 'dark' ? value : 'system'
}

function applyTheme(theme: ThemePreference) {
  const root = document.documentElement
  if (theme === 'system') {
    root.removeAttribute('data-theme')
  } else {
    root.setAttribute('data-theme', theme)
  }
}

export function useThemePreference() {
  const theme = useSyncExternalStore(subscribe, getThemePreference)

  const setTheme = useCallback((next: ThemePreference) => {
    applyTheme(next)
    writeStorage(THEME_KEY, next)
  }, [])

  return [theme, setTheme] as const
}

/* ── Furigana ── */

const FURIGANA_KEY = 'benkyou:furigana'
const FURIGANA_CLASS = 'furigana-always'

function getFuriganaAlways(): boolean {
  return readStorage(FURIGANA_KEY) === 'on'
}

function applyFurigana(always: boolean) {
  document.documentElement.classList.toggle(FURIGANA_CLASS, always)
}

export function useFuriganaPreference() {
  const always = useSyncExternalStore(subscribe, getFuriganaAlways)

  const setAlways = useCallback((next: boolean) => {
    applyFurigana(next)
    writeStorage(FURIGANA_KEY, next ? 'on' : 'off')
  }, [])

  return [always, setAlways] as const
}

/** Aplica as preferências salvas antes da primeira renderização. */
export function applyStoredPreferences() {
  applyTheme(getThemePreference())
  applyFurigana(getFuriganaAlways())
}

/* ── Meta diária de revisões ── */

export const DAILY_GOAL_OPTIONS = [5, 10, 20, 30, 50] as const
const DEFAULT_DAILY_GOAL = 10

export function getLocalDateKey(date = new Date()) {
  const year = date.getFullYear()
  const month = String(date.getMonth() + 1).padStart(2, '0')
  const day = String(date.getDate()).padStart(2, '0')
  return `${year}-${month}-${day}`
}

export function useDailyGoal(userId: string | undefined) {
  const owner = userId ?? 'anon'
  const goalKey = `benkyou:daily-goal:${owner}`
  const doneKey = `benkyou:reviews:${owner}:${getLocalDateKey()}`

  const goal = useSyncExternalStore(subscribe, () => {
    const value = Number(readStorage(goalKey))
    return Number.isFinite(value) && value > 0 ? value : DEFAULT_DAILY_GOAL
  })

  const done = useSyncExternalStore(subscribe, () => {
    const value = Number(readStorage(doneKey))
    return Number.isFinite(value) && value > 0 ? value : 0
  })

  const setGoal = useCallback((next: number) => {
    writeStorage(goalKey, String(next))
  }, [goalKey])

  const registerReview = useCallback(() => {
    const current = Number(readStorage(doneKey)) || 0
    writeStorage(doneKey, String(current + 1))
  }, [doneKey])

  return { goal, done, setGoal, registerReview }
}
