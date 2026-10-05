import type { IncomingMessage, ServerResponse } from 'node:http'

/*
 * Proxy de texto-para-fala (Deepgram).
 * A chave fica só no servidor (variável DEEPGRAM_API_KEY) e nunca chega ao navegador.
 * Roda como Vercel Function em produção e como middleware do Vite em desenvolvimento.
 */

const DEEPGRAM_URL = 'https://api.deepgram.com/v1/speak?model=aura-2-fujin-ja'
const MAX_TEXT_LENGTH = 300

type TtsRequest = IncomingMessage & { body?: unknown }

function sendJson(res: ServerResponse, status: number, payload: Record<string, string>) {
  res.statusCode = status
  res.setHeader('Content-Type', 'application/json; charset=utf-8')
  res.end(JSON.stringify(payload))
}

async function readBody(req: TtsRequest): Promise<unknown> {
  // A Vercel já entrega o corpo parseado; no Vite precisamos ler o stream.
  if (req.body !== undefined) {
    if (typeof req.body === 'string') return JSON.parse(req.body)
    return req.body
  }

  const chunks: Buffer[] = []
  for await (const chunk of req) {
    chunks.push(typeof chunk === 'string' ? Buffer.from(chunk) : chunk)
  }
  const raw = Buffer.concat(chunks).toString('utf8')
  return raw ? JSON.parse(raw) : {}
}

export default async function handler(req: TtsRequest, res: ServerResponse) {
  if (req.method !== 'POST') {
    res.setHeader('Allow', 'POST')
    sendJson(res, 405, { error: 'Método não permitido' })
    return
  }

  const apiKey = process.env.DEEPGRAM_API_KEY
  if (!apiKey) {
    sendJson(res, 500, { error: 'DEEPGRAM_API_KEY não configurada no servidor' })
    return
  }

  let text = ''
  try {
    const body = await readBody(req)
    if (body && typeof body === 'object' && 'text' in body && typeof body.text === 'string') {
      text = body.text.trim()
    }
  } catch {
    sendJson(res, 400, { error: 'Corpo da requisição inválido' })
    return
  }

  if (!text || text.length > MAX_TEXT_LENGTH) {
    sendJson(res, 400, { error: 'Texto vazio ou longo demais' })
    return
  }

  try {
    const response = await fetch(DEEPGRAM_URL, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Token ${apiKey}`,
      },
      body: JSON.stringify({ text }),
    })

    if (!response.ok) {
      sendJson(res, 502, { error: `Falha no serviço de voz (${response.status})` })
      return
    }

    const audio = Buffer.from(await response.arrayBuffer())
    res.statusCode = 200
    res.setHeader('Content-Type', response.headers.get('content-type') ?? 'audio/mpeg')
    res.setHeader('Cache-Control', 'no-store')
    res.end(audio)
  } catch {
    sendJson(res, 502, { error: 'Não foi possível gerar o áudio' })
  }
}
