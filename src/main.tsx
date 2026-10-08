import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.tsx'
import { applyStoredPreferences } from './hooks/usePreferences'
import { setupPwa } from './hooks/usePwa'

applyStoredPreferences()
setupPwa()

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <App />
  </StrictMode>,
)
