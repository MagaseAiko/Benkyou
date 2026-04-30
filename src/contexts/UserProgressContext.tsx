import { createContext, useContext, useState, useCallback, useEffect, useMemo } from 'react'
import type { UserProfile } from '../types'
import { supabase } from '../utils/supabase'
import { isRLSViolation } from '../utils/auth-helpers'
import { useAuth } from '../hooks/useAuth'
import { getAllStudyItems } from '../services/studyDataService'

type UserProgressContextType = {
  profile: UserProfile
  loading: boolean
  error: string | null
  setLevel: (level: string) => Promise<void>
}

export const UserProgressContext = createContext<UserProgressContextType | null>(null)

export function useUserProgressContext() {
  const context = useContext(UserProgressContext)
  if (!context) {
    throw new Error('useUserProgressContext must be used within UserProgressProvider')
  }
  return context
}

export function UserProgressProvider({ children }: { children: React.ReactNode }) {
  const { user } = useAuth()
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
    if (!user?.id) {
      setLoading(false)
      return
    }

    const loadProfile = async () => {
      try {
        setLoading(true)
        setError(null)
        const { data, error: profileError } = await supabase
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

        setProfile({
          currentStreak: data?.current_streak ?? 0,
          longestStreak: data?.longest_streak ?? 0,
          lastActivityDate: data?.last_activity_date ?? null,
          jlptLevel: data?.jlpt_level ?? null,
          hasCompletedOnboarding: data?.has_completed_onboarding ?? false,
        })
      } catch (err) {
        console.error('Error loading profile:', err)
        setError((err as Error).message ?? 'Erro ao carregar perfil')
      } finally {
        setLoading(false)
      }
    }

    loadProfile()
  }, [user?.id])

  const setLevel = useCallback(async (level: string) => {
    if (!user?.id) {
      console.warn('setLevel: user.id is missing')
      return
    }

    setLoading(true)
    try {
      // Optimistic update
      setProfile(current => ({ ...current, jlptLevel: level as any, hasCompletedOnboarding: false }))

      const { error } = await supabase
        .from('profiles')
        .upsert({
          id: user.id,
          jlpt_level: level,
          has_completed_onboarding: false,
        })

      if (error) {
        if (isRLSViolation(error)) {
          console.error('RLS VIOLATION: profiles upsert failed during setLevel', {
            userId: user.id,
            level,
            code: error.code,
          })
        }
        throw error
      }

      const { data, error: selectError } = await supabase
        .from('profiles')
        .select('current_streak,longest_streak,last_activity_date,jlpt_level,has_completed_onboarding')
        .eq('id', user.id)
        .single()

      if (selectError) throw selectError

      setProfile({
        currentStreak: data.current_streak ?? 0,
        longestStreak: data.longest_streak ?? 0,
        lastActivityDate: data.last_activity_date ?? null,
        jlptLevel: data.jlpt_level ?? null,
        hasCompletedOnboarding: data.has_completed_onboarding ?? false,
      })

      const levelsToMaster: string[] = []
      if (level === 'N4') levelsToMaster.push('N5')
      if (level === 'N3') levelsToMaster.push('N5', 'N4')
      if (level === 'N2') levelsToMaster.push('N5', 'N4', 'N3')
      if (level === 'N1') levelsToMaster.push('N5', 'N4', 'N3', 'N2')

      if (levelsToMaster.length > 0) {
        try {
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
                  code: insertError.code,
                })
              }
              console.warn('Non-fatal error upserting mastered items', insertError)
            }
          }
        } catch (err) {
          console.warn('Non-fatal error while setting mastered levels', err)
        }
      }
    } catch (err) {
      setProfile(current => ({ ...current, jlptLevel: null, hasCompletedOnboarding: false }))
      setError((err as Error).message ?? 'Erro ao definir nível')
      throw err
    } finally {
      setLoading(false)
    }
  }, [user?.id])

  const value = useMemo(() => ({
    profile,
    loading,
    error,
    setLevel,
  }), [profile, loading, error, setLevel])

  return (
    <UserProgressContext.Provider value={value}>
      {children}
    </UserProgressContext.Provider>
  )
}