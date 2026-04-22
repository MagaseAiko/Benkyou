import type { JLPTLevel, StudyItem, StudyType, ExampleSentence, ReviewSentence } from '../types'
import { supabase } from '../utils/supabase'

// const vocabularyData: Record<JLPTLevel, StudyItem[]> = {
//   N5: N5Vocabulary as unknown as StudyItem[],
//   N4: N4Vocabulary as unknown as StudyItem[],
//   N3: N3Vocabulary as unknown as StudyItem[],
//   N2: N2Vocabulary as unknown as StudyItem[],
//   N1: N1Vocabulary as unknown as StudyItem[],
// }

const vocabularyData: Record<JLPTLevel, StudyItem[]> = {
  N5: [],
  N4: [],
  N3: [],
  N2: [],
  N1: [],
}

const JLPT_LEVELS: JLPTLevel[] = ['N5', 'N4', 'N3', 'N2', 'N1']

const isValidLevel = (value: string): value is JLPTLevel => JLPT_LEVELS.includes(value as JLPTLevel)

type SupabaseExample = {
  japanese: string
  reading?: string | null
  translation: string
}

type SupabaseReviewAnswer = {
  answer: string
}

type SupabaseReviewSentence = {
  sentence: string
  translation?: string | null
  review_answers?: SupabaseReviewAnswer[]
}

type SupabaseGrammarRow = {
  id: string
  type: 'grammar'
  level: string
  japanese: string
  reading?: string | null
  translation: string
  structure?: string | null
  explanation: string
  notes?: string | null
  examples?: SupabaseExample[]
  review_sentences?: SupabaseReviewSentence[]
}

let grammarCache: StudyItem[] | null = null

const normalizeLevel = (value: string): JLPTLevel => (isValidLevel(value) ? value : 'N5')

const mapGrammarRowToItem = (row: SupabaseGrammarRow): StudyItem => {
  return {
    id: row.id,
    type: 'grammar',
    level: normalizeLevel(row.level),
    japanese: row.japanese,
    reading: row.reading ?? undefined,
    translation: row.translation,
    structure: row.structure ?? undefined,
    explanation: row.explanation,
    notes: row.notes ?? undefined,
    examples: (row.examples ?? []).map<ExampleSentence>((example) => ({
      japanese: example.japanese,
      reading: example.reading ?? undefined,
      translation: example.translation,
    })),
    review_sentences: (row.review_sentences ?? []).map<ReviewSentence>((sentence) => ({
      sentence: sentence.sentence,
      translation: sentence.translation ?? undefined,
      answers: (sentence.review_answers ?? []).map((answer) => answer.answer),
    })),
  }
}

export async function getAllGrammar(): Promise<StudyItem[]> {
  if (grammarCache) {
    return grammarCache
  }

  const { data, error } = await supabase
    .from('grammar')
    .select('*, examples(*), review_sentences(*, review_answers(answer))')
    .order('level', { ascending: true })
    .order('id', { ascending: true })

  if (error) {
    throw error
  }

  grammarCache = (data ?? []).map(mapGrammarRowToItem)
  return grammarCache
}

export async function getGrammarById(id: string): Promise<StudyItem | null> {
  if (grammarCache) {
    const cachedItem = grammarCache.find((item) => item.id === id)
    if (cachedItem) {
      return cachedItem
    }
  }

  const { data, error } = await supabase
    .from('grammar')
    .select('*, examples(*), review_sentences(*, review_answers(answer))')
    .eq('id', id)
    .maybeSingle()

  if (error) {
    throw error
  }

  if (!data) {
    return null
  }

  const item = mapGrammarRowToItem(data)
  grammarCache = grammarCache ? [...grammarCache, item] : [item]
  return item
}

export function getStudyItems(level: JLPTLevel, type: StudyType): StudyItem[] {
  if (type === 'vocabulary') {
    return vocabularyData[level] ?? []
  }

  return grammarCache?.filter((item) => item.level === level) ?? []
}

export async function getAllStudyItems(): Promise<StudyItem[]> {
  const grammarItems = await getAllGrammar()
  return [...grammarItems, ...Object.values(vocabularyData).flatMap((items) => items)]
}

export function findStudyItemById(id: string): StudyItem | undefined {
  const vocabularyMatch = Object.values(vocabularyData)
    .flatMap((items) => items)
    .find((item) => item.id === id)

  if (vocabularyMatch) {
    return vocabularyMatch
  }

  return grammarCache?.find((item) => item.id === id)
}

export function getTotalItemsByLevel(level: JLPTLevel): number {
  const vocabularyCount = getStudyItems(level, 'vocabulary').length
  const grammarCount = grammarCache?.filter((item) => item.level === level).length ?? 0
  return vocabularyCount + grammarCount
}
