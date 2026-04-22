import { NavLink, useNavigate } from 'react-router-dom'
import { useAuth } from '../hooks/useAuth'

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

  const handleLogout = async () => {
    try {
      await signOut()
      navigate('/login')
    } catch (error) {
      console.error('Error logging out:', error)
    }
  }

  return (
    <nav className="navbar">
      <div className="navbar__brand">
        <img src="/Icon.png" alt="logo" className="navbar__logo"/>
        「Benkyou」勉今日！
      </div>
      <div className="navbar__links">
        {navItems.map((item) => (
          <NavLink
            key={item.to}
            to={item.to}
            className={({ isActive }) =>
              `navbar__link ${isActive ? 'navbar__link--active' : ''}`
            }
          >
            {item.label}
          </NavLink>
        ))}
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
    </nav>
  )
}
