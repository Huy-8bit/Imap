import { useState } from 'react'
import { useQuery } from '@tanstack/react-query'
import { Link } from 'react-router-dom'

import { Badge } from '../components/ui/Badge'
import { Card } from '../components/ui/Card'
import { Field, Select } from '../components/ui/Field'
import { EmptyState, ErrorState, LoadingState } from '../components/ui/States'
import { getCertificationDirectory } from '../features/certification/api'
import { getTaxonomies } from '../features/taxonomies/api'
import { formatDate } from '../lib/utils/format'

export function CertificationDirectoryPage() {
  const [filters, setFilters] = useState({
    province: '',
    organizationType: '',
    primaryIndustrySector: '',
    certificationLevel: '',
  })

  const taxonomiesQuery = useQuery({
    queryKey: ['taxonomies', 'certification-directory'],
    queryFn: getTaxonomies,
  })
  const directoryQuery = useQuery({
    queryKey: ['certification', 'directory', filters],
    queryFn: () => getCertificationDirectory(filters),
  })

  const taxonomies = taxonomiesQuery.data?.data.taxonomies

  return (
    <div className="page-stack">
      <section className="page-intro">
        <div>
          <p className="eyebrow">Certification directory</p>
          <h1>Danh sách public record đã được directory-visible.</h1>
          <p className="lead">Filters ở đây bám đúng query params hiện có của endpoint `/api/certification/directory`.</p>
        </div>
      </section>

      <Card className="filter-card">
        <Field label="Province">
          <Select value={filters.province} onChange={(event) => setFilters((current) => ({ ...current, province: event.target.value }))}>
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
            value={filters.organizationType}
            onChange={(event) => setFilters((current) => ({ ...current, organizationType: event.target.value }))}
          >
            <option value="">Tất cả</option>
            {taxonomies?.organization_types?.map((item) => (
              <option key={item.code} value={item.code}>
                {item.display_name}
              </option>
            ))}
          </Select>
        </Field>
        <Field label="Primary sector">
          <Select
            value={filters.primaryIndustrySector}
            onChange={(event) => setFilters((current) => ({ ...current, primaryIndustrySector: event.target.value }))}
          >
            <option value="">Tất cả</option>
            {taxonomies?.industry_sectors?.map((item) => (
              <option key={item.code} value={item.code}>
                {item.display_name}
              </option>
            ))}
          </Select>
        </Field>
        <Field label="Certification level">
          <Select
            value={filters.certificationLevel}
            onChange={(event) => setFilters((current) => ({ ...current, certificationLevel: event.target.value }))}
          >
            <option value="">Tất cả</option>
            {taxonomies?.certification_levels?.map((item) => (
              <option key={item.code} value={item.code}>
                {item.display_name}
              </option>
            ))}
          </Select>
        </Field>
      </Card>

      {directoryQuery.isLoading ? (
        <LoadingState />
      ) : directoryQuery.isError ? (
        <ErrorState description="Không tải được certification directory." onRetry={() => void directoryQuery.refetch()} />
      ) : directoryQuery.data?.data.length ? (
        <div className="card-grid">
          {directoryQuery.data.data.map((item) => (
            <Card key={item.organization_id}>
              <div className="stack-sm">
                <div className="stack-inline">
                  {item.certification_level ? <Badge tone="gold">{item.certification_level.display_name}</Badge> : null}
                  <Badge tone="green">{item.certification_status}</Badge>
                </div>
                <h3>{item.display_name}</h3>
                <p className="muted">
                  {item.province?.display_name || 'Đang cập nhật'} · {item.organization_type?.display_name || 'Loại hình đang cập nhật'}
                </p>
                <p className="small-note">Issued {formatDate(item.issued_at)}</p>
                <Link to={`/enterprises/${item.organization_id}`} className="inline-link">
                  Xem enterprise detail
                </Link>
              </div>
            </Card>
          ))}
        </div>
      ) : (
        <EmptyState title="Không có record phù hợp" description="Bộ lọc hiện tại không trả certification record public nào." />
      )}
    </div>
  )
}
