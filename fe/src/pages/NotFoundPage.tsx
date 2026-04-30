import { Link } from 'react-router-dom'

import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'

export function NotFoundPage() {
  return (
    <div className="auth-page">
      <Card className="auth-card">
        <div className="stack-md">
          <p className="eyebrow">404</p>
          <h1>Trang không tồn tại</h1>
          <p className="lead">Route này hiện chưa có trong sitemap FE của sprint hoặc đường dẫn đã sai.</p>
          <Link to="/">
            <Button>Về homepage</Button>
          </Link>
        </div>
      </Card>
    </div>
  )
}
