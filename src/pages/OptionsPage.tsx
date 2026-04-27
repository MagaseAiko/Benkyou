import { useCallback, useState, useEffect } from 'react'
import { useAuth } from '../hooks/useAuth'
import { useUserProgress } from '../hooks/useUserProgress'
import { useToast } from '../hooks/useToast'
import { Toast } from '../components/Toast'
import { supabase } from '../utils/supabase'
import {
  User,
  Shield,
  Mail,
  Key,
  Trash2,
  AlertTriangle,
  Check,
  AtSign
} from 'lucide-react'
import './OptionsPage.css'

export function OptionsPage() {
  const { user } = useAuth()
  const { resetProgress } = useUserProgress()
  const { message, toastType, showToast, closeToast } = useToast()

  const [isResetModalOpen, setIsResetModalOpen] = useState(false)
  const [accountSection, setAccountSection] = useState<'email' | 'password' | 'username' | null>(null)
  const [loading, setLoading] = useState(false)
  const [username, setUsername] = useState<string>('')

  // Fetch username on component mount
  useEffect(() => {
    const fetchUsername = async () => {
      if (!user?.id) return

      try {
        const { data, error } = await supabase
          .from('profiles')
          .select('username')
          .eq('id', user.id)
          .maybeSingle()

        if (error) {
          console.error('Error fetching username:', error)
          return
        }

        setUsername(data?.username || '')
      } catch (err) {
        console.error('Error fetching username:', err)
      }
    }

    fetchUsername()
  }, [user?.id])

  const [newEmail, setNewEmail] = useState('')
  const handleChangeEmail = useCallback(async () => {
    try {
      setLoading(true)

      const { error: updateError } = await supabase.auth.updateUser({
        email: newEmail,
      })

      if (updateError) throw updateError

      showToast('Email foi atualizado com sucesso.', 'success')
      setNewEmail('')
      setAccountSection(null)
    } catch (err) {
      showToast((err as Error).message ?? 'Erro ao alterar email', 'error')
    } finally {
      setLoading(false)
    }
  }, [newEmail, showToast])

  // Username change
  const [newUsername, setNewUsername] = useState('')
  const handleChangeUsername = useCallback(async () => {
    try {
      setLoading(true)

      if (!user?.id) {
        throw new Error('Usuário não está autenticado')
      }

      if (!newUsername.trim()) {
        throw new Error('Nome de usuário não pode estar vazio')
      }

      if (newUsername.length < 3) {
        throw new Error('Nome de usuário deve ter pelo menos 3 caracteres')
      }

      const { error: updateError } = await supabase
        .from('profiles')
        .update({ username: newUsername.trim() })
        .eq('id', user.id)

      if (updateError) throw updateError

      showToast('Nome de usuário foi atualizado com sucesso.', 'success')
      setNewUsername('')
      setAccountSection(null)

      // Refresh username
      const { data } = await supabase
        .from('profiles')
        .select('username')
        .eq('id', user.id)
        .maybeSingle()

      setUsername(data?.username || '')
    } catch (err) {
      showToast((err as Error).message ?? 'Erro ao alterar nome de usuário', 'error')
    } finally {
      setLoading(false)
    }
  }, [newUsername, user?.id, showToast])

  // Password change
  const [currentPassword, setCurrentPassword] = useState('')
  const [newPassword, setNewPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')
  const handleChangePassword = useCallback(async () => {
    try {
      setLoading(true)

      if (!user?.email) {
        throw new Error('Usuário não está autenticado')
      }

      if (!currentPassword) {
        throw new Error('Informe a senha atual para continuar')
      }

      if (newPassword !== confirmPassword) {
        throw new Error('Senhas não correspondem')
      }

      if (newPassword.length < 6) {
        throw new Error('Senha deve ter no mínimo 6 caracteres')
      }

      const { error: reauthError } = await supabase.auth.signInWithPassword({
        email: user.email,
        password: currentPassword,
      })

      if (reauthError) {
        throw new Error('Senha atual incorreta')
      }

      const { error: updateError } = await supabase.auth.updateUser({
        password: newPassword,
      })

      if (updateError) throw updateError

      showToast('Senha foi alterada com sucesso.', 'success')
      setCurrentPassword('')
      setNewPassword('')
      setConfirmPassword('')
      setAccountSection(null)
    } catch (err) {
      showToast((err as Error).message ?? 'Erro ao alterar senha', 'error')
    } finally {
      setLoading(false)
    }
  }, [currentPassword, newPassword, confirmPassword, user?.email, showToast])

  const handleResetClick = useCallback(() => {
    setIsResetModalOpen(true)
  }, [])

  const handleConfirmReset = useCallback(async () => {
    try {
      setLoading(true)

      await resetProgress()
      localStorage.removeItem(`onboarding_completed_${user?.id}`)
      showToast('Progresso foi resetado com sucesso.', 'success')
      setIsResetModalOpen(false)
      // The ProtectedRoute or App will automatically handle the redirect since local storage is cleared
      // But we can also use window.location to force the reload and re-check
      window.location.href = '/onboarding'
    } catch (err) {
      showToast((err as Error).message ?? 'Erro ao resetar progresso', 'error')
    } finally {
      setLoading(false)
    }
  }, [resetProgress, showToast])

  const handleCancelReset = useCallback(() => {
    setIsResetModalOpen(false)
  }, [])

  return (
    <main className="options-page">
      <header className="options-header">
        <h1>Opções</h1>
        <p>Configurações gerais do aplicativo e da sua conta.</p>
      </header>

      <div className="options-grid">
        {/* Account Section */}
        <section className="options-card">
          <div className="options-card-header">
            <div className="options-card-icon">
              <User size={24} />
            </div>
            <div>
              <h2 className="options-card-title">Conta do Usuário</h2>
              <p className="options-card-desc">Gerencie suas informações pessoais e de acesso</p>
            </div>
          </div>

          <div className="options-info-list">
            <div className="options-info-item">
              <span className="options-info-label">
                <Mail size={16} /> Email
              </span>
              <span className="options-info-value">{user?.email}</span>
            </div>
            <div className="options-info-item">
              <span className="options-info-label">
                <AtSign size={16} /> Nome de usuário
              </span>
              <span className="options-info-value">{username || 'Não definido'}</span>
            </div>
          </div>

          {accountSection === null && (
            <div className="options-action-grid">
              <button
                className="options-btn"
                onClick={() => setAccountSection('email')}
                disabled={loading}
              >
                <Mail size={18} /> Alterar Email
              </button>
              <button
                className="options-btn"
                onClick={() => setAccountSection('username')}
                disabled={loading}
              >
                <AtSign size={18} /> Alterar Nome de Usuário
              </button>
              <button
                className="options-btn"
                onClick={() => setAccountSection('password')}
                disabled={loading}
              >
                <Key size={18} /> Alterar Senha
              </button>
            </div>
          )}

          {accountSection === 'email' && (
            <div className="options-form-wrapper">
              <div className="form-group">
                <label htmlFor="new-email">Novo Email</label>
                <input
                  id="new-email"
                  type="email"
                  value={newEmail}
                  onChange={(e) => setNewEmail(e.target.value)}
                  placeholder="novo@email.com"
                  disabled={loading}
                />
              </div>
              <div className="options-form-actions">
                <button
                  className="button"
                  onClick={() => setAccountSection(null)}
                  disabled={loading}
                >
                  Cancelar
                </button>
                <button
                  className="button button--primary"
                  onClick={handleChangeEmail}
                  disabled={loading || !newEmail}
                >
                  <Check size={18} /> {loading ? 'Salvando...' : 'Salvar Email'}
                </button>
              </div>
            </div>
          )}

          {accountSection === 'username' && (
            <div className="options-form-wrapper">
              <div className="form-group">
                <label htmlFor="new-username">Novo Nome de Usuário</label>
                <input
                  id="new-username"
                  type="text"
                  value={newUsername}
                  onChange={(e) => setNewUsername(e.target.value)}
                  placeholder="novo_nome_usuario"
                  disabled={loading}
                  minLength={3}
                  maxLength={30}
                />
              </div>
              <div className="options-form-actions">
                <button
                  className="button"
                  onClick={() => setAccountSection(null)}
                  disabled={loading}
                >
                  Cancelar
                </button>
                <button
                  className="button button--primary"
                  onClick={handleChangeUsername}
                  disabled={loading || !newUsername.trim()}
                >
                  <Check size={18} /> {loading ? 'Salvando...' : 'Salvar Nome'}
                </button>
              </div>
            </div>
          )}

          {accountSection === 'password' && (
            <div className="options-form-wrapper">
              <div className="form-group">
                <label htmlFor="current-password">Senha Atual</label>
                <input
                  id="current-password"
                  type="password"
                  value={currentPassword}
                  onChange={(e) => setCurrentPassword(e.target.value)}
                  placeholder="••••••••"
                  disabled={loading}
                />
              </div>
              <div className="form-group">
                <label htmlFor="new-password">Nova Senha</label>
                <input
                  id="new-password"
                  type="password"
                  value={newPassword}
                  onChange={(e) => setNewPassword(e.target.value)}
                  placeholder="••••••••"
                  disabled={loading}
                />
              </div>
              <div className="form-group">
                <label htmlFor="confirm-password">Confirme a Senha</label>
                <input
                  id="confirm-password"
                  type="password"
                  value={confirmPassword}
                  onChange={(e) => setConfirmPassword(e.target.value)}
                  placeholder="••••••••"
                  disabled={loading}
                />
              </div>
              <div className="options-form-actions">
                <button
                  className="button"
                  onClick={() => setAccountSection(null)}
                  disabled={loading}
                >
                  Cancelar
                </button>
                <button
                  className="button button--primary"
                  onClick={handleChangePassword}
                  disabled={loading || !currentPassword || !newPassword || !confirmPassword}
                >
                  <Check size={18} /> {loading ? 'Salvando...' : 'Salvar Senha'}
                </button>
              </div>
            </div>
          )}
        </section>

        {/* Progress Section */}
        <section className="options-card">
          <div className="options-card-header">
            <div className="options-card-icon danger">
              <Shield size={24} />
            </div>
            <div>
              <h2 className="options-card-title">Apagar progresso</h2>
              <p className="options-card-desc">Gerencie os dados e progresso da sua conta</p>
            </div>
          </div>

          <div className="options-info-list" style={{ marginBottom: '1rem' }}>
            <p style={{ color: 'var(--text-muted)', margin: 0, fontSize: '0.95rem', lineHeight: 1.6 }}>
              Você pode apagar seu progresso de estudo e revisão. Isso irá limpar permanentemente todos os itens em andamento
              e reiniciar seu histórico de aprendizado. Esta ação <strong>não</strong> pode ser desfeita.
            </p>
          </div>

          <div className="options-action-grid">
            <button
              className="options-btn options-btn-danger"
              type="button"
              onClick={handleResetClick}
              disabled={loading}
            >
              <Trash2 size={18} /> Apagar progresso
            </button>
          </div>
        </section>
      </div>

      {/* Reset Modal */}
      {isResetModalOpen && (
        <div className="modal" role="dialog" aria-modal="true">
          <div className="modal__backdrop" onClick={handleCancelReset} />
          <div className="modal__content" style={{ maxWidth: '400px' }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem', marginBottom: '1rem', color: 'var(--danger)' }}>
              <AlertTriangle size={28} />
              <h2 style={{ margin: 0, fontSize: '1.25rem' }}>Apagar progresso?</h2>
            </div>
            <p style={{ color: 'var(--text-muted)', lineHeight: 1.5, marginBottom: '1.5rem' }}>
              Isso vai apagar todo o seu histórico de estudos, itens em revisão e restaurar o estado original.
              Deseja continuar?
            </p>
            <div className="modal__actions" style={{ marginTop: '0' }}>
              <button className="button" type="button" onClick={handleCancelReset} disabled={loading}>
                Cancelar
              </button>
              <button
                className="button button--danger"
                style={{ background: 'var(--danger)', color: '#fff', borderColor: 'var(--danger)' }}
                type="button"
                onClick={handleConfirmReset}
                disabled={loading}
              >
                {loading ? 'Apagando...' : 'Sim, apagar progresso'}
              </button>
            </div>
          </div>
        </div>
      )}

      <Toast message={message} onClose={closeToast} type={toastType} />
    </main>
  )
}
