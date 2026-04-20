import { useCallback, useEffect, useState } from 'react'

type ToastType = 'success' | 'error' | 'info'

interface UseToastReturn {
  message: string | null
  toastType: ToastType
  showToast: (message: string, toastType?: ToastType, duration?: number) => void
  closeToast: () => void
}

export function useToast(): UseToastReturn {
  const [message, setMessage] = useState<string | null>(null)
  const [toastType, setToastType] = useState<ToastType>('info')

  useEffect(() => {
    if (!message) return

    const timer = window.setTimeout(() => {
      setMessage(null)
    }, 2500)

    return () => window.clearTimeout(timer)
  }, [message])

  const showToast = useCallback((toastMessage: string, msgType: ToastType = 'info', duration: number = 2500) => {
    setMessage(toastMessage)
    setToastType(msgType)

    if (duration > 0) {
      const timer = window.setTimeout(() => {
        setMessage(null)
      }, duration)

      return () => window.clearTimeout(timer)
    }
  }, [])

  const closeToast = useCallback(() => {
    setMessage(null)
  }, [])

  return {
    message,
    toastType,
    showToast,
    closeToast,
  }
}
