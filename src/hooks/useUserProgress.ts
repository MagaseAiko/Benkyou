import { useCallback, useMemo, useEffect, useState } from 'react'
import type { ReviewItem, UserProgress, UserProfile } from '../types'
import { supabase } from '../utils/supabase'
import { isRLSViolation } from '../utils/auth-helpers'
import { useAuth } from './useAuth'
import { clearGrammarCache } from '../services/studyDataService'

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

function timestampToISO(ms: number): string {
  const date = new Date(ms)
  return date.toISOString()
}

function isoToTimestamp(value: string | number): number {
  if (typeof value === 'number') {
    return value
  }
  
  if (typeof value === 'string') {
    const isoString = value.includes('Z') || value.includes('+') 
      ? value 
      : `${value}Z`
    
    const time = new Date(isoString).getTime()
    
    if (isNaN(time)) {
      console.error('Invalid timestamp conversion:', { value, isoString })
      return Date.now()
    }
    
    return time
  }
  
  return Date.now()
}

export function useUserProgress() {
  const { user } = useAuth()
  const [reviewQueue, setReviewQueue] = useState<ReviewItem[]>([])
  const [masteredItems, setMasteredItems] = useState<string[]>([])
  const [studyingItems, setStudyingItems] = useState<string[]>([])
  const [profile, setProfile] = useState<UserProfile>({
    currentStreak: 0,
    longestStreak: 0,
    lastActivityDate: null,
    jlptLevel: null,
    hasCompletedOnboarding: false,
  })
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    let isMounted = true

    const loadProgress = async () => {
      try {
        if (!user?.id) {
          setLoading(false)
          return
        }

        setLoading(true)
        setError(null)

        const { data: reviewData, error: reviewError } = await supabase
          .from('user_review_queue')
          .select('*')
          .eq('user_id', user.id)

        if (reviewError) {
          if (isRLSViolation(reviewError)) {
            console.error('❌ RLS VIOLATION: user_review_queue select failed', {
              userId: user.id,
              code: reviewError.code,
            })
          }
          throw reviewError
        }

        const { data: studyData, error: studyError } = await supabase
          .from('user_study_items')
          .select('*')
          .eq('user_id', user.id)

        if (studyError) {
          if (isRLSViolation(studyError)) {
            console.error('RLS VIOLATION: user_study_items select failed', {
              userId: user.id,
              code: studyError.code,
            })
          }
          throw studyError
        }

        const { data: profileData, error: profileError } = await supabase
          .from('profiles')
          .select('current_streak,longest_streak,last_activity_date,jlpt_level,has_completed_onboarding')
          .eq('id', user.id)
          .maybeSingle()

        if (profileError) {
          if (isRLSViolation(profileError)) {
            console.error('RLS VIOLATION: profiles select failed', {
              userId: user.id,
              code: profileError.code,
            })
          }
          throw profileError
        }

        if (isMounted) {
          const queue: ReviewItem[] = (reviewData ?? []).map((row: ReviewQueueRow) => ({
            id: row.item_id,
            nextReview: isoToTimestamp(row.next_review),
            interval: row.interval,
            easeFactor: row.ease_factor,
          }))

          setReviewQueue(queue)

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

          setProfile({
            currentStreak: profileData?.current_streak ?? 0,
            longestStreak: profileData?.longest_streak ?? 0,
            lastActivityDate: profileData?.last_activity_date ?? null,
            jlptLevel: profileData?.jlpt_level ?? null,
            hasCompletedOnboarding: profileData?.has_completed_onboarding ?? false,
          })
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

  const upsertReviewItem = useCallback(
    async (item: ReviewItem) => {
      if (!user?.id) {
        console.error('Cannot upsert: user.id is missing!', { user })
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

        const { error } = await supabase.from('user_review_queue').upsert(payload, {
          onConflict: 'user_id,item_id',
        })

        if (error) {
          if (isRLSViolation(error)) {
            console.error('RLS VIOLATION: user_review_queue upsert failed', {
              userId: user.id,
              code: error.code,
              message: error.message,
            })
          }
          console.error('Supabase upsert error:', error)
          throw error
        }

        setReviewQueue((current) => {
          const nextQueue = current.filter((i) => i.id !== item.id)
          return [...nextQueue, item]
        })

        clearGrammarCache()
      } catch (err) {
        console.error('Error upserting review item:', err)
        setError((err as Error).message ?? 'Erro ao atualizar item de revisão')
      }
    },
    [user?.id]
  )

  const removeFromReview = useCallback(
    async (itemId: string) => {
      if (!user?.id) {
        console.warn('removeFromReview: user.id is missing')
        return
      }

      try {
        const { error } = await supabase
          .from('user_review_queue')
          .delete()
          .eq('user_id', user.id)
          .eq('item_id', itemId)

        if (error) {
          if (isRLSViolation(error)) {
            console.error('RLS VIOLATION: user_review_queue delete failed', {
              userId: user.id,
              itemId,
              code: error.code,
            })
          }
          throw error
        }

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

  const markMastered = useCallback(
    async (itemId: string) => {
      if (!user?.id) {
        console.warn('markMastered: user.id is missing')
        return
      }

      try {
        await removeFromReview(itemId)

        const { error } = await supabase.from('user_study_items').upsert(
          {
            user_id: user.id,
            item_id: itemId,
            status: 'mastered',
          },
          { onConflict: 'user_id,item_id' }
        )

        if (error) {
          if (isRLSViolation(error)) {
            console.error('RLS VIOLATION: user_study_items upsert failed', {
              userId: user.id,
              itemId,
              code: error.code,
            })
          }
          throw error
        }

        const { error: streakError } = await supabase.rpc('update_streak', {
          user_id: user.id,
        })

        if (streakError) {
          if (isRLSViolation(streakError)) {
            console.error('RLS VIOLATION: update_streak rpc failed', {
              userId: user.id,
              code: streakError.code,
            })
          }
          throw streakError
        }

        const { data: profileData, error: profileError } = await supabase
          .from('profiles')
          .select('*')
          .eq('id', user.id)
          .single()

        if (profileError) {
          if (isRLSViolation(profileError)) {
            console.error('RLS VIOLATION: profiles select failed', {
              userId: user.id,
              code: profileError.code,
            })
          }
          throw profileError
        }

        setMasteredItems((current) =>
          Array.from(new Set([...current, itemId]))
        )
        setStudyingItems((current) =>
          current.filter((id) => id !== itemId)
        )

        setProfile({
          currentStreak: profileData?.current_streak ?? 0,
          longestStreak: profileData?.longest_streak ?? 0,
          lastActivityDate: profileData?.last_activity_date ?? null,
          jlptLevel: profileData?.jlpt_level ?? null,
          hasCompletedOnboarding: profileData?.has_completed_onboarding ?? false,
        })
      } catch (err) {
        console.error('Error marking mastered:', err)
        setError((err as Error).message ?? 'Erro ao marcar como dominado')
      }
    },
    [user?.id, removeFromReview]
  )

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

        const { error } = await supabase.from('user_study_items').upsert(payload, {
          onConflict: 'user_id,item_id',
        })

        if (error) {
          if (isRLSViolation(error)) {
            console.error('RLS VIOLATION: user_study_items upsert failed', {
              userId: user.id,
              itemId,
              code: error.code,
            })
          }
          console.error('Supabase addToStudying error:', error)
          throw error
        }

        setStudyingItems((current) =>
          Array.from(new Set([...current, itemId]))
        )
      } catch (err) {
        console.error('Error adding to studying:', err)
        setError((err as Error).message ?? 'Erro ao adicionar para estudar')
      }
    },
    [user?.id]
  )

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
          await markMastered(itemId)
        } else {
          await upsertReviewItem({
            id: itemId,
            nextReview,
            interval: nextInterval,
            easeFactor: nextEase,
          })
          await addToStudying(itemId)

          const { error: streakError } = await supabase.rpc('update_streak', {
            user_id: user.id,
          })

          if (streakError) {
            if (isRLSViolation(streakError)) {
              console.error('RLS VIOLATION: update_streak rpc failed', {
                userId: user.id,
                code: streakError.code,
              })
            }
            throw streakError
          }

          const { data: profileData, error: profileError } = await supabase
            .from('profiles')
            .select('*')
            .eq('id', user.id)
            .single()

          if (profileError) {
            if (isRLSViolation(profileError)) {
              console.error('RLS VIOLATION: profiles select failed', {
                userId: user.id,
                code: profileError.code,
              })
            }
            throw profileError
          }

          setProfile({
            currentStreak: profileData?.current_streak ?? 0,
            longestStreak: profileData?.longest_streak ?? 0,
            lastActivityDate: profileData?.last_activity_date ?? null,
            jlptLevel: profileData?.jlpt_level ?? null,
            hasCompletedOnboarding: profileData?.has_completed_onboarding ?? false,
          })
        }
      } catch (err) {
        console.error('Error updating review for quality:', err)
        setError((err as Error).message ?? 'Erro ao atualizar revisão')
      }
    },
    [user?.id, reviewQueue, markMastered, upsertReviewItem, addToStudying]
  )

  const resetItemProgress = useCallback(
    async (itemId: string) => {
      if (!user?.id) {
        console.warn('resetItemProgress: user.id is missing')
        return
      }

      try {
        const { error: reviewError } = await supabase
          .from('user_review_queue')
          .delete()
          .eq('user_id', user.id)
          .eq('item_id', itemId)

        if (reviewError) {
          if (isRLSViolation(reviewError)) {
            console.error('RLS VIOLATION: user_review_queue delete failed', {
              userId: user.id,
              itemId,
              code: reviewError.code,
            })
          }
          throw reviewError
        }

        const { error: studyError } = await supabase
          .from('user_study_items')
          .delete()
          .eq('user_id', user.id)
          .eq('item_id', itemId)

        if (studyError) {
          if (isRLSViolation(studyError)) {
            console.error('RLS VIOLATION: user_study_items delete failed', {
              userId: user.id,
              itemId,
              code: studyError.code,
            })
          }
          throw studyError
        }

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

  const resetProgress = useCallback(
    async () => {
      if (!user?.id) {
        console.warn('⚠️ resetProgress: user.id is missing')
        return
      }

      try {
        const { error: reviewError } = await supabase
          .from('user_review_queue')
          .delete()
          .eq('user_id', user.id)

        if (reviewError) {
          if (isRLSViolation(reviewError)) {
            console.error('RLS VIOLATION: user_review_queue bulk delete failed', {
              userId: user.id,
              code: reviewError.code,
            })
          }
          throw reviewError
        }

        const { error: studyError } = await supabase
          .from('user_study_items')
          .delete()
          .eq('user_id', user.id)

        if (studyError) {
          if (isRLSViolation(studyError)) {
            console.error('RLS VIOLATION: user_study_items bulk delete failed', {
              userId: user.id,
              code: studyError.code,
            })
          }
          throw studyError
        }

        const { error: profileError } = await supabase
          .from('profiles')
          .update({ jlpt_level: null, has_completed_onboarding: false })
          .eq('id', user.id)

        if (profileError) {
          if (isRLSViolation(profileError)) {
            console.error('RLS VIOLATION: profiles update failed', {
              userId: user.id,
              code: profileError.code,
            })
          }
          throw profileError
        }

        setReviewQueue([])
        setMasteredItems([])
        setStudyingItems([])
        setProfile((current) => ({
          ...current,
          jlptLevel: null,
          hasCompletedOnboarding: false,
        }))
      } catch (err) {
        console.error('Error resetting progress:', err)
        setError((err as Error).message ?? 'Erro ao resetar progresso')
      }
    },
    [user?.id]
  )

  const setLevel = useCallback(
    async (level: import('../types').JLPTLevel) => {
      if (!user?.id) {
        console.warn('setLevel: user.id is missing')
        return
      }

      try {
        setLoading(true)

        setProfile((current) => ({
          ...current,
          jlptLevel: level,
          hasCompletedOnboarding: false,
        }))

        const { data, error: profileError } = await supabase
          .from('profiles')
          .upsert(
            {
              id: user.id,
              jlpt_level: level,
              has_completed_onboarding: false,
            },
            { onConflict: 'id' }
          )
          .select('current_streak,longest_streak,last_activity_date,jlpt_level,has_completed_onboarding')

        if (profileError) {
          if (isRLSViolation(profileError)) {
            console.error('RLS VIOLATION: profiles upsert failed during setLevel', {
              userId: user.id,
              level,
              code: profileError.code,
            })
          }
          throw profileError
        }

        const profileData = Array.isArray(data) ? data[0] : data

        if (!profileData) {
          console.warn('Profile upsert returned no rows; using fallback profile state')
          setProfile((current) => ({
            ...current,
            jlptLevel: level,
            hasCompletedOnboarding: false,
          }))
        } else {
          setProfile({
            currentStreak: profileData.current_streak ?? 0,
            longestStreak: profileData.longest_streak ?? 0,
            lastActivityDate: profileData.last_activity_date ?? null,
            jlptLevel: profileData.jlpt_level ?? null,
            hasCompletedOnboarding: profileData.has_completed_onboarding ?? false,
          })
        }

        const levelsToMaster: import('../types').JLPTLevel[] = []
        if (level === 'N4') levelsToMaster.push('N5')
        if (level === 'N3') levelsToMaster.push('N5', 'N4')
        if (level === 'N2') levelsToMaster.push('N5', 'N4', 'N3')
        if (level === 'N1') levelsToMaster.push('N5', 'N4', 'N3', 'N2')

        if (levelsToMaster.length > 0) {
          try {
            const { getAllStudyItems } = await import('../services/studyDataService')
            const allItems = await getAllStudyItems()

            const itemsToMaster = allItems.filter((item) => levelsToMaster.includes(item.level))

            if (itemsToMaster.length > 0) {
              const payload = itemsToMaster.map((item) => ({
                user_id: user.id,
                item_id: item.id,
                status: 'mastered' as const,
              }))

              const { error: insertError } = await supabase
                .from('user_study_items')
                .upsert(payload, { onConflict: 'user_id,item_id' })

              if (insertError) {
                if (isRLSViolation(insertError)) {
                  console.error('RLS VIOLATION: user_study_items bulk upsert failed', {
                    userId: user.id,
                    level,
                    code: insertError.code,
                  })
                }
                console.warn('Non-fatal error upserting mastered items', insertError)
              } else {
                const masteredIds = itemsToMaster.map((item) => item.id)
                setMasteredItems((current) => Array.from(new Set([...current, ...masteredIds])))
              }
            }
          } catch (err) {
            console.warn('Non-fatal error while setting mastered levels', err)
          }
        }
      } catch (err) {
        console.error('Error setting level:', err)
        setProfile((current) => ({
          ...current,
          jlptLevel: null,
          hasCompletedOnboarding: false,
        }))
        setError((err as Error).message ?? 'Erro ao definir nível')
        throw err
      } finally {
        setLoading(false)
      }
    },
    [user?.id]
  )

  const completeOnboarding = useCallback(async () => {
    if (!user?.id) {
      console.warn('completeOnboarding: user.id is missing')
      return
    }

    try {
      const { error } = await supabase
        .from('profiles')
        .update({ has_completed_onboarding: true })
        .eq('id', user.id)

      if (error) {
        if (isRLSViolation(error)) {
          console.error('RLS VIOLATION: profiles update failed during completeOnboarding', {
            userId: user.id,
            code: error.code,
          })
        }
        throw error
      }

      setProfile((current) => ({
        ...current,
        hasCompletedOnboarding: true,
      }))
    } catch (err) {
      console.error('Error completing onboarding:', err)
      setError((err as Error).message ?? 'Erro ao completar onboarding')
    }
  }, [user?.id])

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
    profile,
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
    setLevel,
    completeOnboarding,
  }
}
