/*
 * Service worker do Benkyou.
 * - Permite instalar o site como app (PWA) e abrir a interface sem internet.
 * - Recebe o lembrete diário (Web Push) e abre a revisão ao tocar na notificação.
 *
 * Os dados (Supabase, /api) sempre vêm da rede: nada de progresso fica em cache.
 */

// "__BUILD_VERSION__" é trocado pela versão do deploy no build (vite.config.ts).
// Como o sw.js muda a cada deploy, o navegador instala o novo e apaga o cache antigo.
const CACHE = 'benkyou-shell-__BUILD_VERSION__'
const APP_SHELL = ['/', '/manifest.webmanifest', '/logo.svg', '/icons/icon-192.png']

self.addEventListener('install', (event) => {
  event.waitUntil(caches.open(CACHE).then((cache) => cache.addAll(APP_SHELL)))
  self.skipWaiting()
})

self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches
      .keys()
      .then((keys) => Promise.all(keys.filter((key) => key !== CACHE).map((key) => caches.delete(key))))
      .then(() => self.clients.claim()),
  )
})

// O app pode pedir para o service worker novo assumir na hora
self.addEventListener('message', (event) => {
  if (event.data === 'SKIP_WAITING') self.skipWaiting()
})

self.addEventListener('fetch', (event) => {
  const { request } = event
  if (request.method !== 'GET') return

  const url = new URL(request.url)
  // Só o próprio site; Supabase, fontes e /api passam direto
  if (url.origin !== self.location.origin || url.pathname.startsWith('/api/')) return

  // Páginas: rede primeiro; sem internet, abre a interface salva
  if (request.mode === 'navigate') {
    event.respondWith(
      fetch(request)
        .then((response) => {
          if (response.ok) {
            const copy = response.clone()
            caches.open(CACHE).then((cache) => cache.put('/', copy))
          }
          return response
        })
        .catch(() => caches.match('/')),
    )
    return
  }

  // Arquivos do build (/assets/*) têm hash no nome e nunca mudam: cache primeiro
  if (url.pathname.startsWith('/assets/') || url.pathname.startsWith('/icons/')) {
    event.respondWith(
      caches.match(request).then(
        (cached) =>
          cached ||
          fetch(request).then((response) => {
            if (response.ok) {
              const copy = response.clone()
              caches.open(CACHE).then((cache) => cache.put(request, copy))
            }
            return response
          }),
      ),
    )
  }
})

/* ── Lembrete diário ── */

self.addEventListener('push', (event) => {
  let payload = {}
  try {
    payload = event.data ? event.data.json() : {}
  } catch {
    payload = { body: event.data ? event.data.text() : '' }
  }

  const title = payload.title || 'Benkyou'
  event.waitUntil(
    self.registration.showNotification(title, {
      body: payload.body || 'Hora de revisar!',
      icon: '/icons/mascot-192.png', // Kyō-chan, o mascote (imagem à direita)
      badge: '/icons/badge-96.png', // silhueta pequena da barra de status
      tag: 'daily-reminder', // substitui o lembrete anterior em vez de empilhar
      renotify: true,
      data: { url: payload.url || '/review' },
    }),
  )
})

self.addEventListener('notificationclick', (event) => {
  event.notification.close()
  const target = new URL(event.notification.data?.url || '/review', self.location.origin).href

  event.waitUntil(
    self.clients.matchAll({ type: 'window', includeUncontrolled: true }).then((clients) => {
      // Reaproveita uma janela aberta do app, se houver
      for (const client of clients) {
        if (new URL(client.url).origin === self.location.origin && 'focus' in client) {
          client.navigate(target)
          return client.focus()
        }
      }
      return self.clients.openWindow(target)
    }),
  )
})
