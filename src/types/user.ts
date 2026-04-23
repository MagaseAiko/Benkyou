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

export type UserProfile = {
  currentStreak: number
  longestStreak: number
  lastActivityDate: string | null
}

export type StudyState = {
  items: StudyItem[]
  progress: UserProgress
}
