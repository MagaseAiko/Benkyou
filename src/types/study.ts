export type JLPTLevel = 'N5' | 'N4' | 'N3' | 'N2' | 'N1'

export type StudyType = 'grammar' | 'vocabulary'

export type ExampleSentence = {
  japanese: string
  reading?: string
  translation: string
}

export type ReviewSentence = {
  sentence: string
  translation?: string
  answers: string[]
}

export type GrammarItem = {
  id: string
  type: 'grammar'
  level: JLPTLevel

  japanese: string
  reading?: string
  translation: string

  structure?: string

  explanation: string

  examples: ExampleSentence[]
  review_sentences?: ReviewSentence[]

  notes?: string

  // Novos campos para highlight
  base_form: string
  match_regex: string
  tokens: string[]
  variations: string[]
}

export type StudyItem = GrammarItem | {
  id: string
  type: 'vocabulary'
  level: JLPTLevel

  japanese: string
  reading?: string
  translation: string

  structure?: string

  explanation: string

  examples: ExampleSentence[]
  review_sentences?: ReviewSentence[]

  notes?: string
}
