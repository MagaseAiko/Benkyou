import { useCallback, useMemo } from 'react'
import type { ReviewItem, UserProgress } from '../types'
import { useLocalStorage } from './useLocalStorage'
import { LOCAL_STORAGE_PROGRESS_KEY } from '../utils/constants'

const MS_PER_DAY = 24 * 60 * 60 * 1000
const MAX_INTERVAL_DAYS = 365 * 5

const DEFAULT_PROGRESS: UserProgress = {
  reviewQueue: [],
  masteredItems: [],
  studyingItems: [],
}

export type ReviewQuality = 'forgot' | 'continue' | 'remembered'

function clampIntervalDays(input: number) {
  const value = Number(input) || 1
  return Math.min(MAX_INTERVAL_DAYS, Math.max(1, Math.round(value)))
}

function clampEaseFactor(input: number) {
  const value = Number(input) || 2.5
  return Math.min(2.5, Math.max(1.1, value))
}

export function useReviewSystem() {
  const [progress, setProgress] = useLocalStorage<UserProgress>(
    LOCAL_STORAGE_PROGRESS_KEY,
    DEFAULT_PROGRESS,
  )

  const upsertReviewItem = useCallback(
    (item: ReviewItem) => {
      setProgress((current) => {
        const nextQueue = current.reviewQueue.filter((i) => i.id !== item.id)
        return { ...current, reviewQueue: [...nextQueue, item] }
      })
    },
    [setProgress],
  )

  const removeFromReview = useCallback(
    (itemId: string) => {
      setProgress((current) => ({
        ...current,
        reviewQueue: current.reviewQueue.filter((item) => item.id !== itemId),
      }))
    },
    [setProgress],
  )

  const markMastered = useCallback(
    (itemId: string) => {
      setProgress((current) => {
        const masteredItems = Array.from(new Set([...current.masteredItems, itemId]))
        return {
          ...current,
          masteredItems,
          reviewQueue: current.reviewQueue.filter((item) => item.id !== itemId),
          studyingItems: current.studyingItems.filter((id) => id !== itemId),
        }
      })
    },
    [setProgress],
  )

  const addToStudying = useCallback(
    (itemId: string) => {
      setProgress((current) => {
        const studyingItems = Array.from(new Set([...current.studyingItems, itemId]))
        return { ...current, studyingItems }
      })
    },
    [setProgress],
  )

  const addToReview = useCallback(
    (itemId: string) => {
      const interval = clampIntervalDays(1)
      const now = Date.now()

      // Permite revisão imediata após o usuário marcar "Revisar".
      const nextReview = now

      upsertReviewItem({
        id: itemId,
        nextReview,
        interval,
        easeFactor: clampEaseFactor(2.5),
      })
      addToStudying(itemId)
    },
    [upsertReviewItem, addToStudying],
  )

  const updateReviewForQuality = useCallback(
    (itemId: string, quality: ReviewQuality) => {
      const now = Date.now()

      setProgress((current) => {
        const existing = current.reviewQueue.find((item) => item.id === itemId)
        const baseInterval = clampIntervalDays(existing?.interval ?? 1)
        const baseEase = clampEaseFactor(existing?.easeFactor ?? 2.5)

        let nextInterval = baseInterval
        let nextEase = baseEase

        switch (quality) {
          case 'forgot':
            nextInterval = clampIntervalDays(1)
            nextEase = clampEaseFactor(baseEase - 0.2)
            break
          case 'continue':
            nextInterval = clampIntervalDays(baseInterval * 1.5)
            break
          case 'remembered':
            nextInterval = clampIntervalDays(baseInterval * 2.5)
            nextEase = clampEaseFactor(baseEase + 0.15)
            break
        }

        const nextReview = now + nextInterval * MS_PER_DAY

        const nextQueue = current.reviewQueue.filter((item) => item.id !== itemId)
        const updatedQueue = [...nextQueue, { id: itemId, nextReview, interval: nextInterval, easeFactor: nextEase }]

        const masteredItems =
          quality === 'remembered'
            ? Array.from(new Set([...current.masteredItems, itemId]))
            : current.masteredItems

        const studyingItems =
          quality === 'remembered'
            ? current.studyingItems.filter((id) => id !== itemId)
            : Array.from(new Set([...current.studyingItems, itemId]))

        return {
          ...current,
          reviewQueue: quality === 'remembered' ? updatedQueue.filter((i) => i.id !== itemId) : updatedQueue,
          masteredItems,
          studyingItems,
        }
      })
    },
    [setProgress],
  )

  const reviewQueueDue = useMemo(() => {
    const now = Date.now()
    return progress.reviewQueue
      .filter((item) => item.nextReview <= now)
      .sort((a, b) => a.nextReview - b.nextReview)
  }, [progress.reviewQueue])

  const totalMastered = progress.masteredItems.length
  const totalStudying = progress.studyingItems.length

  return {
    progress,
    reviewQueueDue,
    totalMastered,
    totalStudying,
    addToReview,
    removeFromReview,
    markMastered,
    updateReviewForQuality,
  }
}
