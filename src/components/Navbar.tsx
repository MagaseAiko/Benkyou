import { NavLink, useNavigate, useLocation } from 'react-router-dom'
import { useState, useEffect } from 'react'
import { createPortal } from 'react-dom'
import { House, PenLine, LayoutGrid, Info, Settings, Ellipsis, LogOut } from 'lucide-react'
import { useAuth } from '../hooks/useAuth'
import { useUserProgress } from '../hooks/useUserProgress'
import { Logo, StreakFlame } from './Logo'

const navItems = [
  { to: '/', label: 'Início', icon: <House strokeWidth={1.8} /> },
  { to: '/review', label: 'Revisão', icon: <PenLine strokeWidth={1.8} /> },
  { to: '/dashboard', label: 'Dashboard', icon: <LayoutGrid strokeWidth={1.8} /> },
  { to: '/about', label: 'Sobre', icon: <Info strokeWidth={1.8} /> },
  { to: '/options', label: 'Opções', icon: <Settings strokeWidth={1.8} /> },
]

// Items shown in the bottom bar (primary 4)
const bottomNavItems = navItems.filter((item) => item.to !== '/about')

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
      {/* ── Top bar ── */}
      <nav className="navbar">
        <div className="navbar__container">
          <NavLink to="/" className="navbar__brand" aria-label="Benkyou — início">
            <Logo size={36} />
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
          </div>

          <div className="navbar__actions">
            {user && (
              <span
                className="navbar__streak"
                data-tour="nav-streak"
                title={`Sequência atual: ${profile.currentStreak} dias`}
              >
                <StreakFlame size={18} />
                <span className="navbar__streak-count">{profile.currentStreak}</span>
                <span className="navbar__streak-unit">{profile.currentStreak === 1 ? 'dia' : 'dias'}</span>
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
                  <Ellipsis strokeWidth={1.8} />
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

            <div className="mobile-drawer__title">navegação</div>

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
                    <StreakFlame size={22} />
                    <span className="mobile-drawer__streak-label">Ofensiva atual</span>
                    <span className="mobile-drawer__streak-value">{profile.currentStreak} dias</span>
                  </div>

                  <button
                    className="mobile-drawer__logout"
                    onClick={() => { handleLogout(); closeDrawer() }}
                    disabled={loading}
                  >
                    <LogOut size={18} strokeWidth={1.8} />
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
