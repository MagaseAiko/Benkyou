import { useEffect, useMemo, useState } from 'react'
import type { JLPTLevel, StudyItem } from '../types'
import {
  getAllGrammar,
  getGrammarById,
  getStudyItems,
  findStudyItemById,
} from '../services/studyDataService'

export function useStudyData(level: JLPTLevel) {
  const [grammar, setGrammar] = useState<StudyItem[]>([])
  const [isLoading, setIsLoading] = useState<boolean>(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    let isMounted = true

    setIsLoading(true)
    setError(null)

    getAllGrammar()
      .then((items) => {
        if (!isMounted) return
        setGrammar(items.filter((item) => item.level === level))
      })
      .catch((fetchError) => {
        if (!isMounted) return
        setError(fetchError?.message ?? 'Erro ao carregar itens de gramática.')
      })
      .finally(() => {
        if (!isMounted) return
        setIsLoading(false)
      })

    return () => {
      isMounted = false
    }
  }, [level])

  const vocabulary = useMemo(() => getStudyItems(level, 'vocabulary'), [level])

  return {
    level,
    grammar,
    vocabulary,
    isLoading,
    error,
  }
}

export function useStudyItem(itemId: string) {
  const [item, setItem] = useState<StudyItem | undefined>(undefined)
  const [isLoading, setIsLoading] = useState<boolean>(false)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    let isMounted = true

    if (!itemId) {
      setItem(undefined)
      setIsLoading(false)
      setError(null)
      return
    }

    // First try local data (vocabulary)
    const localItem = findStudyItemById(itemId)
    if (localItem) {
      setItem(localItem)
      setIsLoading(false)
      return
    }

    // If not found locally, try Supabase (grammar)
    getGrammarById(itemId)
      .then((grammarItem) => {
        if (!isMounted) return
        if (grammarItem) {
          setItem(grammarItem)
          return
        }

        setItem(undefined)
      })
      .catch((error) => {
        if (!isMounted) return
        setError(error?.message ?? 'Erro ao carregar o item.')
        setItem(undefined)
      })
      .finally(() => {
        if (!isMounted) return
        setIsLoading(false)
      })

    return () => {
      isMounted = false
    }
  }, [itemId])

  return {
    item,
    isLoading,
    error,
  }
}
