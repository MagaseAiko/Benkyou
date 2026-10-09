import { useSyncExternalStore } from 'react'

/*
 * Atualização automática do app.
 *
 * Instalado como app, o Benkyou costuma ficar "suspenso" em segundo plano em
 * vez de fechar, então continuaria rodando a versão antiga indefinidamente.
 * Aqui a versão em execução (__APP_VERSION__) é comparada com /version.json,
 * que muda a cada deploy:
 *   - ao voltar para o app (segundo plano → primeiro plano): recarrega sozinho,
 *     pois é um momento em que o usuário não está no meio de uma ação;
 *   - com o app aberto: verifica a cada 30 min e mostra o aviso "Atualizar".
 */

const CHECK_INTERVAL_MS = 30 * 60 * 1000
const RELOAD_GUARD_KEY = 'benkyou:update-reload'

let updateAvailable = false
const listeners = new Set<() => void>()

function setUpdateAvailable(value: boolean) {
  if (updateAvailable === value) return
  updateAvailable = value
  listeners.forEach((listener) => listener())
}

async function fetchLatestVersion(): Promise<string | null> {
  try {
    const response = await fetch(`/version.json?t=${Date.now()}`, { cache: 'no-store' })
    if (!response.ok) return null
    const data = (await response.json()) as { version?: string }
    return data.version ?? null
  } catch {
    return null // sem internet: tenta de novo depois
  }
}

/** Pede ao navegador para buscar o sw.js novo (ele é instalado e assume sozinho). */
async function updateServiceWorker() {
  try {
    const registration = await navigator.serviceWorker?.getRegistration()
    await registration?.update()
  } catch {
    // Sem service worker (ex.: navegador sem suporte): só recarregar já basta
  }
}

/** Recarrega a página na versão nova. A trava evita loop caso algo dê errado. */
export async function applyUpdate() {
  try {
    const last = Number(window.sessionStorage.getItem(RELOAD_GUARD_KEY))
    if (last && Date.now() - last < 60 * 1000) return
    window.sessionStorage.setItem(RELOAD_GUARD_KEY, String(Date.now()))
  } catch {
    // sessionStorage indisponível: segue sem a trava
  }
  await updateServiceWorker()
  window.location.reload()
}

async function checkForUpdate(): Promise<boolean> {
  const latest = await fetchLatestVersion()
  const hasUpdate = Boolean(latest) && latest !== __APP_VERSION__
  if (hasUpdate) {
    setUpdateAvailable(true)
    void updateServiceWorker()
  }
  return hasUpdate
}

export function setupUpdateChecks() {
  // Em desenvolvimento (npm run dev) o Vite já recarrega sozinho
  if (__APP_VERSION__ === 'dev' || typeof window === 'undefined') return

  // Ao abrir: se a página veio de um cache antigo, já atualiza
  void checkForUpdate().then((hasUpdate) => {
    if (hasUpdate) void applyUpdate()
  })

  // Ao voltar do segundo plano: atualiza sem perguntar
  document.addEventListener('visibilitychange', () => {
    if (document.visibilityState !== 'visible') return
    if (updateAvailable) {
      void applyUpdate()
      return
    }
    void checkForUpdate().then((hasUpdate) => {
      if (hasUpdate) void applyUpdate()
    })
  })

  // Com o app aberto: só avisa (o usuário pode estar respondendo uma revisão)
  window.setInterval(() => {
    if (document.visibilityState === 'visible') void checkForUpdate()
  }, CHECK_INTERVAL_MS)
}

export function useUpdateAvailable() {
  return useSyncExternalStore(
    (listener) => {
      listeners.add(listener)
      return () => {
        listeners.delete(listener)
      }
    },
    () => updateAvailable,
  )
}
