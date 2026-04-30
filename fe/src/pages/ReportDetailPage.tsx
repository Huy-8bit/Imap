import { useMutation, useQuery } from '@tanstack/react-query'
import { useParams } from 'react-router-dom'

import { Badge } from '../components/ui/Badge'
import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { EmptyState, ErrorState, LoadingState } from '../components/ui/States'
import { downloadReport, getReportDetail } from '../features/reports/api'

export function ReportDetailPage() {
  const params = useParams()
  const reportId = Number(params.reportId)

  const reportQuery = useQuery({
    queryKey: ['reports', 'detail', reportId],
    queryFn: () => getReportDetail(reportId),
    enabled: Number.isFinite(reportId),
  })
  const downloadMutation = useMutation({
    mutationFn: () => downloadReport(reportId),
  })

  if (!Number.isFinite(reportId)) {
    return <EmptyState title="Report không hợp lệ" description="ID từ route không hợp lệ." />
  }

  if (reportQuery.isLoading) {
    return <LoadingState label="Đang tải report detail..." />
  }

  if (reportQuery.isError || !reportQuery.data) {
    return <ErrorState description="Không tải được report detail." onRetry={() => void reportQuery.refetch()} />
  }

  const report = reportQuery.data.data

  return (
    <div className="page-stack">
      <section className="page-intro">
        <div>
          <p className="eyebrow">Report detail</p>
          <h1>{report.title}</h1>
          <div className="stack-inline">
            <Badge tone="blue">{report.category}</Badge>
            {report.is_premium ? <Badge tone="gold">Premium download</Badge> : <Badge tone="green">Public download</Badge>}
          </div>
        </div>
      </section>

      <Card>
        <div className="stack-md">
          <p className="lead">{report.summary || report.preview_text || 'Chưa có executive summary.'}</p>
          <p className="muted">{report.description || 'Description đang được cập nhật.'}</p>
          <div className="hero-actions">
            <Button onClick={() => downloadMutation.mutate()} disabled={downloadMutation.isPending}>
              {downloadMutation.isPending ? 'Đang kiểm tra quyền tải...' : 'Download'}
            </Button>
          </div>
          {downloadMutation.isError ? (
            <ErrorState description="Không tải được report. Nếu report là premium, cần session phù hợp với access policy backend." />
          ) : null}
          {downloadMutation.isSuccess ? (
            <div className="success-banner">
              Download reference: {downloadMutation.data.data.download_url || downloadMutation.data.data.storage_path || 'Không có download reference'}
            </div>
          ) : null}
        </div>
      </Card>
    </div>
  )
}
