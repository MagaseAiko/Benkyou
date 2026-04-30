import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../utils/supabase'
import './AuthCallbackPage.css'

export function AuthCallbackPage() {
  const navigate = useNavigate()
  const [status, setStatus] = useState<'loading' | 'success' | 'error'>('loading')
  const [message, setMessage] = useState('Processando confirmação...')

  useEffect(() => {
    const handleAuthCallback = async () => {
      try {
        // Handle the auth callback for email confirmation
        const { data, error } = await supabase.auth.getSession()

        if (error) {
          console.error('Auth callback error:', error)
          setStatus('error')
          setMessage('Erro na confirmação. Redirecionando...')
          setTimeout(() => navigate('/login'), 3000)
          return
        }

        if (data.session) {
          await supabase.auth.signOut()
          setStatus('success')
          setMessage('Email alterado com sucesso! Faça login novamente com seu novo email.')
          setTimeout(() => navigate('/login'), 3000)
        } else {
          setStatus('error')
          setMessage('Sessão não encontrada. Redirecionando...')
          setTimeout(() => navigate('/login'), 3000)
        }
      } catch (err) {
        console.error('Error handling auth callback:', err)
        setStatus('error')
        setMessage('Erro inesperado. Redirecionando...')
        setTimeout(() => navigate('/login'), 3000)
      }
    }

    handleAuthCallback()
  }, [navigate])

  return (
    <main className="page">
      <header className="page__header">
        <h1>Confirmando Email</h1>
        <p>Estamos verificando sua alteração de email. Aguarde um momento...</p>
      </header>

      <section className="section auth-callback">
        <div className="auth-callback__content">
          <div className={`auth-callback__spinner ${status !== 'loading' ? 'auth-callback__spinner--hidden' : ''}`}></div>
          <div className={`auth-callback__icon ${status === 'success' ? 'auth-callback__icon--success' : status === 'error' ? 'auth-callback__icon--error' : ''}`}></div>
          <p className="auth-callback__message">{message}</p>
        </div>
      </section>
    </main>
  )
}