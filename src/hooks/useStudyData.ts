import { useMemo } from 'react'
import type { JLPTLevel } from '../types'
import { getStudyItems, findStudyItemById } from '../services/studyDataService'

export function useStudyData(level: JLPTLevel) {
  const grammar = useMemo(() => getStudyItems(level, 'grammar'), [level])
  const vocabulary = useMemo(() => getStudyItems(level, 'vocabulary'), [level])

  return {
    level,
    grammar,
    vocabulary,
  }
}

export function useStudyItem(itemId: string) {
  return useMemo(() => findStudyItemById(itemId), [itemId])
}
