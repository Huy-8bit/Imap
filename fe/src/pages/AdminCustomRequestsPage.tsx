import { useMutation, useQuery } from '@tanstack/react-query'

import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { EmptyState, ErrorState, LoadingState } from '../components/ui/States'
import { getCustomRequests, updateCustomRequest } from '../features/reports/api'

export function AdminCustomRequestsPage() {
  const requestsQuery = useQuery({
    queryKey: ['admin', 'custom-requests'],
    queryFn: () => getCustomRequests(),
  })
  const updateMutation = useMutation({
    mutationFn: ({ requestId, status }: { requestId: number; status: string }) =>
      updateCustomRequest(requestId, { status }),
    onSuccess: () => void requestsQuery.refetch(),
  })

  return (
    <div className="page-stack">
      <Card>
        <h2>Custom analysis requests</h2>
        {requestsQuery.isLoading ? (
          <LoadingState />
        ) : requestsQuery.isError ? (
          <ErrorState description="Không tải được custom requests." onRetry={() => void requestsQuery.refetch()} />
        ) : requestsQuery.data?.data.length ? (
          <div className="history-list">
            {requestsQuery.data.data.map((request) => (
              <div key={request.id} className="history-item">
                <strong>{request.subject}</strong>
                <p className="muted">
                  {request.requester_name} · {request.requester_email} · {request.status}
                </p>
                <p className="small-note">{request.brief || 'Không có brief.'}</p>
                <div className="hero-actions">
                  {['submitted', 'in_review', 'quoted', 'closed'].map((status) => (
                    <Button
                      key={status}
                      variant="secondary"
                      size="sm"
                      onClick={() => updateMutation.mutate({ requestId: request.id, status })}
                    >
                      {status}
                    </Button>
                  ))}
                </div>
              </div>
            ))}
          </div>
        ) : (
          <EmptyState title="No custom requests" description="Chưa có request nào cần xử lý." />
        )}
      </Card>
    </div>
  )
}
