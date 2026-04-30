import type { ReactNode } from 'react'
import { useState } from 'react'
import { useQuery } from '@tanstack/react-query'
import {
  Bar,
  BarChart,
  CartesianGrid,
  Cell,
  Line,
  LineChart,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from 'recharts'

import { Card } from '../components/ui/Card'
import { Field, Select } from '../components/ui/Field'
import { EmptyState, ErrorState, LoadingState } from '../components/ui/States'
import { StatCard } from '../components/ui/Stat'
import {
  getDashboardByOrganizationType,
  getDashboardByProvince,
  getDashboardBySector,
  getDashboardGrowth,
  getDashboardImpactFlows,
  getStatsOverview,
} from '../features/dashboard/api'
import { getTaxonomies } from '../features/taxonomies/api'
import type { EnterpriseFilterParams } from '../lib/api/types'
import { formatNumber } from '../lib/utils/format'

const chartPalette = ['#0d8d67', '#c89f3d', '#3354a4', '#8ba69a', '#d7c695']

export function DashboardPage() {
  const [filters, setFilters] = useState<EnterpriseFilterParams>({})

  const taxonomiesQuery = useQuery({
    queryKey: ['taxonomies', 'dashboard'],
    queryFn: getTaxonomies,
  })
  const overviewQuery = useQuery({
    queryKey: ['stats', 'overview', filters],
    queryFn: () => getStatsOverview(filters),
  })
  const provinceQuery = useQuery({
    queryKey: ['dashboard', 'province', filters],
    queryFn: () => getDashboardByProvince(filters),
  })
  const sectorQuery = useQuery({
    queryKey: ['dashboard', 'sector', filters],
    queryFn: () => getDashboardBySector(filters),
  })
  const typeQuery = useQuery({
    queryKey: ['dashboard', 'type', filters],
    queryFn: () => getDashboardByOrganizationType(filters),
  })
  const growthQuery = useQuery({
    queryKey: ['dashboard', 'growth', filters],
    queryFn: () => getDashboardGrowth(filters),
  })
  const flowsQuery = useQuery({
    queryKey: ['dashboard', 'flows', filters],
    queryFn: () => getDashboardImpactFlows({ ...filters, limit: 30 }),
  })

  const taxonomies = taxonomiesQuery.data?.data.taxonomies

  return (
    <div className="page-stack">
      <section className="page-intro">
        <div>
          <p className="eyebrow">Impact dashboard</p>
          <h1>Aggregate analytics bám theo endpoint thật.</h1>
          <p className="lead">
            Province, sector, organization type, growth, và impact flows đều đi trực tiếp qua backend aggregates và cache semantics hiện có.
          </p>
        </div>
        <Card className="filter-card filter-card-inline">
          <Field label="Province">
            <Select
              value={filters.province || ''}
              onChange={(event) => setFilters((current) => ({ ...current, province: event.target.value || undefined }))}
            >
              <option value="">Tất cả</option>
              {taxonomies?.provinces?.map((item) => (
                <option key={item.code} value={item.code}>
                  {item.display_name}
                </option>
              ))}
            </Select>
          </Field>
          <Field label="Organization type">
            <Select
              value={filters.organizationType || ''}
              onChange={(event) =>
                setFilters((current) => ({ ...current, organizationType: event.target.value || undefined }))
              }
            >
              <option value="">Tất cả</option>
              {taxonomies?.organization_types?.map((item) => (
                <option key={item.code} value={item.code}>
                  {item.display_name}
                </option>
              ))}
            </Select>
          </Field>
          <Field label="Sector">
            <Select
              value={filters.primaryIndustrySector || ''}
              onChange={(event) =>
                setFilters((current) => ({
                  ...current,
                  primaryIndustrySector: event.target.value || undefined,
                }))
              }
            >
              <option value="">Tất cả</option>
              {taxonomies?.industry_sectors?.map((item) => (
                <option key={item.code} value={item.code}>
                  {item.display_name}
                </option>
              ))}
            </Select>
          </Field>
        </Card>
      </section>

      {overviewQuery.isLoading ? (
        <LoadingState />
      ) : overviewQuery.isError ? (
        <ErrorState description="Không tải được overview." onRetry={() => void overviewQuery.refetch()} />
      ) : overviewQuery.data ? (
        <div className="stats-grid">
          <StatCard label="Tổng hồ sơ" value={overviewQuery.data.data.total_organizations} />
          <StatCard label="Đang hoạt động" value={overviewQuery.data.data.active_organizations} accent="green" />
          <StatCard label="Tác động xã hội" value={overviewQuery.data.data.social_impact_organizations} />
          <StatCard label="Tác động môi trường" value={overviewQuery.data.data.environmental_impact_organizations} accent="gold" />
        </div>
      ) : null}

      <div className="dashboard-grid">
        <ChartCard title="Growth chart" query={growthQuery}>
          <ResponsiveContainer width="100%" height={280}>
            <LineChart data={growthQuery.data?.data || []}>
              <CartesianGrid strokeDasharray="3 3" stroke="#d8d6c8" />
              <XAxis dataKey="founded_year" tick={{ fill: '#46504d' }} />
              <YAxis tick={{ fill: '#46504d' }} />
              <Tooltip />
              <Line type="monotone" dataKey="total_count" stroke="#0d8d67" strokeWidth={3} />
              <Line type="monotone" dataKey="active_count" stroke="#c89f3d" strokeWidth={2} />
            </LineChart>
          </ResponsiveContainer>
        </ChartCard>

        <ChartCard title="By province" query={provinceQuery}>
          <ResponsiveContainer width="100%" height={280}>
            <BarChart data={provinceQuery.data?.data || []} layout="vertical">
              <CartesianGrid strokeDasharray="3 3" stroke="#d8d6c8" />
              <XAxis type="number" tick={{ fill: '#46504d' }} />
              <YAxis type="category" dataKey="province_name" width={120} tick={{ fill: '#46504d', fontSize: 12 }} />
              <Tooltip />
              <Bar dataKey="organization_count" fill="#0d8d67" />
            </BarChart>
          </ResponsiveContainer>
        </ChartCard>

        <ChartCard title="By sector" query={sectorQuery}>
          <div className="stack-sm">
            {(sectorQuery.data?.data || []).slice(0, 8).map((bucket, index) => (
              <div key={bucket.primary_industry_sector_code} className="bar-row">
                <div>
                  <strong>{bucket.primary_industry_sector_name}</strong>
                  <p className="muted">Mappable: {formatNumber(bucket.mappable_count)}</p>
                </div>
                <div className="bar-meter">
                  <div
                    className="bar-meter-fill"
                    style={{
                      width: `${Math.max(bucket.organization_count * 24, 12)}px`,
                      background: chartPalette[index % chartPalette.length],
                    }}
                  />
                  <span>{formatNumber(bucket.organization_count)}</span>
                </div>
              </div>
            ))}
          </div>
        </ChartCard>

        <ChartCard title="By organization type" query={typeQuery}>
          <ResponsiveContainer width="100%" height={280}>
            <BarChart data={typeQuery.data?.data || []}>
              <CartesianGrid strokeDasharray="3 3" stroke="#d8d6c8" />
              <XAxis dataKey="organization_type_name" tick={{ fill: '#46504d', fontSize: 12 }} />
              <YAxis tick={{ fill: '#46504d' }} />
              <Tooltip />
              <Bar dataKey="organization_count">
                {(typeQuery.data?.data || []).map((bucket, index) => (
                  <Cell key={bucket.organization_type_code} fill={chartPalette[index % chartPalette.length]} />
                ))}
              </Bar>
            </BarChart>
          </ResponsiveContainer>
        </ChartCard>
      </div>

      <Card>
        <div className="section-header compact">
          <div>
            <p className="eyebrow">Impact flows</p>
            <h2>Ma trận tín hiệu theo sector × impact area × geography</h2>
            <p className="section-description">
              Visualization hiện dùng raw cohort signals; không bịa thêm analytics ngoài contract backend.
            </p>
          </div>
        </div>
        {flowsQuery.isLoading ? (
          <LoadingState />
        ) : flowsQuery.isError ? (
          <ErrorState description="Không tải được impact flows." onRetry={() => void flowsQuery.refetch()} />
        ) : flowsQuery.data?.data.length ? (
          <div className="flow-grid">
            {flowsQuery.data.data.map((cell) => (
              <div key={`${cell.primary_industry_sector?.code}-${cell.environmental_impact_area?.code}-${cell.province?.code}`} className="flow-cell">
                <div className="stack-sm">
                  <strong>{cell.primary_industry_sector?.display_name || 'Unknown sector'}</strong>
                  <p className="muted">
                    {cell.environmental_impact_area?.display_name || 'No impact area'} · {cell.province?.display_name || 'No province'}
                  </p>
                  <div className="stack-inline">
                    <span className="metric-badge">{formatNumber(cell.organization_count)} orgs</span>
                    <span className="metric-badge">{formatNumber(cell.social_impact_count)} social</span>
                  </div>
                </div>
              </div>
            ))}
          </div>
        ) : (
          <EmptyState title="Chưa có impact flow cells" description="Bộ lọc hiện tại chưa trả cell nào." />
        )}
      </Card>

      <Card>
        <div className="section-header compact">
          <div>
            <p className="eyebrow">Pillar analytics</p>
            <h2>Đang cập nhật</h2>
          </div>
        </div>
        <EmptyState
          title="Chưa có endpoint pillar analytics"
          description="Docs có nhắc đến pillar analytics, nhưng backend sprint hiện không expose aggregate endpoint business-final cho 5 pillars."
        />
      </Card>
    </div>
  )
}

function ChartCard({
  title,
  query,
  children,
}: {
  title: string
  query: {
    isLoading: boolean
    isError: boolean
    refetch: () => Promise<unknown>
    data?: unknown
  }
  children: ReactNode
}) {
  return (
    <Card>
      <div className="section-header compact">
        <div>
          <h2>{title}</h2>
        </div>
      </div>
      {query.isLoading ? <LoadingState /> : query.isError ? <ErrorState description={`Không tải được ${title}.`} onRetry={() => void query.refetch()} /> : children}
    </Card>
  )
}
