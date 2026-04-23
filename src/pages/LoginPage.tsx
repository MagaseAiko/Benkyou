import { useState, useCallback, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { useAuth } from '../hooks/useAuth'
import { useToast } from '../hooks/useToast'
import { Toast } from '../components/Toast'
import './LoginPage.css'

export function LoginPage() {
  const navigate = useNavigate()
  const { signIn, signUp, loading, error: authError } = useAuth()
  const { message, toastType, showToast, closeToast } = useToast()

  const [isLogin, setIsLogin] = useState(true)
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')
  const [username, setUsername] = useState('')

  useEffect(() => {
    if (authError) {
      showToast(authError, 'error')
    }
  }, [authError, showToast])

  const handleSubmit = useCallback(
    async (e: React.FormEvent) => {
      e.preventDefault()

      try {
        if (isLogin) {
          await signIn(email, password)
          navigate('/')
        } else {
          if (password !== confirmPassword) {
            showToast('Senhas não correspondem', 'error')
            return
          }
          if (!username.trim()) {
            showToast('Nome de usuário é obrigatório', 'error')
            return
          }
          if (username.length < 3) {
            showToast('Nome de usuário deve ter pelo menos 3 caracteres', 'error')
            return
          }
          await signUp(email, password, username.trim())
          showToast('Criado com sucesso! Verifique seu email para confirmar.', 'success')
          setTimeout(() => setIsLogin(true), 2000)
        }
      } catch (err) {
      }
    },
    [isLogin, email, password, confirmPassword, username, signIn, signUp, navigate, showToast]
  )

  const toggleMode = useCallback(() => {
    setIsLogin((prev) => !prev)
    setEmail('')
    setPassword('')
    setConfirmPassword('')
    setUsername('')
  }, [])

  return (
    <div className="login-container">
      <div className="login-card">
        <div className="login-header">
          <img src="/Icon.png" alt="logo" className="login-logo" />
          <h1>「Benkyou」勉今日！</h1>
          <p className="login-subtitle">Estudo de gramática com repetição espaçada</p>
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

          {!isLogin && (
            <div className="form-group">
              <label htmlFor="username">Nome de Usuário</label>
              <input
                id="username"
                type="text"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
                placeholder="seu_nome_usuario"
                required
                disabled={loading}
                minLength={3}
                maxLength={30}
              />
            </div>
          )}

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
      <Toast message={message} onClose={closeToast} type={toastType} />
    </div>
  )
}
