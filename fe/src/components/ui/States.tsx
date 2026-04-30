import { Button } from './Button'

export function LoadingState({ label = 'Đang tải dữ liệu...' }: { label?: string }) {
  return <div className="state-block state-loading">{label}</div>
}

export function EmptyState({
  title,
  description,
  action,
}: {
  title: string
  description: string
  action?: React.ReactNode
}) {
  return (
    <div className="state-block">
      <h3>{title}</h3>
      <p>{description}</p>
      {action ? <div className="state-actions">{action}</div> : null}
    </div>
  )
}

export function ErrorState({
  title = 'Không tải được dữ liệu',
  description,
  onRetry,
}: {
  title?: string
  description: string
  onRetry?: () => void
}) {
  return (
    <div className="state-block state-error">
      <h3>{title}</h3>
      <p>{description}</p>
      {onRetry ? (
        <div className="state-actions">
          <Button variant="secondary" onClick={onRetry}>
            Thử lại
          </Button>
        </div>
      ) : null}
    </div>
  )
}
