import { useState } from 'react'
import { useMutation, useQuery } from '@tanstack/react-query'

import { Badge } from '../components/ui/Badge'
import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { ErrorState, LoadingState, EmptyState } from '../components/ui/States'
import { approveSecondCertification, getAdminQueue } from '../features/admin/api'
import { formatDate } from '../lib/utils/format'

export function AdminQueuePage() {
  const [approveTarget, setApproveTarget] = useState<number | null>(null)
  const [approveResult, setApproveResult] = useState<string | null>(null)

  const queueQuery = useQuery({
    queryKey: ['admin', 'queue'],
    queryFn: getAdminQueue,
    refetchInterval: 30_000,
  })

  const approveSecondMutation = useMutation({
    mutationFn: (orgId: number) => approveSecondCertification(orgId),
    onSuccess: (data) => {
      setApproveResult(`Certification ★★★★★ org #${data.data.org_id} đã được phê duyệt lần 2.`)
      setApproveTarget(null)
      void queueQuery.refetch()
    },
  })

  const queue = queueQuery.data?.data

  return (
    <div className="stack-md">
      <div className="section-header compact">
        <div>
          <p className="eyebrow">Admin queue</p>
          <h2>Pending reviews</h2>
          <p className="section-description">
            Tổng <strong>{queue?.total_pending ?? '—'}</strong> mục đang chờ xử lý.
          </p>
        </div>
        <Button variant="secondary" onClick={() => void queueQuery.refetch()}>
          Refresh
        </Button>
      </div>

      {approveResult && (
        <Card>
          <div className="success-banner">
            <strong>{approveResult}</strong>
          </div>
        </Card>
      )}

      {queueQuery.isLoading ? (
        <LoadingState label="Đang tải queue..." />
      ) : queueQuery.isError ? (
        <ErrorState description="Không tải được admin queue." onRetry={() => void queueQuery.refetch()} />
      ) : (
        <>
          <Card>
            <div className="section-header compact">
              <div>
                <p className="eyebrow">Claim requests</p>
                <h2>Pending claims</h2>
              </div>
            </div>
            {!queue?.pending_claims.length ? (
              <EmptyState title="Không có claim đang chờ" description="Hàng đợi claim hiện tại rỗng." />
            ) : (
              <div className="stack-sm">
                {queue.pending_claims.map((item) => (
                  <div key={item.id} className="queue-row">
                    <div className="stack-inline">
                      <Badge tone={item.status === 'pending_verification' ? 'warning' : 'blue'}>
                        {item.status}
                      </Badge>
                      <span>Org #{item.org_id}</span>
                      <span className="muted">· User #{item.user_id}</span>
                    </div>
                    <span className="muted">{formatDate(item.submitted_at)}</span>
                  </div>
                ))}
              </div>
            )}
          </Card>

          <Card>
            <div className="section-header compact">
              <div>
                <p className="eyebrow">Certifications</p>
                <h2>Pending cert applications</h2>
              </div>
            </div>
            {!queue?.pending_certifications.length ? (
              <EmptyState
                title="Không có certification đang chờ"
                description="Hàng đợi certification hiện tại rỗng."
              />
            ) : (
              <div className="stack-sm">
                {queue.pending_certifications.map((item) => (
                  <div key={item.id} className="queue-row">
                    <div className="stack-inline">
                      <Badge tone="blue">{item.status}</Badge>
                      <span>Org #{item.org_id}</span>
                    </div>
                    <span className="muted">{formatDate(item.submitted_at)}</span>
                  </div>
                ))}
              </div>
            )}
          </Card>

          <Card>
            <div className="section-header compact">
              <div>
                <p className="eyebrow">Two-person rule</p>
                <h2>Phê duyệt second approver cho ★★★★★</h2>
                <p className="section-description">
                  Chỉ áp dụng cho certification ★★★★★ đang chờ người duyệt thứ 2. Người duyệt phải khác người tạo yêu cầu.
                </p>
              </div>
            </div>
            <div className="stack-md">
              <div className="inline-form">
                <input
                  type="number"
                  className="field-input"
                  placeholder="Org ID"
                  value={approveTarget ?? ''}
                  onChange={(e) => setApproveTarget(e.target.value ? Number(e.target.value) : null)}
                  min={1}
                />
                <Button
                  variant="primary"
                  onClick={() => approveTarget && approveSecondMutation.mutate(approveTarget)}
                  disabled={!approveTarget || approveSecondMutation.isPending}
                >
                  {approveSecondMutation.isPending ? 'Đang xử lý...' : 'Phê duyệt second'}
                </Button>
              </div>
              {approveSecondMutation.isError && (
                <p className="error-text">
                  {approveSecondMutation.error instanceof Error
                    ? approveSecondMutation.error.message
                    : 'Phê duyệt thất bại.'}
                </p>
              )}
            </div>
          </Card>
        </>
      )}
    </div>
  )
}
