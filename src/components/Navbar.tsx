import { NavLink, useNavigate, useLocation } from 'react-router-dom'
import { useState, useEffect } from 'react'
import { createPortal } from 'react-dom'
import { useAuth } from '../hooks/useAuth'
import { useUserProgress } from '../hooks/useUserProgress'

const navItems = [
  {
    to: '/',
    label: 'Início',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ width: 18, height: 18, flexShrink: 0 }}>
        <path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z" />
        <polyline points="9 22 9 12 15 12 15 22" />
      </svg>
    ),
  },
  {
    to: '/review',
    label: 'Revisão',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ width: 18, height: 18, flexShrink: 0 }}>
        <path d="M12 20h9" />
        <path d="M16.5 3.5a2.12 2.12 0 0 1 3 3L7 19l-4 1 1-4Z" />
      </svg>
    ),
  },
  {
    to: '/dashboard',
    label: 'Dashboard',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ width: 18, height: 18, flexShrink: 0 }}>
        <rect width="7" height="9" x="3" y="3" rx="1" />
        <rect width="7" height="5" x="14" y="3" rx="1" />
        <rect width="7" height="9" x="14" y="12" rx="1" />
        <rect width="7" height="5" x="3" y="16" rx="1" />
      </svg>
    ),
  },
  {
    to: '/about',
    label: 'Sobre',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ width: 18, height: 18, flexShrink: 0 }}>
        <circle cx="12" cy="12" r="10" />
        <path d="M12 16v-4" />
        <path d="M12 8h.01" />
      </svg>
    ),
  },
  {
    to: '/options',
    label: 'Opções',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ width: 18, height: 18, flexShrink: 0 }}>
        <path d="M12.22 2h-.44a2 2 0 0 0-2 2v.18a2 2 0 0 1-1 1.73l-.43.25a2 2 0 0 1-2 0l-.15-.08a2 2 0 0 0-2.73.73l-.22.38a2 2 0 0 0 .73 2.73l.15.1a2 2 0 0 1 1 1.72v.51a2 2 0 0 1-1 1.74l-.15.09a2 2 0 0 0-.73 2.73l.22.38a2 2 0 0 0 2.73.73l.15-.08a2 2 0 0 1 2 0l.43.25a2 2 0 0 1 1 1.73V20a2 2 0 0 0 2 2h.44a2 2 0 0 0 2-2v-.18a2 2 0 0 1 1-1.73l.43-.25a2 2 0 0 1 2 0l.15.08a2 2 0 0 0 2.73-.73l.22-.39a2 2 0 0 0-.73-2.73l-.15-.08a2 2 0 0 1-1-1.74v-.5a2 2 0 0 1 1-1.74l.15-.09a2 2 0 0 0 .73-2.73l-.22-.38a2 2 0 0 0-2.73-.73l-.15.08a2 2 0 0 1-2 0l-.43-.25a2 2 0 0 1-1-1.73V4a2 2 0 0 0-2-2z" />
        <circle cx="12" cy="12" r="3" />
      </svg>
    ),
  },
]

// Items shown in the bottom bar (primary 4)
const bottomNavItems = [
  {
    to: '/',
    label: 'Início',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
        <path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z" />
        <polyline points="9 22 9 12 15 12 15 22" />
      </svg>
    ),
  },
  {
    to: '/review',
    label: 'Revisão',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
        <path d="M12 20h9" />
        <path d="M16.5 3.5a2.12 2.12 0 0 1 3 3L7 19l-4 1 1-4Z" />
      </svg>
    ),
  },
  {
    to: '/dashboard',
    label: 'Dashboard',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
        <rect width="7" height="9" x="3" y="3" rx="1" />
        <rect width="7" height="5" x="14" y="3" rx="1" />
        <rect width="7" height="9" x="14" y="12" rx="1" />
        <rect width="7" height="5" x="3" y="16" rx="1" />
      </svg>
    ),
  },
  {
    to: '/options',
    label: 'Opções',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
        <path d="M12.22 2h-.44a2 2 0 0 0-2 2v.18a2 2 0 0 1-1 1.73l-.43.25a2 2 0 0 1-2 0l-.15-.08a2 2 0 0 0-2.73.73l-.22.38a2 2 0 0 0 .73 2.73l.15.1a2 2 0 0 1 1 1.72v.51a2 2 0 0 1-1 1.74l-.15.09a2 2 0 0 0-.73 2.73l.22.38a2 2 0 0 0 2.73.73l.15-.08a2 2 0 0 1 2 0l.43.25a2 2 0 0 1 1 1.73V20a2 2 0 0 0 2 2h.44a2 2 0 0 0 2-2v-.18a2 2 0 0 1 1-1.73l.43-.25a2 2 0 0 1 2 0l.15.08a2 2 0 0 0 2.73-.73l.22-.39a2 2 0 0 0-.73-2.73l-.15-.08a2 2 0 0 1-1-1.74v-.5a2 2 0 0 1 1-1.74l.15-.09a2 2 0 0 0 .73-2.73l-.22-.38a2 2 0 0 0-2.73-.73l-.15.08a2 2 0 0 1-2 0l-.43-.25a2 2 0 0 1-1-1.73V4a2 2 0 0 0-2-2z" />
        <circle cx="12" cy="12" r="3" />
      </svg>
    ),
  },
]

