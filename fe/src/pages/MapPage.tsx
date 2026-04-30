import { useMemo, useState } from 'react'
import { useQuery } from '@tanstack/react-query'
import { MapContainer, Marker, Popup, TileLayer } from 'react-leaflet'
import L from 'leaflet'
import { Link } from 'react-router-dom'
import 'leaflet/dist/leaflet.css'
import markerIcon from 'leaflet/dist/images/marker-icon.png'
import markerIcon2x from 'leaflet/dist/images/marker-icon-2x.png'
import markerShadow from 'leaflet/dist/images/marker-shadow.png'

import { RadarScoreCard } from '../components/charts/RadarScoreCard'
import { Badge } from '../components/ui/Badge'
import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { Field, Select } from '../components/ui/Field'
import { EmptyState, ErrorState, LoadingState } from '../components/ui/States'
import { getDashboardByProvince } from '../features/dashboard/api'
import { getEnterprises, getEnterpriseQuick, getMapEnterprises } from '../features/enterprises/api'
import { getTaxonomies } from '../features/taxonomies/api'
import type { EnterpriseFilterParams } from '../lib/api/types'
import { formatNumber } from '../lib/utils/format'

L.Icon.Default.mergeOptions({
  iconRetinaUrl: markerIcon2x,
  iconUrl: markerIcon,
  shadowUrl: markerShadow,
})

const mapCenter: [number, number] = [16.0, 106.0]

