import {
  PolarAngleAxis,
  PolarGrid,
  Radar,
  RadarChart,
  ResponsiveContainer,
} from 'recharts'

import type { EnterpriseRadarData } from '../../lib/api/types'
import { EmptyState } from '../ui/States'

function hasRenderableRadar(data: EnterpriseRadarData) {
  return data.pillars.some((item) => item.score !== null)
}

export function RadarScoreCard({
  data,
  title = 'Impactonomy snapshot',
}: {
  data: EnterpriseRadarData
  title?: string
}) {
  if (!data.has_data) {
    return (
      <EmptyState
        title={title}
        description="Doanh nghiệp này chưa có assessment snapshot công khai."
      />
    )
  }

  if (!hasRenderableRadar(data)) {
    return (
      <EmptyState
        title={title}
        description="Snapshot đã tồn tại nhưng điểm trụ cột chưa có business-final score để hiển thị."
      />
    )
  }

  return (
    <div className="radar-card">
      <div className="radar-header">
        <div>
          <p className="eyebrow">Assessment snapshot</p>
          <h3>{title}</h3>
        </div>
        <div className="score-pill">{data.overall_score ? `${Math.round(data.overall_score)}/100` : 'N/A'}</div>
      </div>
      <div className="radar-shell">
        <ResponsiveContainer width="100%" height={260}>
          <RadarChart
            cx="50%"
            cy="50%"
            outerRadius="72%"
            data={data.pillars.map((item) => ({
              name: item.pillar_name,
              score: item.score,
            }))}
          >
            <PolarGrid stroke="#d8d6c8" />
            <PolarAngleAxis dataKey="name" tick={{ fill: '#46504d', fontSize: 12 }} />
            <Radar dataKey="score" fill="#0d8d67" fillOpacity={0.28} stroke="#0d8d67" />
          </RadarChart>
        </ResponsiveContainer>
      </div>
    </div>
  )
}
