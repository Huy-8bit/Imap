import { useQuery } from '@tanstack/react-query'
import { Link } from 'react-router-dom'

import { getNews, getIidAbout } from '../features/content/api'
import { getDashboardByProvince, getStatsOverview } from '../features/dashboard/api'
import { getFeaturedEnterprises } from '../features/enterprises/api'
import { Badge } from '../components/ui/Badge'
import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { EmptyState, ErrorState, LoadingState } from '../components/ui/States'
import { StatCard } from '../components/ui/Stat'
import { formatDate, formatNumber } from '../lib/utils/format'

const platformCards = [
  {
    title: 'Impact Map',
    href: '/map',
    description: 'GeoJSON enterprises, taxonomy filters, quick profile panel, and clear empty states when geometry is absent.',
  },
  {
    title: 'Dashboard',
    href: '/dashboard',
    description: 'National breakdowns by province, sector, organization type, growth, and impact flows using backend aggregates.',
  },
  {
    title: 'Impactonomy Mark',
    href: '/impactonomy',
    description: 'Methodology, assessment access, and directory/apply workflow grounded in the current certification endpoints.',
  },
  {
    title: 'Reports & Analysis',
    href: '/reports',
    description: 'Report store, public previews, premium-aware download flow, and custom analysis requests.',
  },
]

