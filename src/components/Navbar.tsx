import { NavLink, useNavigate } from 'react-router-dom'
import { useState, useEffect } from 'react'
import { createPortal } from 'react-dom'
import { useAuth } from '../hooks/useAuth'
import { useUserProgress } from '../hooks/useUserProgress'

const navItems = [
  { to: '/', label: 'Início' },
  { to: '/review', label: 'Revisão' },
  { to: '/dashboard', label: 'Dashboard' },
  { to: '/about', label: 'Sobre' },
  { to: '/options', label: 'Opções' },
]

export function Navbar() {
  const navigate = useNavigate()
  const { user, signOut, loading } = useAuth()
  const [isMenuOpen, setIsMenuOpen] = useState(false)

  const handleLogout = async () => {
    try {
      await signOut()
      navigate('/login')
    } catch (error) {
      console.error('Error logging out:', error)
    }
  }

  const { profile } = useUserProgress()

  const toggleMenu = () => {
    setIsMenuOpen(prev => !prev)
  }

  const closeMenu = () => {
    setIsMenuOpen(false)
  }

  // Lock body scroll while mobile menu is open
  useEffect(() => {
    document.body.style.overflow = isMenuOpen ? 'hidden' : ''
    return () => { document.body.style.overflow = '' }
  }, [isMenuOpen])

  return (
    <>
      <nav className="navbar">
        <div className="navbar__container">
          <div className="navbar__brand">
            <img src="/Icon.png" alt="logo" className="navbar__logo" />
            <span className="navbar__title">「Benkyou」勉今日！</span>
          </div>

          {/* Desktop Navigation */}
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
                <span className="navbar__streak" data-tour="nav-streak" title={`Sequência atual: ${profile.currentStreak} dias`}>
                  <img
                    src="/Streak.png"
                    alt="Streak"
                    className="navbar__streak-icon"
                    width={20}
                    height={20}
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

          {/* Mobile Hamburger Button */}
          <button
            className={`navbar__menu-toggle ${isMenuOpen ? 'navbar__menu-toggle--open' : ''}`}
            onClick={toggleMenu}
            aria-label="Toggle menu"
          >
            <img
              src={isMenuOpen ? '/cruz.svg' : '/menu.svg'}
              alt={isMenuOpen ? 'Fechar menu' : 'Abrir menu'}
              className="navbar__toggle-icon"
              width={22}
              height={22}
            />
          </button>
        </div>
      </nav>

      {/*
        Portal: renders the mobile menu directly on document.body.
        This completely escapes the `backdrop-filter` containing block on .navbar,
        which was preventing `position: fixed; inset: 0` from covering the full viewport.
      */}
      {createPortal(
        <div className={`navbar__mobile-menu ${isMenuOpen ? 'navbar__mobile-menu--open' : ''}`}>
          <div className="navbar__mobile-links">
            {navItems.map((item) => (
              <NavLink
                key={item.to}
                to={item.to}
                className={({ isActive }) =>
                  `navbar__mobile-link ${isActive ? 'navbar__mobile-link--active' : ''}`
                }
                onClick={closeMenu}
              >
                {item.label}
              </NavLink>
            ))}
          </div>

          <div className="navbar__mobile-actions">
            {user && (
              <div className="navbar__mobile-streak" title={`Sequência atual: ${profile.currentStreak} dias`}>
                <img
                  src="/Streak.png"
                  alt="Streak"
                  className="navbar__streak-icon"
                  width={20}
                  height={20}
                />
                <span>Sequência: {profile.currentStreak} dias</span>
              </div>
            )}
            {user && (
              <button
                className="navbar__mobile-logout"
                onClick={() => {
                  handleLogout()
                  closeMenu()
                }}
                disabled={loading}
              >
                Sair
              </button>
            )}
          </div>
        </div>,
        document.body
      )}
    </>
  )
}
