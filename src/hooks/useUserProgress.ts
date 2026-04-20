import { useCallback, useMemo, useEffect, useState } from 'react'
import type { ReviewItem, UserProgress } from '../types'
import { supabase } from '../utils/supabase'
import { useAuth } from './useAuth'

const MS_PER_DAY = 24 * 60 * 60 * 1000
const MAX_INTERVAL_DAYS = 365 * 5

export type ReviewQuality = 'forgot' | 'continue' | 'remembered'

type ReviewQueueRow = {
  id: string
  user_id: string
  item_id: string
  next_review: string | number
  interval: number
  ease_factor: number
}

type StudyItemRow = {
  id: string
  user_id: string
  item_id: string
  status: 'studying' | 'mastered'
}

function clampIntervalDays(input: number) {
  const value = Number(input) || 1
  return Math.min(MAX_INTERVAL_DAYS, Math.max(1, Math.round(value)))
}

function clampEaseFactor(input: number) {
  const value = Number(input) || 2.5
  return Math.min(2.5, Math.max(1.1, value))
}

// Convert milliseconds to ISO string for database storage
function timestampToISO(ms: number): string {
  const date = new Date(ms)
  // Ensure we always return a valid ISO string
  return date.toISOString()
}

// Convert ISO string or number from database to milliseconds
function isoToTimestamp(value: string | number): number {
  if (typeof value === 'number') {
    // If it's already a number, assume it's milliseconds
    return value
  }
  
  if (typeof value === 'string') {
    // Ensure proper ISO format (add Z if missing for UTC interpretation)
    const isoString = value.includes('Z') || value.includes('+') 
      ? value 
      : `${value}Z`  // Assume UTC if no timezone
    
    const time = new Date(isoString).getTime()
    
    // Validate that we got a valid timestamp
    if (isNaN(time)) {
      console.error('Invalid timestamp conversion:', { value, isoString })
      return Date.now()  // Fallback to current time
    }
    
    return time
  }
  
  // Fallback
  return Date.now()
}

