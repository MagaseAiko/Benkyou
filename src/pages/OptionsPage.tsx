import { useCallback, useState } from 'react'
import { useReviewSystem } from '../hooks/useReviewSystem'
import { LOCAL_STORAGE_PROGRESS_KEY } from '../utils/constants'

export function OptionsPage() {
  const { progress, resetProgress } = useReviewSystem()
  const [importError, setImportError] = useState<string | null>(null)
  const [isResetModalOpen, setIsResetModalOpen] = useState(false)

  const handleResetClick = useCallback(() => {
    setIsResetModalOpen(true)
  }, [])

  const handleConfirmReset = useCallback(() => {
    resetProgress()
    setIsResetModalOpen(false)
  }, [resetProgress])

  const handleCancelReset = useCallback(() => {
    setIsResetModalOpen(false)
  }, [])

  const handleExport = useCallback(() => {
    const blob = new Blob([JSON.stringify(progress, null, 2)], {
      type: 'application/json',
    })
    const url = URL.createObjectURL(blob)
    const link = document.createElement('a')
    link.href = url
    link.download = `${LOCAL_STORAGE_PROGRESS_KEY}.json`
    document.body.appendChild(link)
    link.click()
    document.body.removeChild(link)
    URL.revokeObjectURL(url)
  }, [progress])

  const handleImportFile = useCallback(
    (file: File | null) => {
      if (!file) return

      setImportError(null)
      const reader = new FileReader()
      reader.onload = () => {
        try {
          const parsed = JSON.parse(reader.result as string)
          if (!parsed || typeof parsed !== 'object') throw new Error('Formato inválido')
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          const data = parsed as any
          if (!data.reviewQueue || !data.masteredItems || !data.studyingItems) {
            throw new Error('Arquivo não contém dados de progresso esperados')
          }

          // Use localStorage directly to avoid bypassing validation logic.
          window.localStorage.setItem(LOCAL_STORAGE_PROGRESS_KEY, JSON.stringify(data))
          window.location.reload()
        } catch (error) {
          setImportError((error as Error).message ?? 'Erro ao importar')
        }
      }
      reader.readAsText(file)
    },
    [],
  )

  return (
    <main className="page">
      <header className="page__header">
        <h1>Opções</h1>
        <p>Configurações gerais do aplicativo.</p>
      </header>

      <section className="section">
        <h2>Progresso</h2>
        <p>
          Você pode resetar seu progresso de estudo e revisão. Isso irá limpar todos os itens em andamento
          e reiniciar seu histórico.
        </p>
        <div className="actions__progress">
          <button className="button button--secondary" type="button" onClick={handleResetClick}>
            Apagar progresso
          </button>
          <button className="button" type="button" onClick={handleExport}>
            Exportar progresso
          </button>
          <label className="link-button" style={{ cursor: 'pointer' }}>
            Importar progresso
            <input
              type="file"
              accept="application/json"
              style={{ display: 'none' }}
              onChange={(event) => handleImportFile(event.target.files?.[0] ?? null)}
            />
          </label>
        </div>
        {importError && <p className="stat-note">Erro: {importError}</p>}
      </section>

      {isResetModalOpen && (
        <div className="modal" role="dialog" aria-modal="true">
          <div className="modal__backdrop" onClick={handleCancelReset} />
          <div className="modal__content">
            <h2>Apagar todo o progresso</h2>
            <p>
              Isso vai apagar todo o progresso do aplicativo e restaurar o estado original.
              Deseja continuar?
            </p>
            <div className="modal__actions">
              <button className="button" type="button" onClick={handleCancelReset}>
                Cancelar
              </button>
              <button
                className="button button--primary"
                type="button"
                onClick={handleConfirmReset}
              >
                Apagar progresso
              </button>
            </div>
          </div>
        </div>
      )}

      <section className="section">
        <h2>Sobre</h2>
        <p>
          O progresso é salvo no <strong>localStorage</strong> do seu navegador. Se você quiser acessar
          seus dados em outro dispositivo, utilize a opção de exportação.
        </p>
      </section>
    </main>
  )
}
