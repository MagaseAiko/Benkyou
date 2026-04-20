interface ToastProps {
  message: string | null
  onClose: () => void
  type?: 'success' | 'error' | 'info'
}

export function Toast({ message, onClose, type = 'info' }: ToastProps) {
  if (!message) return null

  return (
    <div className={`toast toast--${type}`} role="status" aria-live="polite">
      <div className="toast__content">
        <span>{message}</span>
        <button
          type="button"
          className="toast__close"
          aria-label="Fechar"
          onClick={onClose}
        >
          ×
        </button>
      </div>
    </div>
  )
}
