import type { GrammarItem } from '../types'

/**
 * Highlights the grammar pattern in a Japanese sentence using the grammar's match rules.
 * Priority: match_regex > variations > base_form
 */
export function highlightGrammar(sentence: string, grammar: GrammarItem): string {
  if (!sentence || !grammar) return sentence

  let match: RegExpExecArray | null = null
  let regex: RegExp | null = null

  // 1. Try match_regex (primary)
  if (grammar.match_regex) {
    try {
      regex = new RegExp(grammar.match_regex, 'u') // 'u' for Unicode support
      match = regex.exec(sentence)
    } catch (error) {
      console.warn(`Invalid regex for grammar ${grammar.id}: ${grammar.match_regex}`, error)
    }
  }

  // 2. If no match, try variations
  if (!match && grammar.variations && grammar.variations.length > 0) {
    for (const variation of grammar.variations) {
      if (variation) {
        try {
          regex = new RegExp(escapeRegExp(variation), 'u')
          match = regex.exec(sentence)
          if (match) break
        } catch (error) {
          console.warn(`Invalid variation regex for grammar ${grammar.id}: ${variation}`, error)
        }
      }
    }
  }

  // 3. If still no match, fallback to base_form
  if (!match && grammar.base_form) {
    try {
      regex = new RegExp(escapeRegExp(grammar.base_form), 'u')
      match = regex.exec(sentence)
    } catch (error) {
      console.warn(`Invalid base_form regex for grammar ${grammar.id}: ${grammar.base_form}`, error)
    }
  }

  // If we found a match, highlight it
  if (match && regex) {
    const start = match.index
    const end = start + match[0].length
    const before = sentence.slice(0, start)
    const highlighted = match[0]
    const after = sentence.slice(end)

    return `${before}<span class="grammar-highlight">${highlighted}</span>${after}`
  }

  // No match found, return original sentence
  return sentence
}

/**
 * Escapes special regex characters in a string for literal matching
 */
function escapeRegExp(string: string): string {
  return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')
}

/**
 * Highlights grammar patterns in HTML content
 */
export function highlightGrammarInHTML(html: string, grammar: GrammarItem): string {
  if (!html || !grammar) return html

  let match: RegExpExecArray | null = null
  let regex: RegExp | null = null

  // 1. Try match_regex (primary)
  if (grammar.match_regex) {
    try {
      regex = new RegExp(grammar.match_regex, 'u') // 'u' for Unicode support
      match = regex.exec(html)
    } catch (error) {
      console.warn(`Invalid regex for grammar ${grammar.id}: ${grammar.match_regex}`, error)
    }
  }

  // 2. If no match, try variations
  if (!match && grammar.variations && grammar.variations.length > 0) {
    for (const variation of grammar.variations) {
      if (variation) {
        try {
          regex = new RegExp(escapeRegExp(variation), 'u')
          match = regex.exec(html)
          if (match) break
        } catch (error) {
          console.warn(`Invalid variation regex for grammar ${grammar.id}: ${variation}`, error)
        }
      }
    }
  }

  // 3. If still no match, fallback to base_form
  if (!match && grammar.base_form) {
    try {
      regex = new RegExp(escapeRegExp(grammar.base_form), 'u')
      match = regex.exec(html)
    } catch (error) {
      console.warn(`Invalid base_form regex for grammar ${grammar.id}: ${grammar.base_form}`, error)
    }
  }

  // If we found a match, highlight it
  if (match && regex) {
    const start = match.index
    const end = start + match[0].length
    const before = html.slice(0, start)
    const highlighted = match[0]
    const after = html.slice(end)

    return `${before}<span class="grammar-highlight">${highlighted}</span>${after}`
  }

  // No match found, return original HTML
  return html
}