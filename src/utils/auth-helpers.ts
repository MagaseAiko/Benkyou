import { supabase } from './supabase'

/**
 * 🔐 SECURE: Get the current authenticated user's ID from Supabase Auth
 * 
 * ALWAYS use this function instead of trusting external sources for user ID.
 * This ensures RLS policies can safely rely on auth.uid() function.
 * 
 * @throws Error if user is not authenticated
 * @returns {string} The authenticated user's unique ID
 * 
 * USAGE:
 * ```ts
 * const userId = await getUserId();
 * const { data, error } = await supabase
 *   .from('user_study_items')
 *   .select('*')
 *   .eq('user_id', userId);  // ✅ SAFE
 * ```
 */
export async function getUserId(): Promise<string> {
  const { data, error } = await supabase.auth.getUser()

  if (error) {
    console.error('❌ Auth error:', error.message)
    throw new Error(`Erro de autenticação: ${error.message}`)
  }

  if (!data.user?.id) {
    console.error('❌ User not authenticated')
    throw new Error('Usuário não autenticado. Por favor, faça login novamente.')
  }

  return data.user.id
}

/**
 * 🔐 SAFE: Validate that a given user ID matches the current authenticated user
 * 
 * Use this before performing operations on behalf of a user to ensure
 * we're never accidentally modifying another user's data.
 * 
 * @param userId - The user ID to validate
 * @throws Error if user is not authenticated or IDs don't match
 * 
 * USAGE:
 * ```ts
 * async function updateUserProfile(userId: string, data: any) {
 *   await assertUserOwnership(userId);  // ✅ Throws if user != authenticated user
 *   // ... now safe to update
 * }
 * ```
 */
export async function assertUserOwnership(userId: string): Promise<void> {
  const authenticatedUserId = await getUserId()
  
  if (userId !== authenticatedUserId) {
    console.error('❌ User ownership check failed', {
      provided: userId,
      authenticated: authenticatedUserId,
    })
    throw new Error('Você não tem permissão para acessar esses dados.')
  }
}

/**
 * 🔐 SAFE: Perform a database operation with automatic user ID validation
 * 
 * This wrapper ensures that all database operations are performed with
 * the correct user ID, preventing accidental or malicious data access.
 * 
 * @param operation - Async function that performs DB operation
 * @param operationName - Name for logging/error messages
 * @returns Result from operation
 * 
 * USAGE:
 * ```ts
 * const items = await performUserOperation(
 *   async (userId) => {
 *     const { data, error } = await supabase
 *       .from('user_study_items')
 *       .select('*')
 *       .eq('user_id', userId);
 *     if (error) throw error;
 *     return data;
 *   },
 *   'Carregando itens de estudo'
 * );
 * ```
 */
export async function performUserOperation<T>(
  operation: (userId: string) => Promise<T>,
  operationName: string
): Promise<T> {
  try {
    const userId = await getUserId()
    return await operation(userId)
  } catch (err) {
    const message = err instanceof Error ? err.message : 'Erro desconhecido'
    console.error(`❌ [${operationName}] ${message}`)
    throw err
  }
}

/**
 * 🔐 SAFE: Handle Supabase 403 (Forbidden) errors with helpful feedback
 * 
 * When RLS policies reject a query, Supabase returns error code 42501.
 * This helper identifies these errors and provides helpful debugging info.
 * 
 * @param error - The error object from Supabase
 * @returns {boolean} True if error is a 403 RLS violation
 * 
 * USAGE:
 * ```ts
 * const { error } = await supabase.from('table').select('*');
 * if (isRLSViolation(error)) {
 *   console.error('RLS VIOLATION:', error);
 *   // RLS policy rejected the query
 * }
 * ```
 */
export function isRLSViolation(error: any): boolean {
  return error?.code === '42501' || error?.status === 403
}

/**
 * 🔐 SAFE: Ensure user is authenticated before proceeding
 * 
 * Call this at the start of any component or hook that requires authentication.
 * 
 * @returns {string} The authenticated user's ID if valid
 * @throws Error if not authenticated
 */
export async function requireAuth(): Promise<string> {
  const { data, error } = await supabase.auth.getUser()

  if (error || !data.user?.id) {
    console.error('❌ requireAuth failed:', error?.message)
    throw new Error('Autenticação necessária')
  }

  return data.user.id
}

/**
 * 📝 NOTE: RLS Policy Requirements
 * 
 * For every table that requires user-scoped access, ensure your RLS policies:
 * 
 * 1. **SELECT policy:**
 *    ```sql
 *    SELECT (auth.uid() = user_id)
 *    ```
 * 
 * 2. **INSERT policy:**
 *    ```sql
 *    INSERT (auth.uid() = user_id)
 *    ```
 * 
 * 3. **UPDATE policy:**
 *    ```sql
 *    UPDATE (auth.uid() = user_id)
 *    ```
 * 
 * 4. **DELETE policy:**
 *    ```sql
 *    DELETE (auth.uid() = user_id)
 *    ```
 * 
 * Tables that should ALWAYS use `user_id` check:
 * - profiles
 * - user_study_items
 * - user_review_queue
 * - user_daily_activity
 * - review_answers (if user-scoped)
 * 
 * Tables that should be READ-ONLY (no INSERT/UPDATE/DELETE):
 * - grammar
 * - examples
 * - review_sentences
 */
