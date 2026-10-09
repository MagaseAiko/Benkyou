import { useState } from 'react'
import { RefreshCw } from 'lucide-react'
import { applyUpdate, useUpdateAvailable } from '../hooks/useAppUpdate'

/** Aviso de nova versão, mostrado quando o app está aberto e um deploy novo sai. */
export function UpdateBanner() {
  const updateAvailable = useUpdateAvailable()
  const [updating, setUpdating] = useState(false)

  if (!updateAvailable) return null

  return (
    <div className="update-banner" role="status" aria-live="polite">
      <span className="update-banner__text">Nova versão do Benkyou disponível.</span>
      <button
        type="button"
        className="button button--primary update-banner__button"
        onClick={() => {
          setUpdating(true)
          void applyUpdate()
        }}
        disabled={updating}
      >
        <RefreshCw size={15} className={updating ? 'update-banner__spin' : ''} />
        {updating ? 'Atualizando...' : 'Atualizar'}
      </button>
    </div>
  )
}