export function useUserProgress() {
  const { user } = useAuth()
  const [reviewQueue, setReviewQueue] = useState<ReviewItem[]>([])
  const [masteredItems, setMasteredItems] = useState<string[]>([])
  const [studyingItems, setStudyingItems] = useState<string[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  // Load progress from Supabase
  useEffect(() => {
    let isMounted = true

    const loadProgress = async () => {
      try {
        if (!user?.id) {
          setLoading(false)
          return
        }

        console.log('📥 Loading progress for user:', user.id)
        setLoading(true)
        setError(null)

        // Load review queue
        const { data: reviewData, error: reviewError } = await supabase
          .from('user_review_queue')
          .select('*')
          .eq('user_id', user.id)

        console.log('📊 Review queue response:', {
          count: reviewData?.length ?? 0,
          error: reviewError?.message,
        })

        if (reviewError) throw reviewError

        // Load study items
        const { data: studyData, error: studyError } = await supabase
          .from('user_study_items')
          .select('*')
          .eq('user_id', user.id)

        console.log('📝 Study items response:', {
          count: studyData?.length ?? 0,
          error: studyError?.message,
        })

        if (studyError) throw studyError

        if (isMounted) {
          // Convert review queue data
          const queue: ReviewItem[] = (reviewData ?? []).map((row: ReviewQueueRow) => ({
            id: row.item_id,
            nextReview: isoToTimestamp(row.next_review),
            interval: row.interval,
            easeFactor: row.ease_factor,
          }))

          setReviewQueue(queue)

          // Separate mastered and studying items
          const studyRows = studyData as StudyItemRow[]
          setMasteredItems(
            studyRows
              .filter((row) => row.status === 'mastered')
              .map((row) => row.item_id)
          )
          setStudyingItems(
            studyRows
              .filter((row) => row.status === 'studying')
              .map((row) => row.item_id)
          )
        }
      } catch (err) {
        console.error('Error loading progress:', err)
        if (isMounted) {
          setError((err as Error).message ?? 'Erro ao carregar progresso')
        }
      } finally {
        if (isMounted) {
          setLoading(false)
        }
      }
    }

    loadProgress()

    return () => {
      isMounted = false
    }
  }, [user?.id])

  // Upsert review item
  const upsertReviewItem = useCallback(
    async (item: ReviewItem) => {
      if (!user?.id) {
        console.error('❌ Cannot upsert: user.id is missing!', { user })
        setError('Erro: Usuário não identificado. Faça login novamente.')
        return
      }

      try {
        const payload = {
          user_id: user.id,
          item_id: item.id,
          next_review: timestampToISO(item.nextReview),
          interval: item.interval,
          ease_factor: item.easeFactor,
        }

        console.log('📤 Upserting review item:', { item_id: item.id, interval: item.interval })

        const { error } = await supabase.from('user_review_queue').upsert(payload, {
          onConflict: 'user_id,item_id',
        })

        if (error) {
          console.error('❌ Supabase upsert error:', error)
          throw error
        }

        // Update local state optimistically
        setReviewQueue((current) => {
          const nextQueue = current.filter((i) => i.id !== item.id)
          return [...nextQueue, item]
        })

        console.log('✅ Review item upserted successfully')
      } catch (err) {
        console.error('Error upserting review item:', err)
        setError((err as Error).message ?? 'Erro ao atualizar item de revisão')
      }
    },
    [user?.id]
  )

  // Remove from review
  const removeFromReview = useCallback(
    async (itemId: string) => {
      if (!user?.id) return

      try {
        const { error } = await supabase
          .from('user_review_queue')
          .delete()
          .eq('user_id', user.id)
          .eq('item_id', itemId)

        if (error) throw error

        // Update local state optimistically
        setReviewQueue((current) =>
          current.filter((item) => item.id !== itemId)
        )
      } catch (err) {
        console.error('Error removing from review:', err)
        setError((err as Error).message ?? 'Erro ao remover item de revisão')
      }
    },
    [user?.id]
  )

  // Mark mastered
  const markMastered = useCallback(
    async (itemId: string) => {
      if (!user?.id) return

      try {
        // Remove from review queue
        await removeFromReview(itemId)

        // Update study item status
        const { error } = await supabase.from('user_study_items').upsert(
          {
            user_id: user.id,
            item_id: itemId,
            status: 'mastered',
          },
          { onConflict: 'user_id,item_id' }
        )

        if (error) throw error

        // Update local state optimistically
        setMasteredItems((current) =>
          Array.from(new Set([...current, itemId]))
        )
        setStudyingItems((current) =>
          current.filter((id) => id !== itemId)
        )
      } catch (err) {
        console.error('Error marking mastered:', err)
        setError((err as Error).message ?? 'Erro ao marcar como dominado')
      }
    },
    [user?.id, removeFromReview]
  )

  // Add to studying
  const addToStudying = useCallback(
    async (itemId: string) => {
      if (!user?.id) {
        console.error('Cannot add to studying: user.id is missing!', { user })
        setError('Erro: Usuário não identificado. Faça login novamente.')
        return
      }

      try {
        const payload = {
          user_id: user.id,
          item_id: itemId,
          status: 'studying' as const,
        }

        console.log('Adding to studying:', payload)

        const { error } = await supabase.from('user_study_items').upsert(payload, {
          onConflict: 'user_id,item_id',
        })

        if (error) {
          console.error('Supabase addToStudying error:', error)
          throw error
        }

        // Update local state optimistically
        setStudyingItems((current) =>
          Array.from(new Set([...current, itemId]))
        )

        console.log('Item added to studying successfully')
      } catch (err) {
        console.error('Error adding to studying:', err)
        setError((err as Error).message ?? 'Erro ao adicionar para estudar')
      }
    },
    [user?.id]
  )

  // Add to review
  const addToReview = useCallback(
    async (itemId: string) => {
      const interval = clampIntervalDays(1)
      const now = Date.now()
      const nextReview = now

      await upsertReviewItem({
        id: itemId,
        nextReview,
        interval,
        easeFactor: clampEaseFactor(2.5),
      })

      await addToStudying(itemId)
    },
    [upsertReviewItem, addToStudying]
  )

  // Update review for quality
  const updateReviewForQuality = useCallback(
    async (itemId: string, quality: ReviewQuality) => {
      if (!user?.id) return

      try {
        const now = Date.now()
        const existing = reviewQueue.find((item) => item.id === itemId)
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

        if (quality === 'remembered') {
          // Mark as mastered
          await markMastered(itemId)
        } else {
          // Continue in review
          await upsertReviewItem({
            id: itemId,
            nextReview,
            interval: nextInterval,
            easeFactor: nextEase,
          })
          await addToStudying(itemId)
        }
      } catch (err) {
        console.error('Error updating review for quality:', err)
        setError((err as Error).message ?? 'Erro ao atualizar revisão')
      }
    },
    [user?.id, reviewQueue, markMastered, upsertReviewItem, addToStudying]
  )

  // Reset item progress
  const resetItemProgress = useCallback(
    async (itemId: string) => {
      if (!user?.id) return

      try {
        // Remove from review queue
        const { error: reviewError } = await supabase
          .from('user_review_queue')
          .delete()
          .eq('user_id', user.id)
          .eq('item_id', itemId)

        if (reviewError) throw reviewError

        // Remove from study items
        const { error: studyError } = await supabase
          .from('user_study_items')
          .delete()
          .eq('user_id', user.id)
          .eq('item_id', itemId)

        if (studyError) throw studyError

        // Update local state optimistically
        setReviewQueue((current) =>
          current.filter((item) => item.id !== itemId)
        )
        setMasteredItems((current) =>
          current.filter((id) => id !== itemId)
        )
        setStudyingItems((current) =>
          current.filter((id) => id !== itemId)
        )
      } catch (err) {
        console.error('Error resetting item progress:', err)
        setError((err as Error).message ?? 'Erro ao resetar progresso do item')
      }
    },
    [user?.id]
  )

  // Reset all progress
  const resetProgress = useCallback(
    async () => {
      if (!user?.id) return

      try {
        // Delete all review queue entries
        const { error: reviewError } = await supabase
          .from('user_review_queue')
          .delete()
          .eq('user_id', user.id)

        if (reviewError) throw reviewError

        // Delete all study items
        const { error: studyError } = await supabase
          .from('user_study_items')
          .delete()
          .eq('user_id', user.id)

        if (studyError) throw studyError

        // Update local state optimistically
        setReviewQueue([])
        setMasteredItems([])
        setStudyingItems([])
      } catch (err) {
        console.error('Error resetting progress:', err)
        setError((err as Error).message ?? 'Erro ao resetar progresso')
      }
    },
    [user?.id]
  )

  // Computed values
  const progress: UserProgress = {
    reviewQueue,
    masteredItems,
    studyingItems,
  }

  const reviewQueueDue = useMemo(() => {
    const now = Date.now()
    return reviewQueue
      .filter((item) => item.nextReview <= now)
      .sort((a, b) => a.nextReview - b.nextReview)
  }, [reviewQueue])

  const totalMastered = masteredItems.length
  const totalStudying = studyingItems.length

  return {
    progress,
    loading,
    error,
    reviewQueueDue,
    totalMastered,
    totalStudying,
    addToReview,
    removeFromReview,
    markMastered,
    addToStudying,
    updateReviewForQuality,
    resetItemProgress,
    resetProgress,
  }
}
