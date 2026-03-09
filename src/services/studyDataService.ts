import type { JLPTLevel, StudyItem, StudyType } from '../types'

import N5Grammar from '../data/N5/grammar.json'
import N5Vocabulary from '../data/N5/vocabulary.json'
import N4Grammar from '../data/N4/grammar.json'
import N4Vocabulary from '../data/N4/vocabulary.json'
import N3Grammar from '../data/N3/grammar.json'
import N3Vocabulary from '../data/N3/vocabulary.json'
import N2Grammar from '../data/N2/grammar.json'
import N2Vocabulary from '../data/N2/vocabulary.json'
import N1Grammar from '../data/N1/grammar.json'
import N1Vocabulary from '../data/N1/vocabulary.json'

const data: Record<JLPTLevel, Record<StudyType, StudyItem[]>> = {
  N5: {
    grammar: N5Grammar as unknown as StudyItem[],
    vocabulary: N5Vocabulary as unknown as StudyItem[],
  },
  N4: {
    grammar: N4Grammar as unknown as StudyItem[],
    vocabulary: N4Vocabulary as unknown as StudyItem[],
  },
  N3: {
    grammar: N3Grammar as unknown as StudyItem[],
    vocabulary: N3Vocabulary as unknown as StudyItem[],
  },
  N2: {
    grammar: N2Grammar as unknown as StudyItem[],
    vocabulary: N2Vocabulary as unknown as StudyItem[],
  },
  N1: {
    grammar: N1Grammar as unknown as StudyItem[],
    vocabulary: N1Vocabulary as unknown as StudyItem[],
  },
}

export function getStudyItems(level: JLPTLevel, type: StudyType): StudyItem[] {
  return data[level]?.[type] ?? []
}

export function getAllStudyItems(): StudyItem[] {
  return Object.values(data).flatMap((group) => [...group.grammar, ...group.vocabulary])
}

export function findStudyItemById(id: string): StudyItem | undefined {
  return getAllStudyItems().find((item) => item.id === id)
}

export function getTotalItemsByLevel(level: JLPTLevel): number {
  return getStudyItems(level, 'grammar').length + getStudyItems(level, 'vocabulary').length
}
