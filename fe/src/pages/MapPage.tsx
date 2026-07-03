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
import { getEnterprises, getEnterpriseQuick, getMapEnterprises, getMapPins } from '../features/enterprises/api'
import { getTaxonomies } from '../features/taxonomies/api'
import type { EnterpriseFilterParams } from '../lib/api/types'
import { formatNumber } from '../lib/utils/format'

L.Icon.Default.mergeOptions({
  iconRetinaUrl: markerIcon2x,
  iconUrl: markerIcon,
  shadowUrl: markerShadow,
})

const mapCenter: [number, number] = [16.0, 106.0]

function hasActiveFilters(filters: EnterpriseFilterParams): boolean {
  return Object.values(filters).some((v) => v !== undefined && v !== null && v !== '')
}

export function MapPage() {
  const [selectedEnterpriseId, setSelectedEnterpriseId] = useState<number | null>(null)
  const [filters, setFilters] = useState<EnterpriseFilterParams>({})

  const filtersActive = hasActiveFilters(filters)

  const taxonomiesQuery = useQuery({
    queryKey: ['taxonomies'],
    queryFn: getTaxonomies,
  })

  const pinsQuery = useQuery({
    queryKey: ['map', 'pins'],
    queryFn: getMapPins,
    enabled: !filtersActive,
    staleTime: 5 * 60 * 1000,
  })

  const mapQuery = useQuery({
    queryKey: ['map', 'enterprises', filters],
    queryFn: () => getMapEnterprises(filters),
    enabled: filtersActive,
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

  const pinMarkers: Array<{ id: number; lat: number; lng: number; label: string }> = useMemo(() => {
    if (filtersActive) {
      return (mapQuery.data?.data.features || []).map((f) => ({
        id: f.properties.id,
        lat: f.geometry.coordinates[1],
        lng: f.geometry.coordinates[0],
        label: f.properties.display_name,
      }))
    }
    return (pinsQuery.data?.data.features || []).map((f) => ({
      id: f.properties.id,
      lat: f.geometry.coordinates[1],
      lng: f.geometry.coordinates[0],
      label: `#${f.properties.id} · ${f.properties.status}`,
    }))
  }, [filtersActive, pinsQuery.data, mapQuery.data])

  const isMapLoading = filtersActive ? mapQuery.isLoading : pinsQuery.isLoading
  const mapTotal = filtersActive
    ? mapQuery.data?.meta.mappable_total ?? 0
    : (pinsQuery.data?.meta.total ?? 0)

  const activeQuickId = selectedEnterpriseId || listQuery.data?.data[0]?.id || null
  const selectableList = listQuery.data?.data || []


  return (
    <div className="page-stack">
      <section className="page-intro">
        <div>
          <p className="eyebrow">Impact map</p>
          <h1>Bản đồ doanh nghiệp tác động xã hội</h1>
          {filtersActive && mapQuery.data ? (
            <p className="lead">
              {formatNumber(mapQuery.data.meta.matched_total)} tổ chức khớp bộ lọc
              {mapTotal > 0 ? `, ${formatNumber(mapTotal)} có vị trí địa lý.` : '.'}
            </p>
          ) : null}
        </div>
      </section>

      <div className="map-viewport">
        <aside className="map-filter-panel">
          <div className="stack-md">
            <h3>Bộ lọc</h3>

            <Field label="Province">
              <Select
                value={filters.province || ''}
                onChange={(e) => setFilters((c) => ({ ...c, province: e.target.value || undefined }))}
              >
                <option value="">Tất cả tỉnh thành</option>
                {taxonomyGroups?.provinces?.map((item) => (
                  <option key={item.code} value={item.code}>{item.display_name}</option>
                ))}
              </Select>
            </Field>

            <Field label="Organization type">
              <Select
                value={filters.organizationType || ''}
                onChange={(e) => setFilters((c) => ({ ...c, organizationType: e.target.value || undefined }))}
              >
                <option value="">Tất cả loại hình</option>
                {taxonomyGroups?.organization_types?.map((item) => (
                  <option key={item.code} value={item.code}>{item.display_name}</option>
                ))}
              </Select>
            </Field>

            <Field label="Primary sector">
              <Select
                value={filters.primaryIndustrySector || ''}
                onChange={(e) => setFilters((c) => ({ ...c, primaryIndustrySector: e.target.value || undefined }))}
              >
                <option value="">Tất cả lĩnh vực</option>
                {taxonomyGroups?.industry_sectors?.map((item) => (
                  <option key={item.code} value={item.code}>{item.display_name}</option>
                ))}
              </Select>
            </Field>

            <Field label="Operational status">
              <Select
                value={filters.operationalStatus || ''}
                onChange={(e) => setFilters((c) => ({ ...c, operationalStatus: e.target.value || undefined }))}
              >
                <option value="">Tất cả trạng thái</option>
                {taxonomyGroups?.operational_statuses?.map((item) => (
                  <option key={item.code} value={item.code}>{item.display_name}</option>
                ))}
              </Select>
            </Field>

            {filtersActive && (
              <Button variant="ghost" onClick={() => setFilters({})}>
                Xoá tất cả filter
              </Button>
            )}

          </div>
        </aside>

        <div className="map-center-panel">
          <MapContainer center={mapCenter} zoom={6} scrollWheelZoom className="leaflet-map">
            <TileLayer
              attribution='&copy; OpenStreetMap contributors'
              url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
            />
            {pinMarkers.map((pin) => (
              <Marker
                key={pin.id}
                position={[pin.lat, pin.lng]}
                eventHandlers={{ click: () => setSelectedEnterpriseId(pin.id) }}
              >
                <Popup>
                  <strong>{pin.label}</strong>
                </Popup>
              </Marker>
            ))}
          </MapContainer>

          {!isMapLoading && pinMarkers.length === 0 && (
            <div className="map-overlay-note">
              <h3>Chưa có tổ chức nào có vị trí địa lý để hiển thị.</h3>
              <p>Thử thay đổi bộ lọc hoặc quay lại sau khi dữ liệu được cập nhật.</p>
            </div>
          )}
        </div>

        <aside className="map-right-panel">
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
        </aside>
      </div>
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
  query: ReturnType<typeof useQuery<import('../lib/api/types').ApiEnvelope<import('../lib/api/types').EnterpriseQuickInfo>, Error>>
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
