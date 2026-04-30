import { NavLink, Outlet } from 'react-router-dom'

const adminLinks = [
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
          <h1>Write endpoints and internal review flows</h1>
          <p className="lead">
            Workspace này nối trực tiếp vào các endpoint admin đã có. Phần chưa có admin list endpoint
            được xử lý bằng fetch theo enterprise hoặc create-only flow.
          </p>
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
