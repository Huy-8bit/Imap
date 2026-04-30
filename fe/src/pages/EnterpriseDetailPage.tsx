import { useQuery } from '@tanstack/react-query'
import { Link, useParams } from 'react-router-dom'

import { RadarScoreCard } from '../components/charts/RadarScoreCard'
import { Badge } from '../components/ui/Badge'
import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { EmptyState, ErrorState, LoadingState } from '../components/ui/States'
import { getCertificationDetail } from '../features/certification/api'
import { getEnterpriseDetail, getEnterpriseRadar } from '../features/enterprises/api'
import { formatDate, formatLabel } from '../lib/utils/format'

export function EnterpriseDetailPage() {
  const params = useParams()
  const enterpriseId = Number(params.enterpriseId)

  const detailQuery = useQuery({
    queryKey: ['enterprise', 'detail', enterpriseId],
    queryFn: () => getEnterpriseDetail(enterpriseId),
    enabled: Number.isFinite(enterpriseId),
  })
  const radarQuery = useQuery({
    queryKey: ['enterprise', 'radar', enterpriseId],
    queryFn: () => getEnterpriseRadar(enterpriseId),
    enabled: Number.isFinite(enterpriseId),
  })
  const certificationQuery = useQuery({
    queryKey: ['enterprise', 'certification', enterpriseId],
    queryFn: () => getCertificationDetail(enterpriseId),
    enabled: Number.isFinite(enterpriseId),
  })

  if (!Number.isFinite(enterpriseId)) {
    return <EmptyState title="Enterprise không hợp lệ" description="ID từ route không hợp lệ." />
  }

  if (detailQuery.isLoading) {
    return <LoadingState label="Đang tải hồ sơ doanh nghiệp..." />
  }

  if (detailQuery.isError || !detailQuery.data) {
    return <ErrorState description="Không tải được hồ sơ doanh nghiệp." onRetry={() => void detailQuery.refetch()} />
  }

  const detail = detailQuery.data.data
  const certification = certificationQuery.data?.data

  return (
    <div className="page-stack">
      <section className="page-intro">
        <div>
          <p className="eyebrow">Enterprise profile</p>
          <h1>{detail.display_name}</h1>
          <p className="lead">
            Hồ sơ chi tiết nối trực tiếp từ `GET /api/enterprises/{enterpriseId}`. Các badge chỉ hiển thị khi backend trả field thật.
          </p>
          <div className="stack-inline">
            {detail.general.operational_status ? <Badge tone="green">{detail.general.operational_status.display_name}</Badge> : null}
            {detail.classification.organization_type ? <Badge tone="blue">{detail.classification.organization_type.display_name}</Badge> : null}
            {detail.classification.impact_entity_type ? <Badge tone="gold">{detail.classification.impact_entity_type.display_name}</Badge> : null}
            {detail.classification.star_rating ? <Badge tone="gold">{detail.classification.star_rating} sao</Badge> : null}
          </div>
        </div>
        <div className="hero-actions">
          <Link to="/map">
            <Button variant="secondary">Quay lại map</Button>
          </Link>
          <Link to="/dashboard">
            <Button variant="ghost">Mở dashboard</Button>
          </Link>
        </div>
      </section>

      <div className="detail-grid">
        <Card>
          <h2>Thông tin chung</h2>
          <dl className="detail-list">
            <div>
              <dt>Tên giao dịch</dt>
              <dd>{detail.general.trade_name || 'Đang cập nhật'}</dd>
            </div>
            <div>
              <dt>Tên đăng ký</dt>
              <dd>{detail.general.registered_name || 'Đang cập nhật'}</dd>
            </div>
            <div>
              <dt>Năm thành lập</dt>
              <dd>{detail.general.founded_year || 'Đang cập nhật'}</dd>
            </div>
            <div>
              <dt>Mã số thuế</dt>
              <dd>{detail.general.tax_code || 'Đang cập nhật'}</dd>
            </div>
            <div>
              <dt>Source status</dt>
              <dd>{formatLabel(detail.source_status)}</dd>
            </div>
            <div>
              <dt>Updated</dt>
              <dd>{formatDate(detail.updated_at)}</dd>
            </div>
          </dl>
        </Card>

        <Card>
          <h2>Classification</h2>
          <dl className="detail-list">
            <div>
              <dt>Loại hình</dt>
              <dd>{detail.classification.organization_type?.display_name || 'Đang cập nhật'}</dd>
            </div>
            <div>
              <dt>Ngành chủ đạo</dt>
              <dd>{detail.classification.primary_industry_sector?.display_name || 'Đang cập nhật'}</dd>
            </div>
            <div>
              <dt>Ngành khác</dt>
              <dd>{detail.classification.other_industry_sectors.map((item) => item.display_name).join(', ') || 'Không có'}</dd>
            </div>
            <div>
              <dt>Tác động môi trường</dt>
              <dd>{detail.classification.environmental_impact_areas.map((item) => item.display_name).join(', ') || 'Không có'}</dd>
            </div>
            <div>
              <dt>Tác động xã hội tích cực</dt>
              <dd>{detail.classification.has_positive_social_impact === null ? 'Đang cập nhật' : detail.classification.has_positive_social_impact ? 'Có' : 'Không'}</dd>
            </div>
          </dl>
        </Card>

        <Card>
          <h2>Contacts & location</h2>
          <dl className="detail-list">
            <div>
              <dt>Email</dt>
              <dd>{detail.contacts.email || 'Đang cập nhật'}</dd>
            </div>
            <div>
              <dt>Phone</dt>
              <dd>{detail.contacts.phone || 'Đang cập nhật'}</dd>
            </div>
            <div>
              <dt>Website</dt>
              <dd>{detail.contacts.website ? <a href={detail.contacts.website}>{detail.contacts.website}</a> : 'Đang cập nhật'}</dd>
            </div>
            <div>
              <dt>Province</dt>
              <dd>{detail.location.province?.display_name || 'Đang cập nhật'}</dd>
            </div>
            <div>
              <dt>Ward</dt>
              <dd>{detail.location.ward_name || 'Đang cập nhật'}</dd>
            </div>
            <div>
              <dt>Location precision</dt>
              <dd>{detail.location.location_precision || 'Đang cập nhật'}</dd>
            </div>
          </dl>
        </Card>

        <Card>
          {radarQuery.isLoading ? (
            <LoadingState label="Đang tải radar..." />
          ) : radarQuery.isError || !radarQuery.data ? (
            <ErrorState description="Không tải được radar snapshot." onRetry={() => void radarQuery.refetch()} />
          ) : (
            <RadarScoreCard data={radarQuery.data.data} />
          )}
        </Card>
      </div>

      <Card>
        <div className="section-header compact">
          <div>
            <p className="eyebrow">Certification</p>
            <h2>Impactonomy Mark status</h2>
          </div>
        </div>
        {certificationQuery.isLoading ? (
          <LoadingState />
        ) : certificationQuery.isError ? (
          <ErrorState description="Không tải được certification detail." onRetry={() => void certificationQuery.refetch()} />
        ) : certification?.current ? (
          <div className="stack-sm">
            <div className="stack-inline">
              {certification.current.certification_level ? <Badge tone="gold">{certification.current.certification_level.display_name}</Badge> : null}
              <Badge tone="green">{certification.current.status}</Badge>
            </div>
            <p className="muted">{certification.current.public_note || 'Chưa có public note.'}</p>
          </div>
        ) : (
          <EmptyState title="Chưa có chứng nhận hiện hành" description="Doanh nghiệp này hiện chưa có current certification record công khai." />
        )}
      </Card>
    </div>
  )
}
