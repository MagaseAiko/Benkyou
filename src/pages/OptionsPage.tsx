import { useCallback, useState, useEffect } from 'react'
import { useAuth } from '../hooks/useAuth'
import { useUserProgress } from '../hooks/useUserProgress'
import { useToast } from '../hooks/useToast'
import { Toast } from '../components/Toast'
import { supabase } from '../utils/supabase'

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
      showToast('Progresso foi resetado com sucesso.', 'success')
      setIsResetModalOpen(false)
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
    <main className="page">
      <header className="page__header">
        <h1>Opções</h1>
        <p>Configurações gerais do aplicativo.</p>
      </header>

      {/* Account Section */}
      <section className="section">
        <h2>Conta do Usuário</h2>
        <p>Email: <strong>{user?.email}</strong></p>
        <p>Nome de usuário: <strong>{username || 'Não definido'}</strong></p>

        {accountSection === null && (
          <div className="actions__progress">
            <button
              className="button button--secondary"
              onClick={() => setAccountSection('email')}
              disabled={loading}
            >
              Alterar Email
            </button>
            <button
              className="button button--secondary"
              onClick={() => setAccountSection('username')}
              disabled={loading}
            >
              Alterar Nome de Usuário
            </button>
            <button
              className="button button--secondary"
              onClick={() => setAccountSection('password')}
              disabled={loading}
            >
              Alterar Senha
            </button>
          </div>
        )}

        {accountSection === 'email' && (
          <div className="account-form">
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
            <div className="actions__progress">
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
                {loading ? 'Atualizando...' : 'Atualizar Email'}
              </button>
            </div>
          </div>
        )}

        {accountSection === 'username' && (
          <div className="account-form">
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
            <div className="actions__progress">
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
                {loading ? 'Atualizando...' : 'Atualizar Nome de Usuário'}
              </button>
            </div>
          </div>
        )}

        {accountSection === 'password' && (
          <div className="account-form">
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
            <div className="actions__progress">
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
                disabled={
                  loading || !currentPassword || !newPassword || !confirmPassword
                }
              >
                {loading ? 'Atualizando...' : 'Atualizar Senha'}
              </button>
            </div>
          </div>
        )}
      </section>

      {/* Progress Section */}
      <section className="section">
        <h2>Progresso</h2>
        <p>
          Você pode resetar seu progresso de estudo e revisão. Isso irá limpar todos os itens em andamento
          e reiniciar seu histórico.
        </p>
        <div className="actions__progress">
          <button
            className="button button--secondary button--danger"
            type="button"
            onClick={handleResetClick}
            disabled={loading}
          >
            Apagar progresso
          </button>
        </div>
      </section>

      {/* Reset Modal */}
      {isResetModalOpen && (
        <div className="modal" role="dialog" aria-modal="true">
          <div className="modal__backdrop" onClick={handleCancelReset} />
          <div className="modal__content">
            <h2>Apagar todo o progresso</h2>
            <p>
              Isso vai apagar todo o progresso do aplicativo e restaurar o estado original.
              Deseja continuar?
            </p>
            <div className="modal__actions">
              <button className="button" type="button" onClick={handleCancelReset} disabled={loading}>
                Cancelar
              </button>
              <button
                className="button button--primary"
                type="button"
                onClick={handleConfirmReset}
                disabled={loading}
              >
                {loading ? 'Apagando...' : 'Apagar progresso'}
              </button>
            </div>
          </div>
        </div>
      )}

      <Toast message={message} onClose={closeToast} type={toastType} />
    </main>
  )
}
