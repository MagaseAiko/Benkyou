import { useState, useCallback } from 'react'
import { useNavigate } from 'react-router-dom'
import { useAuth } from '../hooks/useAuth'
import './LoginPage.css'

export function LoginPage() {
  const navigate = useNavigate()
  const { signIn, signUp, loading, error: authError } = useAuth()

  const [isLogin, setIsLogin] = useState(true)
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [successMessage, setSuccessMessage] = useState<string | null>(null)

  const handleSubmit = useCallback(
    async (e: React.FormEvent) => {
      e.preventDefault()
      setError(null)
      setSuccessMessage(null)

      try {
        if (isLogin) {
          await signIn(email, password)
          navigate('/')
        } else {
          if (password !== confirmPassword) {
            setError('Senhas não correspondem')
            return
          }
          await signUp(email, password)
          setSuccessMessage('Criado com sucesso! Verifique seu email para confirmar.')
          setTimeout(() => setIsLogin(true), 2000)
        }
      } catch (err) {
        // Error is already set by the hook
      }
    },
    [isLogin, email, password, confirmPassword, signIn, signUp, navigate]
  )

  const toggleMode = useCallback(() => {
    setIsLogin((prev) => !prev)
    setError(null)
    setEmail('')
    setPassword('')
    setConfirmPassword('')
    setSuccessMessage(null)
  }, [])

  return (
    <div className="login-container">
      <div className="login-card">
        <div className="login-header">
          <img src="/Icon.png" alt="logo" className="login-logo" />
          <h1>「Benkyou」勉今日！</h1>
          <p className="login-subtitle">Sistema de Aprendizado Spaced Repetition</p>
        </div>

        <form onSubmit={handleSubmit} className="login-form">
          <div className="form-group">
            <label htmlFor="email">Email</label>
            <input
              id="email"
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              placeholder="seu@email.com"
              required
              disabled={loading}
            />
          </div>

          <div className="form-group">
            <label htmlFor="password">Senha</label>
            <input
              id="password"
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="••••••••"
              required
              disabled={loading}
            />
          </div>

          {!isLogin && (
            <div className="form-group">
              <label htmlFor="confirmPassword">Confirme a Senha</label>
              <input
                id="confirmPassword"
                type="password"
                value={confirmPassword}
                onChange={(e) => setConfirmPassword(e.target.value)}
                placeholder="••••••••"
                required
                disabled={loading}
              />
            </div>
          )}

          {(error || authError) && (
            <div className="form-error">
              <p>⚠️ {error || authError}</p>
            </div>
          )}

          {successMessage && (
            <div className="form-success">
              <p>✅ {successMessage}</p>
            </div>
          )}

          <button
            type="submit"
            className="button button--primary login-button"
            disabled={loading}
          >
            {loading ? 'Carregando...' : isLogin ? 'Entrar' : 'Criar Conta'}
          </button>
        </form>

        <div className="login-divider">ou</div>

        <button
          type="button"
          className="button login-toggle"
          onClick={toggleMode}
          disabled={loading}
        >
          {isLogin ? 'Não tem conta? Criar' : 'Já tem conta? Entrar'}
        </button>
      </div>
    </div>
  )
}
