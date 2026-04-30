import { NavLink } from 'react-router-dom'

import { useAuth } from '../../lib/auth/auth'
import { Button } from '../ui/Button'

const links = [
  { to: '/', label: 'Tổng quan' },
  { to: '/map', label: 'Map' },
  { to: '/dashboard', label: 'Dashboard' },
  { to: '/impactonomy', label: 'Impactonomy' },
  { to: '/reports', label: 'Reports' },
  { to: '/about', label: 'About IID' },
]

export function NavBar() {
  const { user, logout, isAdmin } = useAuth()

  return (
    <header className="site-header">
      <div className="brand-lockup">
        <NavLink to="/" className="brand-mark">
          i<span>Map</span>Vietnam
        </NavLink>
        <p className="brand-subtitle">Impact Economy Digital Hub</p>
      </div>

      <nav className="site-nav">
        {links.map((link) => (
          <NavLink
            key={link.to}
            to={link.to}
            className={({ isActive }) => (isActive ? 'site-nav-link is-active' : 'site-nav-link')}
          >
            {link.label}
          </NavLink>
        ))}
      </nav>

      <div className="site-actions">
        {user ? (
          <>
            {isAdmin ? (
              <NavLink to="/admin/news" className="site-nav-link">
                Admin
              </NavLink>
            ) : null}
            <NavLink to="/assessment" className="site-nav-link">
              Assessment
            </NavLink>
            <span className="user-chip">{user.full_name || user.email}</span>
            <Button variant="ghost" size="sm" onClick={() => void logout()}>
              Logout
            </Button>
          </>
        ) : (
          <>
            <NavLink to="/login" className="site-nav-link">
              Login
            </NavLink>
            <NavLink to="/register">
              <Button size="sm">Register</Button>
            </NavLink>
          </>
        )}
      </div>
    </header>
  )
}
