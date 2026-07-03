import { NavLink, Outlet } from 'react-router-dom'

const adminLinks = [
  { to: '/admin/queue', label: 'Queue' },
  { to: '/admin/score', label: 'Score & Cert' },
  { to: '/admin/news', label: 'News' },
  { to: '/admin/reports', label: 'Reports' },
  { to: '/admin/certifications', label: 'Certifications' },
  { to: '/admin/custom-requests', label: 'Custom Requests' },
  { to: '/admin/about', label: 'About IID' },
]

export function AdminLayout() {
  return (
    <div className="page-stack page-stack-tight">
      <section className="admin-hero">
        <div>
          <p className="eyebrow">Admin workspace</p>
          <h1>Write endpoints và internal review flows</h1>
        </div>
      </section>

      <section className="admin-nav">
        {adminLinks.map((item) => (
          <NavLink
            key={item.to}
            to={item.to}
            className={({ isActive }) => (isActive ? 'admin-tab is-active' : 'admin-tab')}
          >
            {item.label}
          </NavLink>
        ))}
      </section>

      <Outlet />
    </div>
  )
}
