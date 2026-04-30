import { useMemo, useState } from 'react'
import { useMutation, useQuery } from '@tanstack/react-query'
import { Link } from 'react-router-dom'

import { Badge } from '../components/ui/Badge'
import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { Field, Select, Textarea } from '../components/ui/Field'
import { EmptyState, ErrorState, LoadingState } from '../components/ui/States'
import { applyCertification, getCertificationDirectory } from '../features/certification/api'
import { getTaxonomies } from '../features/taxonomies/api'
import { useAuth } from '../lib/auth/auth'

export function ImpactonomyPage() {
  const { isEnterprise, user } = useAuth()
  const [requestedLevelCode, setRequestedLevelCode] = useState('basic')
  const [applicationNote, setApplicationNote] = useState('')

  const directoryQuery = useQuery({
    queryKey: ['certification', 'directory', 'impactonomy'],
    queryFn: () => getCertificationDirectory({ page: 1, page_size: 50 }),
  })
  const taxonomiesQuery = useQuery({
    queryKey: ['taxonomies', 'impactonomy'],
    queryFn: getTaxonomies,
  })

  const certificationMutation = useMutation({
    mutationFn: () =>
      applyCertification({
        enterpriseId: user?.organization?.id || undefined,
        requestedLevelCode,
        applicationNote,
      }),
  })

  const levelCounts = useMemo(() => {
    const counts = new Map<string, number>()
    for (const item of directoryQuery.data?.data || []) {
      const code = item.certification_level?.code || 'unknown'
      counts.set(code, (counts.get(code) || 0) + 1)
    }
    return counts
  }, [directoryQuery.data?.data])

  const levelOptions = taxonomiesQuery.data?.data.taxonomies.certification_levels || []

  return (
    <div className="page-stack">
      <section className="hero-panel hero-panel-compact">
        <div className="hero-copy">
          <p className="eyebrow">Impactonomy</p>
          <h1>Basic → Verified → Gold</h1>
          <p className="lead">
            Trang này lấy tinh thần từ docs và prototype, nhưng flow chỉ dùng các endpoint certification/assessment/auth hiện có.
          </p>
          <div className="hero-actions">
            <Link to="/impactonomy/directory">
              <Button>Open directory</Button>
            </Link>
            <Link to={isEnterprise ? '/assessment' : '/register'}>
              <Button variant="secondary">{isEnterprise ? 'Mở assessment' : 'Đăng ký doanh nghiệp'}</Button>
            </Link>
          </div>
        </div>
        <div className="tier-summary">
          <TierSummaryCard title="Basic" tone="neutral" count={levelCounts.get('basic') || 0} description="Tự khai, chưa xác thực" />
          <TierSummaryCard title="Verified" tone="blue" count={levelCounts.get('verified') || 0} description="Qua review sơ bộ của IID" />
          <TierSummaryCard title="Gold" tone="gold" count={levelCounts.get('gold') || 0} description="Đã có certification record công khai" />
        </div>
      </section>

      <div className="card-grid">
        <Card>
          <h2>Methodology snapshot</h2>
          <div className="stack-sm">
            <p className="muted">Impactonomy Mark được mô tả trong docs như một bộ lọc chuyên môn để giảm social washing và điều hướng doanh nghiệp vào pipeline IID.</p>
            <div className="timeline-list">
              <div className="timeline-item">
                <strong>1. Onboarding</strong>
                <p>Đăng ký, link enterprise profile, và xuất hiện trong catalog.</p>
              </div>
              <div className="timeline-item">
                <strong>2. Assessment</strong>
                <p>Hiện backend mới có generic pillar placeholder; FE hiển thị đúng trạng thái này.</p>
              </div>
              <div className="timeline-item">
                <strong>3. Certification</strong>
                <p>Apply, review, upgrade được admin-driven qua các endpoint hiện tại.</p>
              </div>
              <div className="timeline-item">
                <strong>4. Integration</strong>
                <p>Reports, due diligence, và kết nối dịch vụ là bước tiếp theo của ecosystem.</p>
              </div>
            </div>
          </div>
        </Card>

        <Card>
          <h2>Assessment reality check</h2>
          <EmptyState
            title="Question bank chưa có câu hỏi thực"
            description="`GET /api/assessment/questions` hiện chỉ trả 5 pillar placeholder với danh sách questions rỗng. FE sẽ không bịa form SIM chính thức."
          />
        </Card>
      </div>

      <Card>
        <div className="section-header compact">
          <div>
            <p className="eyebrow">Certification apply</p>
            <h2>Nộp yêu cầu chứng nhận</h2>
          </div>
        </div>
        {!isEnterprise ? (
          <EmptyState
            title="Cần enterprise session"
            description="Endpoint apply yêu cầu role enterprise. Đăng ký hoặc đăng nhập bằng enterprise account để tiếp tục."
            action={
              <div className="hero-actions">
                <Link to="/register">
                  <Button>Register</Button>
                </Link>
                <Link to="/login">
                  <Button variant="secondary">Login</Button>
                </Link>
              </div>
            }
          />
        ) : (
          <form
            className="stack-md"
            onSubmit={(event) => {
              event.preventDefault()
              certificationMutation.mutate()
            }}
          >
            <Field label="Requested level">
              <Select value={requestedLevelCode} onChange={(event) => setRequestedLevelCode(event.target.value)}>
                {levelOptions.map((item) => (
                  <option key={item.code} value={item.code}>
                    {item.display_name}
                  </option>
                ))}
              </Select>
            </Field>
            <Field label="Application note">
              <Textarea
                value={applicationNote}
                onChange={(event) => setApplicationNote(event.target.value)}
                placeholder="Mô tả ngắn về mục tiêu chứng nhận hoặc bối cảnh hiện tại."
              />
            </Field>
            {certificationMutation.isError ? (
              <ErrorState description="Không gửi được yêu cầu chứng nhận." />
            ) : null}
            {certificationMutation.isSuccess ? (
              <div className="success-banner">Yêu cầu chứng nhận đã được gửi.</div>
            ) : null}
            <Button type="submit" disabled={certificationMutation.isPending}>
              {certificationMutation.isPending ? 'Đang gửi...' : 'Submit application'}
            </Button>
          </form>
        )}
      </Card>

      <Card>
        <div className="section-header compact">
          <div>
            <p className="eyebrow">Directory sample</p>
            <h2>Public certification directory</h2>
          </div>
        </div>
        {directoryQuery.isLoading ? (
          <LoadingState />
        ) : directoryQuery.isError ? (
          <ErrorState description="Không tải được certification directory." onRetry={() => void directoryQuery.refetch()} />
        ) : directoryQuery.data?.data.length ? (
          <div className="card-grid">
            {directoryQuery.data.data.slice(0, 3).map((item) => (
              <Card key={item.organization_id}>
                <div className="stack-sm">
                  <div className="stack-inline">
                    {item.certification_level ? <Badge tone="gold">{item.certification_level.display_name}</Badge> : null}
                    <Badge tone="green">{item.certification_status}</Badge>
                  </div>
                  <h3>{item.display_name}</h3>
                  <p className="muted">{item.province?.display_name || 'Đang cập nhật'} · {item.primary_industry_sector?.display_name || 'Ngành đang cập nhật'}</p>
                  <Link to={`/enterprises/${item.organization_id}`} className="inline-link">
                    Xem enterprise detail
                  </Link>
                </div>
              </Card>
            ))}
          </div>
        ) : (
          <EmptyState title="Directory hiện chưa có nhiều record" description="Dataset local hiện mới seed một certification record công khai." />
        )}
      </Card>
    </div>
  )
}

function TierSummaryCard({
  title,
  description,
  count,
  tone,
}: {
  title: string
  description: string
  count: number
  tone: 'neutral' | 'blue' | 'gold'
}) {
  return (
    <div className={`tier-summary-card tier-summary-${tone}`}>
      <p>{title}</p>
      <strong>{count}</strong>
      <span>{description}</span>
    </div>
  )
}
