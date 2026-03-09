export type JLPTLevel = 'N5' | 'N4' | 'N3' | 'N2' | 'N1'

export type StudyType = 'grammar' | 'vocabulary'

export type ExampleSentence = {
  japanese: string
  reading?: string
  translation: string
}

export type StudyItem = {
  id: string
  type: StudyType
  level: JLPTLevel

  japanese: string
  reading?: string
  translation: string

  explanation: string

  examples: ExampleSentence[]

  notes?: string
}
