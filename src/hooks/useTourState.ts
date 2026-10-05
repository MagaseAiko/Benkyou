import { useSyncExternalStore } from 'react'

/*
 * Estado compartilhado do tour guiado. O SystemTour publica quando está
 * rodando, e outras telas (ex.: Revisão, que mostra um item de exemplo)
 * conseguem saber disso mesmo quando o tour é reiniciado manualmente.
 */

const TOUR_RESTART_EVENT = 'tour-restart'

let isRunning = false
const listeners = new Set<() => void>()

function subscribe(listener: () => void) {
  listeners.add(listener)
  return () => {
    listeners.delete(listener)
  }
}

export function setTourRunning(running: boolean) {
  if (isRunning === running) return
  isRunning = running
  listeners.forEach((listener) => listener())
}

export function useTourRunning() {
  return useSyncExternalStore(subscribe, () => isRunning)
}

export function requestTourRestart() {
  window.dispatchEvent(new Event(TOUR_RESTART_EVENT))
}

export function onTourRestartRequest(handler: () => void) {
  window.addEventListener(TOUR_RESTART_EVENT, handler)
  return () => window.removeEventListener(TOUR_RESTART_EVENT, handler)
}
