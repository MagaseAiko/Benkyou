import { useCallback, useState } from 'react'
import { useAuth } from '../hooks/useAuth'
import { useUserProgress } from '../hooks/useUserProgress'
import { supabase } from '../utils/supabase'

export function OptionsPage() {
  const { user } = useAuth()
  const { resetProgress } = useUserProgress()

  const [isResetModalOpen, setIsResetModalOpen] = useState(false)
  const [accountSection, setAccountSection] = useState<'email' | 'password' | null>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [success, setSuccess] = useState<string | null>(null)

  // Email change
  const [newEmail, setNewEmail] = useState('')
  const handleChangeEmail = useCallback(async () => {
    try {
      setLoading(true)
      setError(null)
      setSuccess(null)

      const { error: updateError } = await supabase.auth.updateUser({
        email: newEmail,
      })

      if (updateError) throw updateError

      setSuccess('Email foi atualizado. Verifique seu novo email para confirmar.')
      setNewEmail('')
      setAccountSection(null)
    } catch (err) {
      setError((err as Error).message ?? 'Erro ao alterar email')
    } finally {
      setLoading(false)
    }
  }, [newEmail])

  // Password change
  const [newPassword, setNewPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')
  const handleChangePassword = useCallback(async () => {
    try {
      setLoading(true)
      setError(null)
      setSuccess(null)

      if (newPassword !== confirmPassword) {
        throw new Error('Senhas não correspondem')
      }

      if (newPassword.length < 6) {
        throw new Error('Senha deve ter no mínimo 6 caracteres')
      }

      const { error: updateError } = await supabase.auth.updateUser({
        password: newPassword,
      })

      if (updateError) throw updateError

      setSuccess('Senha foi alterada com sucesso.')
      setNewPassword('')
      setConfirmPassword('')
      setAccountSection(null)
    } catch (err) {
      setError((err as Error).message ?? 'Erro ao alterar senha')
    } finally {
      setLoading(false)
    }
  }, [newPassword, confirmPassword])

  const handleResetClick = useCallback(() => {
    setIsResetModalOpen(true)
  }, [])

  const handleConfirmReset = useCallback(async () => {
    try {
      setLoading(true)
      setError(null)
      setSuccess(null)

      await resetProgress()
      setSuccess('Progresso foi resetado com sucesso.')
      setIsResetModalOpen(false)
    } catch (err) {
      setError((err as Error).message ?? 'Erro ao resetar progresso')
    } finally {
      setLoading(false)
    }
  }, [resetProgress])

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

        {accountSection === 'password' && (
          <div className="account-form">
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
                disabled={loading || !newPassword || !confirmPassword}
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

      {/* Notifications */}
      {error && (
        <section className="section" style={{ backgroundColor: '#fee', borderLeft: '4px solid #c33', padding: '1rem' }}>
          <p style={{ color: '#c33', margin: 0 }}>⚠️ {error}</p>
        </section>
      )}

      {success && (
        <section className="section" style={{ backgroundColor: '#efe', borderLeft: '4px solid #3c3', padding: '1rem' }}>
          <p style={{ color: '#3c3', margin: 0 }}>✅ {success}</p>
        </section>
      )}

      {/* About Section */}
      <section className="section">
        <h2>Sobre</h2>
        <p>
          Seu progresso está protegido no servidor e sincronizado com sua conta Supabase.
          Você pode acessar seus dados em qualquer dispositivo ao fazer login.
        </p>
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
    </main>
  )
}
