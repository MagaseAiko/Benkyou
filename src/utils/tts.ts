/**
 * Gera e toca o áudio de uma frase em japonês via /api/tts.
 * Resolve quando o áudio termina de tocar e rejeita em caso de erro.
 */
export async function playJapaneseAudio(text: string): Promise<void> {
  const response = await fetch('/api/tts', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ text }),
  })

  if (!response.ok) {
    throw new Error(`Erro na requisição: ${response.status}`)
  }

  const audioBlob = await response.blob()
  const audioUrl = URL.createObjectURL(audioBlob)
  const audio = new Audio(audioUrl)

  try {
    await new Promise<void>((resolve, reject) => {
      audio.onended = () => resolve()
      audio.onerror = () => reject(new Error('Erro ao reproduzir áudio'))
      audio.play().catch(reject)
    })
  } finally {
    URL.revokeObjectURL(audioUrl)
  }
}
