import path from 'path'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  build: {
    chunkSizeWarningLimit: 1000,
    rollupOptions: {
      output: {
        manualChunks(id) {
          if (!id.includes('node_modules')) return

          const parts = id.split('node_modules' + path.sep)
          const packagePath = parts[1] || ''
          const packageName = packagePath.split(path.sep)[0]

          if (['react', 'react-dom', 'react-router-dom'].includes(packageName)) {
            return 'vendor-react'
          }
          if (packageName.startsWith('@supabase')) {
            return 'vendor-supabase'
          }
          if (['lucide-react', 'recharts', 'react-joyride'].includes(packageName)) {
            return 'vendor-ui'
          }
          return 'vendor'
        },
      },
    },
  },
})
