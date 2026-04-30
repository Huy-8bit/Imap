import { Outlet, ScrollRestoration } from 'react-router-dom'

import { Footer } from '../../components/layout/Footer'
import { NavBar } from '../../components/layout/NavBar'

export function AppLayout() {
  return (
    <>
      <ScrollRestoration />
      <div className="site-shell">
        <NavBar />
        <main className="site-main">
          <Outlet />
        </main>
        <Footer />
      </div>
    </>
  )
}
