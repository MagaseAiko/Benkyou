import { useCallback, useEffect, useState, useSyncExternalStore } from 'react'
import { supabase } from '../utils/supabase'

/* ═══════════════════════════════════════════════════════════
   Instalação como app (PWA)
   ═══════════════════════════════════════════════════════════ */

type BeforeInstallPromptEvent = Event & {
  prompt: () => Promise<void>
  userChoice: Promise<{ outcome: 'accepted' | 'dismissed' }>
}

let deferredPrompt: BeforeInstallPromptEvent | null = null
let installed = false
const listeners = new Set<() => void>()
const notify = () => listeners.forEach((listener) => listener())

function isStandalone() {
  return (
    window.matchMedia?.('(display-mode: standalone)').matches ||
    (navigator as Navigator & { standalone?: boolean }).standalone === true
  )
}

/** Registra o service worker e guarda o convite de instalação do navegador. */
export function setupPwa() {
  if (typeof window === 'undefined') return

  installed = isStandalone()

  window.addEventListener('beforeinstallprompt', (event) => {
    event.preventDefault() // mostramos nosso próprio botão em Opções
    deferredPrompt = event as BeforeInstallPromptEvent
    notify()
  })

  window.addEventListener('appinstalled', () => {
    installed = true
    deferredPrompt = null
    notify()
  })

  if ('serviceWorker' in navigator) {
    const register = () => {
      navigator.serviceWorker.register('/sw.js').catch((error) => {
        console.warn('Não foi possível registrar o service worker:', error)
      })
    }
    if (document.readyState === 'complete') register()
    else window.addEventListener('load', register, { once: true })
  }
}

const subscribe = (listener: () => void) => {
  listeners.add(listener)
  return () => {
    listeners.delete(listener)
  }
}

export function useInstallPrompt() {
  const canInstall = useSyncExternalStore(subscribe, () => deferredPrompt !== null)
  const isInstalled = useSyncExternalStore(subscribe, () => installed)
  const isIos = /iphone|ipad|ipod/i.test(navigator.userAgent)

  const promptInstall = useCallback(async () => {
    if (!deferredPrompt) return
    const prompt = deferredPrompt
    await prompt.prompt()
    await prompt.userChoice
    deferredPrompt = null
    notify()
  }, [])

  return { canInstall, isInstalled, isIos, promptInstall }
}

/* ═══════════════════════════════════════════════════════════
   Lembrete diário (Web Push)
   ═══════════════════════════════════════════════════════════ */

export type ReminderStatus =
  | 'loading'
  | 'unsupported' // navegador sem suporte (ou iPhone sem o app instalado)
  | 'not-configured' // chave VAPID ausente no build
  | 'denied' // usuário bloqueou notificações
  | 'off'
  | 'on'

const VAPID_PUBLIC_KEY = import.meta.env.VITE_VAPID_PUBLIC_KEY as string | undefined

function isPushSupported() {
  return 'serviceWorker' in navigator && 'PushManager' in window && 'Notification' in window
}

function base64UrlToUint8Array(base64Url: string) {
  const padding = '='.repeat((4 - (base64Url.length % 4)) % 4)
  const base64 = (base64Url + padding).replace(/-/g, '+').replace(/_/g, '/')
  const raw = window.atob(base64)
  return Uint8Array.from(raw, (char) => char.charCodeAt(0))
}

async function getSubscription() {
  const registration = await navigator.serviceWorker.ready
  return registration.pushManager.getSubscription()
}

export function useDailyReminder(userId: string | undefined) {
  const [status, setStatus] = useState<ReminderStatus>('loading')
  const [busy, setBusy] = useState(false)

  useEffect(() => {
    let active = true

    const check = async () => {
      if (!isPushSupported()) return 'unsupported'
      if (!VAPID_PUBLIC_KEY) return 'not-configured'
      if (Notification.permission === 'denied') return 'denied'
      const subscription = await getSubscription()
      return subscription ? 'on' : 'off'
    }

    check()
      .then((result) => {
        if (active) setStatus(result)
      })
      .catch(() => {
        if (active) setStatus('unsupported')
      })

    return () => {
      active = false
    }
  }, [])

  const enable = useCallback(async () => {
    if (!userId || !VAPID_PUBLIC_KEY) return
    setBusy(true)
    try {
      const permission = await Notification.requestPermission()
      if (permission !== 'granted') {
        setStatus(permission === 'denied' ? 'denied' : 'off')
        return
      }

      const registration = await navigator.serviceWorker.ready
      const subscription =
        (await registration.pushManager.getSubscription()) ??
        (await registration.pushManager.subscribe({
          userVisibleOnly: true,
          applicationServerKey: base64UrlToUint8Array(VAPID_PUBLIC_KEY),
        }))

      const json = subscription.toJSON()
      const { error } = await supabase.from('push_subscriptions').upsert(
        {
          user_id: userId,
          endpoint: json.endpoint,
          p256dh: json.keys?.p256dh,
          auth: json.keys?.auth,
        },
        { onConflict: 'endpoint' },
      )

      if (error) {
        // Sem salvar no banco o servidor não consegue enviar: desfaz a inscrição
        await subscription.unsubscribe()
        throw error
      }

      setStatus('on')
    } finally {
      setBusy(false)
    }
  }, [userId])

  const disable = useCallback(async () => {
    setBusy(true)
    try {
      const subscription = await getSubscription()
      if (subscription) {
        await supabase.from('push_subscriptions').delete().eq('endpoint', subscription.endpoint)
        await subscription.unsubscribe()
      }
      setStatus('off')
    } finally {
      setBusy(false)
    }
  }, [])

  return { status, busy, enable, disable }
}
