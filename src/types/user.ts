import type { StudyItem } from './study'

export type ReviewItem = {
  id: string
  nextReview: number
  interval: number
  easeFactor: number
}

export type UserProgress = {
  reviewQueue: ReviewItem[]
  masteredItems: string[]
  studyingItems: string[]
}

export type StudyState = {
  items: StudyItem[]
  progress: UserProgress
}
