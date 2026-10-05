import { useEffect, useState } from 'react'
import { useLocation, useParams, Navigate, useNavigate} from 'react-router-dom'
import * as wanakana from 'wanakana'
import { useStudyData } from '../hooks/useStudyData'
import { useUserProgress } from '../hooks/useUserProgress'
import { JLPT_LEVELS } from '../utils/constants'
import { StudyItemCard } from '../components/StudyItemCard'
import { ArrowLeft, Search, X } from 'lucide-react'
import type { StudyItem } from '../types'

type StatusFilter = 'all' | 'new' | 'review' | 'mastered'

const FILTERS: { id: StatusFilter; label: string }[] = [
  { id: 'all', label: 'Todos' },
  { id: 'new', label: 'Não estudados' },
  { id: 'review', label: 'Em revisão' },
  { id: 'mastered', label: 'Dominados' },
]

// Minúsculas e sem acentos, para "permissao" achar "permissão"
function normalizeSearch(value: string) {
  return value.normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase().trim()
}

function matchesQuery(item: StudyItem, query: string) {
  if (!query) return true
  const haystack = normalizeSearch(
    [item.id, item.japanese, item.reading ?? '', item.translation].join(' '),
  )
  const needles = [normalizeSearch(query)]
  // Busca por romaji também encontra o japonês (ex.: "temo" → "ても")
  if (wanakana.isRomaji(query.trim())) {
    needles.push(normalizeSearch(wanakana.toHiragana(query.trim())))
  }
  return needles.some((needle) => needle && haystack.includes(needle))
}

export function LevelPage() {
  const navigate = useNavigate()
  const location = useLocation()
  const params = useParams<{ level: string }>()
  const level = params.level as any

  const scrollTo = new URLSearchParams(location.search).get('scrollTo')
  const { progress } = useUserProgress()
  const [query, setQuery] = useState('')
  const [statusFilter, setStatusFilter] = useState<StatusFilter>('all')

  useEffect(() => {
    if (!scrollTo) return
    const element = document.getElementById(`study-item-${scrollTo}`)
    if (!element) return
    element.scrollIntoView({ behavior: 'smooth', block: 'center' })
  }, [scrollTo])

  if (!level || !JLPT_LEVELS.includes(level)) {
    return <Navigate to="/" replace />
  }

  const { grammar, isLoading } = useStudyData(level as any)

  const getStatus = (itemId: string): Exclude<StatusFilter, 'all'> => {
    if (progress.masteredItems.includes(itemId)) return 'mastered'
    if (
      progress.studyingItems.includes(itemId) ||
      progress.reviewQueue.some((review) => review.id === itemId)
    ) return 'review'
    return 'new'
  }

  const filteredGrammar = grammar.filter(
    (item) =>
      (statusFilter === 'all' || getStatus(item.id) === statusFilter) &&
      matchesQuery(item, query),
  )
  const isFiltering = query.trim() !== '' || statusFilter !== 'all'

  return (
    <main className="page">
      <header className="page__header">
        <div className="page__header-top">
          <button type="button" className="link-button" onClick={() => navigate('/')}>
            <ArrowLeft size={16} className="link-button__arrow" /> Voltar
          </button>
        </div>
        <span className="page__eyebrow">jlpt · {String(level).toLowerCase()}</span>
        <h1>Nível {level}</h1>
        <p>Escolha um item para estudar ou revisar.</p>
      </header>

      <section className="section">
        <h2>
          Gramática
          {!isLoading && grammar.length > 0 && (
            <span className="section__count">
              {isFiltering ? `${filteredGrammar.length} de ${grammar.length}` : grammar.length}
            </span>
          )}
        </h2>
        {!isLoading && grammar.length > 0 && (
          <div className="level-filters">
            <label className="level-search">
              <Search size={16} className="level-search__icon" aria-hidden="true" />
              <input
                type="search"
                value={query}
                onChange={(event) => setQuery(event.target.value)}
                placeholder="Buscar por japonês, romaji ou significado"
                aria-label="Buscar gramática"
              />
              {query && (
                <button
                  type="button"
                  className="level-search__clear"
                  onClick={() => setQuery('')}
                  aria-label="Limpar busca"
                >
                  <X size={14} />
                </button>
              )}
            </label>
            <div className="level-filter-chips" role="group" aria-label="Filtrar por situação">
              {FILTERS.map((filter) => (
                <button
                  key={filter.id}
                  type="button"
                  className={`level-filter-chip ${statusFilter === filter.id ? 'level-filter-chip--active' : ''}`}
                  aria-pressed={statusFilter === filter.id}
                  onClick={() => setStatusFilter(filter.id)}
                >
                  {filter.label}
                </button>
              ))}
            </div>
          </div>
        )}
        {isLoading ? (
          <p className="empty-state">Carregando itens de gramática...</p>
        ) : grammar.length === 0 ? (
          <p className="empty-state">Ainda não há itens de gramática neste nível.</p>
        ) : filteredGrammar.length === 0 ? (
          <div className="level-no-results">
            <p className="empty-state">Nenhum item encontrado com esses filtros.</p>
            <button
              type="button"
              className="button button--ghost"
              onClick={() => {
                setQuery('')
                setStatusFilter('all')
              }}
            >
              Limpar filtros
            </button>
          </div>
        ) : (
          <ul className="study-item-list">
            {filteredGrammar.map((item) => (
              <StudyItemCard key={item.id} item={item} />
            ))}
          </ul>
        )}
      </section>
    </main>
  )
}
