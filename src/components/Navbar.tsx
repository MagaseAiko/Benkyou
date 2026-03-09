import { NavLink } from 'react-router-dom'

const navItems = [
  { to: '/', label: 'Início' },
  { to: '/review', label: 'Revisão' },
  { to: '/dashboard', label: 'Dashboard' },
]

export function Navbar() {
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
      </div>
    </nav>
  )
}
