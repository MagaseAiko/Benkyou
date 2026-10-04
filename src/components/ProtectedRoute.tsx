import { Navigate } from 'react-router-dom'
import { useAuth } from '../hooks/useAuth'
import { useUserProgressContext } from '../contexts/UserProgressContext'
import { LogoMark } from './Logo'

interface ProtectedRouteProps {
  children: React.ReactNode
}

export function ProtectedRoute({ children }: ProtectedRouteProps) {
  const { user, loading: authLoading } = useAuth()
  const { profile, loading: progressLoading } = useUserProgressContext()
  const loading = authLoading || progressLoading

  if (loading) {
    return (
      <div className="app-loading" role="status">
        <LogoMark size={48} className="app-loading__mark" />
        <p>Carregando...</p>
      </div>
    )
  }

  if (!user) {
    return <Navigate to="/login" replace />
  }

  const location = import.meta.env.SSR ? { pathname: '/' } : window.location
  const isOnboardingPage = location.pathname === '/onboarding'

  if (profile.jlptLevel === null && !isOnboardingPage) {
    return <Navigate to="/onboarding" replace />
  }

  if (profile.jlptLevel !== null && isOnboardingPage) {
    return <Navigate to="/" replace />
  }

  return <>{children}</>
}