export function MapPage() {
  const [selectedEnterpriseId, setSelectedEnterpriseId] = useState<number | null>(null)
  const [filters, setFilters] = useState<EnterpriseFilterParams>({})

  const taxonomiesQuery = useQuery({
    queryKey: ['taxonomies'],
    queryFn: getTaxonomies,
  })
  const mapQuery = useQuery({
    queryKey: ['map', 'enterprises', filters],
    queryFn: () => getMapEnterprises(filters),
  })
  const listQuery = useQuery({
    queryKey: ['enterprises', 'map-list', filters],
    queryFn: () => getEnterprises({ ...filters, page: 1, page_size: 12 }),
  })
  const provinceBreakdownQuery = useQuery({
    queryKey: ['dashboard', 'province', 'map', filters],
    queryFn: () => getDashboardByProvince(filters),
  })
  const quickQuery = useQuery({
    queryKey: ['enterprise', 'quick', selectedEnterpriseId],
    queryFn: () => getEnterpriseQuick(selectedEnterpriseId as number),
    enabled: selectedEnterpriseId !== null,
  })

  const taxonomyGroups = taxonomiesQuery.data?.data.taxonomies

  const features = mapQuery.data?.data.features || []
  const activeQuickId = selectedEnterpriseId || listQuery.data?.data[0]?.id || null

  const selectableList = listQuery.data?.data || []

  const disabledFilterNotes = useMemo(
    () => [
      'SDG layer: chưa có API map overlay thật.',
      'Investor layer: chưa có backend support.',
      'SE/SIB/IB classification: taxonomy có seed nhưng backend public map chưa filter theo field này.',
      'Star rating: field có thể null, không có rating filter endpoint công khai.',
    ],
    [],
  )

  return (
    <div className="page-stack">
      <section className="page-intro">
        <div>
          <p className="eyebrow">Impact map</p>
          <h1>Bản đồ là core module, nhưng chỉ hiển thị geometry thật.</h1>
          <p className="lead">
            Dataset local hiện có doanh nghiệp, taxonomy và quick profile; tuy nhiên `mappable_total` đang bằng 0 nên page này giữ
            đúng empty state thay vì fabricate marker.
          </p>
        </div>
      </section>

      <section className="map-layout">
        <Card className="map-sidebar">
          <div className="stack-md">
            <div>
              <h3>Bộ lọc</h3>
              <p className="muted">Chỉ dùng taxonomy code mà backend public routes hiện support.</p>
            </div>

            <Field label="Province">
              <Select
                value={filters.province || ''}
                onChange={(event) => setFilters((current) => ({ ...current, province: event.target.value || undefined }))}
              >
                <option value="">Tất cả tỉnh thành</option>
                {taxonomyGroups?.provinces?.map((item) => (
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
                  setFilters((current) => ({
                    ...current,
                    organizationType: event.target.value || undefined,
                  }))
                }
              >
                <option value="">Tất cả loại hình</option>
                {taxonomyGroups?.organization_types?.map((item) => (
                  <option key={item.code} value={item.code}>
                    {item.display_name}
                  </option>
                ))}
              </Select>
            </Field>

            <Field label="Primary sector">
              <Select
                value={filters.primaryIndustrySector || ''}
                onChange={(event) =>
                  setFilters((current) => ({
                    ...current,
                    primaryIndustrySector: event.target.value || undefined,
                  }))
                }
              >
                <option value="">Tất cả lĩnh vực</option>
                {taxonomyGroups?.industry_sectors?.map((item) => (
                  <option key={item.code} value={item.code}>
                    {item.display_name}
                  </option>
                ))}
              </Select>
            </Field>

            <Field label="Operational status">
              <Select
                value={filters.operationalStatus || ''}
                onChange={(event) =>
                  setFilters((current) => ({
                    ...current,
                    operationalStatus: event.target.value || undefined,
                  }))
                }
              >
                <option value="">Tất cả trạng thái</option>
                {taxonomyGroups?.operational_statuses?.map((item) => (
                  <option key={item.code} value={item.code}>
                    {item.display_name}
                  </option>
                ))}
              </Select>
            </Field>

            <div className="disabled-filter-list">
              {disabledFilterNotes.map((note) => (
                <div key={note} className="disabled-filter-item">
                  {note}
                </div>
              ))}
            </div>
          </div>
        </Card>

        <div className="map-main">
          <Card className="map-surface">
            <div className="map-shell">
              <MapContainer center={mapCenter} zoom={6} scrollWheelZoom className="leaflet-map">
                <TileLayer
                  attribution='&copy; OpenStreetMap contributors'
                  url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                />
                {features.map((feature) => (
                  <Marker
                    key={feature.properties.id}
                    position={[feature.geometry.coordinates[1], feature.geometry.coordinates[0]]}
                    eventHandlers={{
                      click: () => setSelectedEnterpriseId(feature.properties.id),
                    }}
                  >
                    <Popup>
                      <strong>{feature.properties.display_name}</strong>
                      <br />
                      {feature.properties.province?.display_name || 'Đang cập nhật địa bàn'}
                    </Popup>
                  </Marker>
                ))}
              </MapContainer>

              {!mapQuery.isLoading && !features.length ? (
                <div className="map-overlay-note">
                  <p className="eyebrow">Map empty by contract</p>
                  <h3>Chưa có geometry hợp lệ để render marker.</h3>
                  <p>
                    Backend trả `matched_total` {formatNumber(mapQuery.data?.meta.matched_total || 0)} nhưng `mappable_total` bằng{' '}
                    {formatNumber(mapQuery.data?.meta.mappable_total || 0)}.
                  </p>
                </div>
              ) : null}
            </div>
          </Card>

          <div className="map-secondary">
            <Card>
              <div className="section-header compact">
                <div>
                  <p className="eyebrow">Quick profile</p>
                  <h2>Enterprise preview</h2>
                </div>
              </div>
              {activeQuickId ? (
                <QuickPanel
                  enterpriseId={activeQuickId}
                  selectedEnterpriseId={selectedEnterpriseId}
                  query={quickQuery}
                  onSelect={setSelectedEnterpriseId}
                  list={selectableList}
                />
              ) : (
                <EmptyState title="Chưa có enterprise" description="Bộ lọc hiện không trả record nào." />
              )}
            </Card>

            <Card>
              <div className="section-header compact">
                <div>
                  <p className="eyebrow">Coverage</p>
                  <h2>Breakdown by province</h2>
                </div>
              </div>
              {provinceBreakdownQuery.isLoading ? (
                <LoadingState />
              ) : provinceBreakdownQuery.isError ? (
                <ErrorState
                  description="Không tải được breakdown theo tỉnh."
                  onRetry={() => void provinceBreakdownQuery.refetch()}
                />
              ) : (
                <div className="stack-sm">
                  {provinceBreakdownQuery.data?.data.map((bucket) => (
                    <div key={bucket.province_code} className="metric-row">
                      <span>{bucket.province_name}</span>
                      <strong>{formatNumber(bucket.organization_count)}</strong>
                    </div>
                  ))}
                </div>
              )}
            </Card>
          </div>
        </div>
      </section>
    </div>
  )
}

function QuickPanel({
  enterpriseId,
  selectedEnterpriseId,
  query,
  onSelect,
  list,
}: {
  enterpriseId: number
  selectedEnterpriseId: number | null
  query: ReturnType<typeof useQuery<{ success: boolean; message: string; data: import('../lib/api/types').EnterpriseQuickInfo; meta: unknown }, Error>>
  onSelect: (value: number) => void
  list: Array<Awaited<ReturnType<typeof getEnterprises>>['data'][number]>
}) {
  const current = selectedEnterpriseId ? query.data?.data : undefined
  const fallback = list.find((item) => item.id === enterpriseId)

  return (
    <div className="stack-md">
      <div className="chip-scroll">
        {list.map((item) => (
          <button
            key={item.id}
            type="button"
            className={item.id === enterpriseId ? 'chip-button is-active' : 'chip-button'}
            onClick={() => onSelect(item.id)}
          >
            {item.display_name}
          </button>
        ))}
      </div>

      {query.isLoading && selectedEnterpriseId ? <LoadingState label="Đang tải quick profile..." /> : null}
      {query.isError && selectedEnterpriseId ? (
        <ErrorState description="Không tải được quick profile." onRetry={() => void query.refetch()} />
      ) : null}

      <div className="stack-sm">
        <h3>{current?.display_name || fallback?.display_name}</h3>
        <p className="muted">
          {current?.province?.display_name || fallback?.province?.display_name || 'Đang cập nhật'}
          {current?.organization_type?.display_name ? ` · ${current.organization_type.display_name}` : ''}
        </p>
        <div className="stack-inline">
          {current?.operational_status ? <Badge tone="green">{current.operational_status.display_name}</Badge> : null}
          {current?.location_precision ? <Badge>{current.location_precision}</Badge> : null}
        </div>
        {current?.website ? (
          <a href={current.website} target="_blank" rel="noreferrer" className="inline-link">
            {current.website}
          </a>
        ) : null}
      </div>

      {current ? <RadarScoreCard data={current.radar} title="Radar preview" /> : null}

      <Link to={`/enterprises/${enterpriseId}`}>
        <Button variant="secondary" block>
          Xem hồ sơ chi tiết
        </Button>
      </Link>
    </div>
  )
}