export function Navbar() {
  const navigate = useNavigate()
  const location = useLocation()
  const { user, signOut, loading } = useAuth()
  const [isDrawerOpen, setIsDrawerOpen] = useState(false)
  const { profile } = useUserProgress()

  const handleLogout = async () => {
    try {
      await signOut()
      navigate('/login')
    } catch (error) {
      console.error('Error logging out:', error)
    }
  }

  const toggleDrawer = () => setIsDrawerOpen(prev => !prev)
  const closeDrawer = () => setIsDrawerOpen(false)

  // Close drawer on route change
  useEffect(() => { closeDrawer() }, [location.pathname])

  // Lock body scroll when drawer is open
  useEffect(() => {
    document.body.style.overflow = isDrawerOpen ? 'hidden' : ''
    return () => { document.body.style.overflow = '' }
  }, [isDrawerOpen])

  // Determine if any "More" item is active
  const moreItems = [navItems[3]] // "Sobre" goes in more
  const isMoreActive = moreItems.some(item => location.pathname === item.to)

  return (
    <>
      {/* ── Desktop Navbar ── */}
      <nav className="navbar">
        <div className="navbar__container">
          <NavLink to="/" className="navbar__brand">
            <img src="/Icon.png" alt="logo" className="navbar__logo" />
            <span className="navbar__title">「Benkyou」勉今日！</span>
          </NavLink>

          <div className="navbar__desktop">
            <div className="navbar__links">
              {navItems.map((item) => (
                <NavLink
                  key={item.to}
                  to={item.to}
                  className={({ isActive }) =>
                    `navbar__link ${isActive ? 'navbar__link--active' : ''}`
                  }
                  data-tour={`nav-${item.to === '/' ? 'home' : item.to.replace('/', '')}`}
                >
                  {item.label}
                </NavLink>
              ))}
            </div>

            <div className="navbar__actions">
              {user && (
                <span
                  className="navbar__streak"
                  data-tour="nav-streak"
                  title={`Sequência atual: ${profile.currentStreak} dias`}
                >
                  <img
                    src="/Streak.png"
                    alt="Streak"
                    className="navbar__streak-icon"
                    width={18}
                    height={18}
                  />
                  <span className="navbar__streak-count">{profile.currentStreak}</span>
                </span>
              )}
              {user && (
                <button
                  className="navbar__logout-button"
                  onClick={handleLogout}
                  disabled={loading}
                  title={`Logado como: ${user.email}`}
                >
                  Sair
                </button>
              )}
            </div>
          </div>
        </div>
      </nav>

      {/* ── Mobile Bottom Nav ── */}
      {createPortal(
        <>
          <nav className="bottom-nav" aria-label="Navegação principal">
            <div className="bottom-nav__items">
              {bottomNavItems.map((item) => {
                const isActive = item.to === '/'
                  ? location.pathname === '/'
                  : location.pathname.startsWith(item.to)
                return (
                  <NavLink
                    key={item.to}
                    to={item.to}
                    className={`bottom-nav__item ${isActive ? 'bottom-nav__item--active' : ''}`}
                    aria-label={item.label}
                  >
                    <span className="bottom-nav__icon">{item.icon}</span>
                    <span className="bottom-nav__label">{item.label}</span>
                  </NavLink>
                )
              })}

              {/* "More" button — opens drawer with remaining items */}
              <button
                className={`bottom-nav__more ${isMoreActive || isDrawerOpen ? 'bottom-nav__more--active' : ''}`}
                onClick={toggleDrawer}
                aria-label="Mais opções"
                aria-expanded={isDrawerOpen}
              >
                <span className="bottom-nav__icon">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                    <circle cx="12" cy="12" r="1" />
                    <circle cx="19" cy="12" r="1" />
                    <circle cx="5" cy="12" r="1" />
                  </svg>
                </span>
                <span className="bottom-nav__label">Mais</span>
              </button>
            </div>
          </nav>

          {/* Drawer overlay */}
          <div
            className={`mobile-drawer__overlay ${isDrawerOpen ? 'mobile-drawer__overlay--open' : ''}`}
            onClick={closeDrawer}
            aria-hidden="true"
          />

          {/* Drawer panel */}
          <div
            className={`mobile-drawer ${isDrawerOpen ? 'mobile-drawer--open' : ''}`}
            role="dialog"
            aria-label="Menu de navegação"
          >
            <div className="mobile-drawer__handle" />

            <div className="mobile-drawer__title">Navegação</div>

            <div className="mobile-drawer__links">
              {navItems.map((item) => (
                <NavLink
                  key={item.to}
                  to={item.to}
                  className={({ isActive }) =>
                    `mobile-drawer__link ${isActive ? 'mobile-drawer__link--active' : ''}`
                  }
                  onClick={closeDrawer}
                >
                  {item.icon}
                  {item.label}
                </NavLink>
              ))}
            </div>

            {user && (
              <>
                <div className="mobile-drawer__divider" />
                <div className="mobile-drawer__footer">
                  <div
                    className="mobile-drawer__streak"
                    title={`Sequência atual: ${profile.currentStreak} dias`}
                  >
                    <img src="/Streak.png" alt="Streak" width={20} height={20} />
                    <span className="mobile-drawer__streak-label">Ofensiva atual</span>
                    <span className="mobile-drawer__streak-value">{profile.currentStreak} dias</span>
                  </div>

                  <button
                    className="mobile-drawer__logout"
                    onClick={() => { handleLogout(); closeDrawer() }}
                    disabled={loading}
                  >
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ width: 18, height: 18 }}>
                      <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4" />
                      <polyline points="16 17 21 12 16 7" />
                      <line x1="21" y1="12" x2="9" y2="12" />
                    </svg>
                    Sair da conta
                  </button>
                </div>
              </>
            )}
          </div>
        </>,
        document.body
      )}
    </>
  )
}