export function HomePage() {
  const overviewQuery = useQuery({
    queryKey: ['stats', 'overview', 'home'],
    queryFn: () => getStatsOverview(),
  })
  const featuredQuery = useQuery({
    queryKey: ['enterprises', 'featured'],
    queryFn: () => getFeaturedEnterprises(4),
  })
  const newsQuery = useQuery({
    queryKey: ['news', 'home'],
    queryFn: () => getNews({ page: 1, page_size: 4 }),
  })
  const provinceQuery = useQuery({
    queryKey: ['dashboard', 'province', 'home'],
    queryFn: () => getDashboardByProvince(),
  })
  const aboutQuery = useQuery({
    queryKey: ['iid', 'about', 'home'],
    queryFn: getIidAbout,
  })

  return (
    <div className="page-stack">
      <section className="hero-panel">
        <div className="hero-copy">
          <p className="eyebrow">Impact Economy Digital Hub</p>
          <h1>
            Từ hiện diện
            <br />
            đến uy tín.
          </h1>
          <p className="lead">
            Nền tảng frontend này bám theo backend đã có: enterprise catalog, dashboard aggregates, impactonomy
            workflow, reports, news, và IID CMS.
          </p>
          <div className="hero-actions">
            <Link to="/map">
              <Button>Khám phá bản đồ</Button>
            </Link>
            <Link to="/impactonomy">
              <Button variant="ghost">Xem Impactonomy Mark</Button>
            </Link>
          </div>
        </div>

        <div className="hero-stats">
          {overviewQuery.isLoading ? (
            <LoadingState label="Đang tải impact at a glance..." />
          ) : overviewQuery.isError ? (
            <ErrorState description="Không lấy được overview từ backend." onRetry={() => void overviewQuery.refetch()} />
          ) : overviewQuery.data ? (
            <div className="stats-grid">
              <StatCard label="Tổng hồ sơ tổ chức" value={overviewQuery.data.data.total_organizations} />
              <StatCard label="Đang hoạt động" value={overviewQuery.data.data.active_organizations} accent="green" />
              <StatCard label="Phủ tỉnh thành" value={overviewQuery.data.data.provinces_count} />
              <StatCard label="Sẵn sàng lên bản đồ" value={overviewQuery.data.data.mappable_organizations} accent="gold" />
            </div>
          ) : null}
        </div>
      </section>

      <section>
        <div className="section-header">
          <div>
            <p className="eyebrow">Impact at a glance</p>
            <h2>Dữ liệu tổng quan đang phản ánh đúng những gì backend có.</h2>
            <p className="section-description">
              Không có featured fallback giả, không có map point giả, và không bịa pillar analytics khi score chưa hoàn chỉnh.
            </p>
          </div>
        </div>
        {provinceQuery.data ? (
          <div className="metric-strip">
            {provinceQuery.data.data.slice(0, 3).map((bucket) => (
              <div key={bucket.province_code} className="metric-row">
                <span>{bucket.province_name}</span>
                <strong>{formatNumber(bucket.organization_count)}</strong>
              </div>
            ))}
          </div>
        ) : null}
      </section>

      <section>
        <div className="section-header">
          <div>
            <p className="eyebrow">Featured enterprises</p>
            <h2>Chỉ dùng curated data từ backend.</h2>
          </div>
          <Link to="/map" className="inline-link">
            Mở directory
          </Link>
        </div>
        {featuredQuery.isLoading ? (
          <LoadingState label="Đang tải featured enterprises..." />
        ) : featuredQuery.isError ? (
          <ErrorState description="Không tải được featured enterprises." onRetry={() => void featuredQuery.refetch()} />
        ) : featuredQuery.data?.data.length ? (
          <div className="card-grid">
            {featuredQuery.data.data.map((enterprise) => (
              <Card key={enterprise.id}>
                <div className="stack-sm">
                  <div className="stack-inline">
                    {enterprise.organization_type ? <Badge tone="green">{enterprise.organization_type.display_name}</Badge> : null}
                    {enterprise.primary_industry_sector ? (
                      <Badge tone="blue">{enterprise.primary_industry_sector.display_name}</Badge>
                    ) : null}
                  </div>
                  <h3>{enterprise.display_name}</h3>
                  <p className="muted">
                    {enterprise.province?.display_name || 'Địa bàn đang cập nhật'}
                    {enterprise.star_rating ? ` · ${enterprise.star_rating} sao` : ''}
                  </p>
                  <div className="card-actions">
                    <Link to={`/enterprises/${enterprise.id}`} className="inline-link">
                      Hồ sơ chi tiết
                    </Link>
                    {enterprise.website ? (
                      <a href={enterprise.website} target="_blank" rel="noreferrer" className="inline-link">
                        Website
                      </a>
                    ) : null}
                  </div>
                </div>
              </Card>
            ))}
          </div>
        ) : (
          <EmptyState
            title="Chưa có featured enterprises"
            description="Endpoint curated hiện trả rỗng, nên homepage không âm thầm fallback sang dữ liệu khác."
          />
        )}
      </section>

      <section>
        <div className="section-header">
          <div>
            <p className="eyebrow">News & Trends</p>
            <h2>Cập nhật nội dung công khai từ CMS.</h2>
          </div>
        </div>
        {newsQuery.isLoading ? (
          <LoadingState label="Đang tải news..." />
        ) : newsQuery.isError ? (
          <ErrorState description="Không tải được news." onRetry={() => void newsQuery.refetch()} />
        ) : newsQuery.data?.data.length ? (
          <div className="card-grid">
            {newsQuery.data.data.map((article) => (
              <Card key={article.id}>
                <div className="stack-sm">
                  <div className="stack-inline">
                    {article.tags.map((tag) => (
                      <Badge key={tag}>{tag}</Badge>
                    ))}
                  </div>
                  <h3>{article.title}</h3>
                  <p className="muted">{article.summary || 'Bài viết chưa có executive summary.'}</p>
                  <p className="small-note">Cập nhật {formatDate(article.updated_at)}</p>
                </div>
              </Card>
            ))}
          </div>
        ) : (
          <EmptyState title="Chưa có bài viết mới" description="CMS news hiện chưa có thêm bài công khai ngoài seed hiện tại." />
        )}
      </section>

      <section>
        <div className="section-header">
          <div>
            <p className="eyebrow">Modules</p>
            <h2>Bốn khối chính của sprint frontend.</h2>
          </div>
        </div>
        <div className="feature-grid">
          {platformCards.map((item) => (
            <Card key={item.href} className="feature-card">
              <div className="stack-sm">
                <h3>{item.title}</h3>
                <p className="muted">{item.description}</p>
                <Link to={item.href} className="inline-link">
                  Mở module
                </Link>
              </div>
            </Card>
          ))}
        </div>
      </section>

      <section className="cta-panel">
        <div className="stack-md">
          <p className="eyebrow">About IID</p>
          <h2>{aboutQuery.data?.data.title || 'Institute for Innovation and Development'}</h2>
          <p className="lead">
            {aboutQuery.data?.data.summary || 'Frontend giữ landing, content, và navigation đồng bộ với IID CMS hiện tại.'}
          </p>
          <div className="hero-actions">
            <Link to="/about">
              <Button>Về IID</Button>
            </Link>
            <Link to="/register">
              <Button variant="secondary">Đăng ký doanh nghiệp</Button>
            </Link>
          </div>
        </div>
      </section>
    </div>
  )
}
