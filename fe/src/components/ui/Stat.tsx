import { formatNumber } from '../../lib/utils/format'

export function StatCard({
  label,
  value,
  accent,
}: {
  label: string
  value: number | string
  accent?: 'green' | 'gold'
}) {
  return (
    <div className={`stat-card${accent ? ` stat-card-${accent}` : ''}`}>
      <div className="stat-value">{typeof value === 'number' ? formatNumber(value) : value}</div>
      <div className="stat-label">{label}</div>
    </div>
  )
}
