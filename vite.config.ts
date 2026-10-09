import { readFileSync, writeFileSync } from 'node:fs'
import { join } from 'node:path'
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

/**
 * Versão do app: muda a cada deploy. O app compara a versão que está rodando
 * com /version.json para saber quando existe uma atualização, e o service
 * worker usa a versão no nome do cache (o navegador detecta o sw.js novo).
 */
function appVersion(version: string): Plugin {
  let outDir = 'dist'
  return {
    name: 'benkyou-app-version',
    apply: 'build',
    configResolved(config) {
      outDir = config.build.outDir
    },
    generateBundle() {
      this.emitFile({ type: 'asset', fileName: 'version.json', source: JSON.stringify({ version }) })
    },
    writeBundle() {
      const swPath = join(outDir, 'sw.js')
      const sw = readFileSync(swPath, 'utf8')
      writeFileSync(swPath, sw.replaceAll('__BUILD_VERSION__', version))
    },
  }
}

// https://vite.dev/config/
export default defineConfig(({ mode, command }) => {
  // Variáveis sem prefixo VITE_ ficam só no servidor (nunca vão para o navegador)
  const env = loadEnv(mode, process.cwd(), '')
  if (env.DEEPGRAM_API_KEY && !process.env.DEEPGRAM_API_KEY) {
    process.env.DEEPGRAM_API_KEY = env.DEEPGRAM_API_KEY
  }

  // Única por build: commit (quando na Vercel) + horário do build
  const version =
    command === 'serve'
      ? 'dev'
      : [env.VERCEL_GIT_COMMIT_SHA?.slice(0, 7), Date.now().toString(36)].filter(Boolean).join('-')

  return {
    plugins: [react(), devApi(), appVersion(version)],
    define: {
      // A chave pública do Web Push não é secreta, mas a Vercel bloqueia nomes
      // com VITE_ + KEY. Por isso ela é lida sem prefixo e embutida aqui.
      __VAPID_PUBLIC_KEY__: JSON.stringify(env.VAPID_PUBLIC_KEY ?? ''),
      __APP_VERSION__: JSON.stringify(version),
    },
  }
})
