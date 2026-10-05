import { defineConfig, loadEnv } from 'vite'
import type { Plugin } from 'vite'
import react from '@vitejs/plugin-react'
import ttsHandler from './api/tts.ts'

// Em desenvolvimento, serve /api/tts pelo próprio Vite (em produção é uma Vercel Function).
function devApi(): Plugin {
  return {
    name: 'benkyou-dev-api',
    configureServer(server) {
      server.middlewares.use('/api/tts', (req, res) => {
        void ttsHandler(req, res)
      })
    },
  }
}

// https://vite.dev/config/
export default defineConfig(({ mode }) => {
  // Variáveis sem prefixo VITE_ ficam só no servidor (nunca vão para o navegador)
  const env = loadEnv(mode, process.cwd(), '')
  if (env.DEEPGRAM_API_KEY && !process.env.DEEPGRAM_API_KEY) {
    process.env.DEEPGRAM_API_KEY = env.DEEPGRAM_API_KEY
  }

  return {
    plugins: [react(), devApi()],
  }
})
