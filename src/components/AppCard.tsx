import { useState } from 'react'
import { Smartphone, Download, Bell, Check, Share } from 'lucide-react'
import { useAuth } from '../hooks/useAuth'
import { useDailyReminder, useInstallPrompt } from '../hooks/usePwa'

const REMINDER_DESCRIPTION: Record<string, string> = {
  loading: 'Verificando suporte a notificações...',
  unsupported: 'Este navegador não suporta notificações. No iPhone, instale o app primeiro (iOS 16.4 ou mais recente).',
  'not-configured': 'As notificações ainda não foram configuradas no servidor.',
  denied: 'As notificações estão bloqueadas. Libere-as nas configurações do navegador para este site.',
  off: 'Receba avisos às 9h e às 18h quando houver revisões pendentes.',
  on: 'Ativado: você recebe avisos às 9h e às 18h quando houver revisões pendentes.',
}

export function AppCard() {
  const { user } = useAuth()
  const { canInstall, isInstalled, isIos, promptInstall } = useInstallPrompt()
  const reminder = useDailyReminder(user?.id)
  const [reminderError, setReminderError] = useState<string | null>(null)

  const reminderAvailable = reminder.status === 'on' || reminder.status === 'off'

  const toggleReminder = async () => {
    setReminderError(null)
    try {
      if (reminder.status === 'on') await reminder.disable()
      else await reminder.enable()
    } catch (error) {
      console.error('Erro ao alterar o lembrete diário:', error)
      setReminderError('Não foi possível alterar o lembrete. Tente novamente.')
    }
  }

  let installAction: React.ReactNode
  if (isInstalled) {
    installAction = (
      <span className="app-card__installed">
        <Check size={16} strokeWidth={2.4} /> Instalado
      </span>
    )
  } else if (canInstall) {
    installAction = (
      <button type="button" className="options-btn" onClick={promptInstall}>
        <Download size={18} /> Instalar app
      </button>
    )
  } else {
    installAction = null
  }

  return (
    <section className="options-card">
      <div className="options-card-header">
        <div className="options-card-icon options-card-icon--mint">
          <Smartphone size={20} strokeWidth={1.8} />
        </div>
        <div>
          <h2 className="options-card-title">App e lembretes</h2>
          <p className="options-card-desc">Use o Benkyou como app no celular e não esqueça de revisar.</p>
        </div>
      </div>

      <div className="preferences-list">
        <div className="preference-row">
          <div className="preference-row__text">
            <span className="preference-row__title">Instalar como app</span>
            <span className="preference-row__desc">
              {isInstalled
                ? 'O Benkyou já está instalado neste dispositivo.'
                : canInstall
                  ? 'Abra o Benkyou direto da tela inicial, em tela cheia, como um app.'
                  : isIos
                    ? (
                      <>
                        No Safari, toque em <Share size={13} className="app-card__inline-icon" /> Compartilhar e depois em
                        "Adicionar à Tela de Início".
                      </>
                    )
                    : 'Use o menu do navegador e escolha "Instalar app" ou "Adicionar à tela inicial".'}
            </span>
          </div>
          {installAction}
        </div>

        <div className="preference-row">
          <div className="preference-row__text">
            <span className="preference-row__title">
              <Bell size={15} className="app-card__inline-icon" /> Lembrete diário
            </span>
            <span className="preference-row__desc">{REMINDER_DESCRIPTION[reminder.status]}</span>
            {reminderError && <span className="app-card__error">{reminderError}</span>}
          </div>
          {reminderAvailable && (
            <button
              type="button"
              role="switch"
              aria-checked={reminder.status === 'on'}
              aria-label="Lembrete diário"
              className={`switch ${reminder.status === 'on' ? 'switch--on' : ''}`}
              onClick={toggleReminder}
              disabled={reminder.busy}
            >
              <span className="switch__thumb" />
            </button>
          )}
        </div>
      </div>
    </section>
  )
}
