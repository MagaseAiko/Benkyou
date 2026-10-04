import { useState, useCallback, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { useAuth } from '../hooks/useAuth'
import { useToast } from '../hooks/useToast'
import { Toast } from '../components/Toast'
import { Logo } from '../components/Logo'
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
        <aside className="login-art" aria-hidden="true">
          <svg className="login-art__sun" viewBox="0 0 200 200">
            <defs>
              <clipPath id="login-sun-clip">
                <circle cx="100" cy="100" r="86" />
              </clipPath>
            </defs>
            <g clipPath="url(#login-sun-clip)" fill="var(--logo-sun)">
              <rect x="0" y="0" width="200" height="104" />
              <rect x="0" y="114" width="200" height="12" />
              <rect x="0" y="134" width="200" height="9" />
              <rect x="0" y="150" width="200" height="6" />
              <rect x="0" y="163" width="200" height="4" />
            </g>
          </svg>
          <span className="login-art__vertical">勉今日</span>
          <p className="login-art__caption">um pouco de japonês, todo dia.</p>
        </aside>

        <div className="login-panel">
          <div className="login-header">
            <Logo size={40} showTagline={false} />
            <h1>{isLogin ? 'Bem-vindo de volta' : 'Crie sua conta'}</h1>
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
      </div>
      <Toast message={message} onClose={closeToast} type={toastType} />
    </div>
  )
}
