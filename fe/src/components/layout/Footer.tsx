import { Link } from 'react-router-dom'

export function Footer() {
  return (
    <footer className="site-footer">
      <div>
        <p className="footer-brand">iMapVietnam</p>
        <p className="footer-copy">Dữ liệu thực, xác thực khoa học, kết nối nguồn lực.</p>
      </div>
      <div className="footer-links">
        <Link to="/impactonomy">Impactonomy</Link>
        <Link to="/reports">Reports</Link>
        <Link to="/about">About IID</Link>
      </div>
    </footer>
  )
}
