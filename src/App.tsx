import { BrowserRouter, Routes, Route } from 'react-router-dom'
import { Navbar } from './components/Navbar'
import { ProtectedRoute } from './components/ProtectedRoute'
import { LoginPage } from './pages/LoginPage'
import { HomePage } from './pages/HomePage'
import { LevelPage } from './pages/LevelPage'
import { StudyItemPage } from './pages/StudyItemPage'
import { ReviewPage } from './pages/ReviewPage'
import { DashboardPage } from './pages/DashboardPage'
import { OptionsPage } from './pages/OptionsPage'
import { NotFoundPage } from './pages/NotFoundPage'
import { AuthCallbackPage } from './pages/AuthCallbackPage'
import './App.css'

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/login" element={<LoginPage />} />
        <Route path="/auth/callback" element={<AuthCallbackPage />} />
        <Route
          path="/*"
          element={
            <ProtectedRoute>
              <div className="app">
                <Navbar />
                <main className="app__main">
                  <Routes>
                    <Route path="/" element={<HomePage />} />
                    <Route path="/level/:level" element={<LevelPage />} />
                    <Route path="/level/:level/:type/:id" element={<StudyItemPage />} />
                    <Route path="/review" element={<ReviewPage />} />
                    <Route path="/dashboard" element={<DashboardPage />} />
                    <Route path="/options" element={<OptionsPage />} />
                    <Route path="*" element={<NotFoundPage />} />
                  </Routes>
                </main>
              </div>
            </ProtectedRoute>
          }
        />
      </Routes>
    </BrowserRouter>
  )
}
