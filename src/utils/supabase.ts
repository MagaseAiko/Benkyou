import { createClient } from '@supabase/supabase-js'

const getEnvValue = (key: 'VITE_SUPABASE_URL' | 'VITE_SUPABASE_PUBLISHABLE_KEY'): string | undefined => {
  // Try Node.js environment first (for scripts/migrations)
  if (typeof process !== 'undefined' && process.env?.[key]) {
    return process.env[key]
  }

  // Try Vite environment (for browser)
  if (typeof import.meta !== 'undefined' && (import.meta as any).env?.[key]) {
    return (import.meta as any).env[key]
  }

  return undefined
}

const supabaseUrl = getEnvValue('VITE_SUPABASE_URL')
const supabaseKey = getEnvValue('VITE_SUPABASE_PUBLISHABLE_KEY')

if (!supabaseUrl || !supabaseKey) {
  throw new Error('Missing Supabase configuration. Please set VITE_SUPABASE_URL and VITE_SUPABASE_PUBLISHABLE_KEY.')
}

export const supabase = createClient(supabaseUrl, supabaseKey)