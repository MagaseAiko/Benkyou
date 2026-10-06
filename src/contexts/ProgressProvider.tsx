import { ProgressContext, useUserProgressState } from '../hooks/useUserProgress'

/**
 * Carrega o progresso do usuário uma única vez e o compartilha com todo o app.
 * Antes, cada componente que chamava useUserProgress() fazia as próprias
 * consultas ao banco (ex.: um item da lista de gramática = 3 consultas).
 */
export function ProgressProvider({ children }: { children: React.ReactNode }) {
  const value = useUserProgressState()
  return <ProgressContext.Provider value={value}>{children}</ProgressContext.Provider>
}
