import { useQuery } from '@tanstack/react-query'

import { Card } from '../components/ui/Card'
import { EmptyState, ErrorState, LoadingState } from '../components/ui/States'
import { getIidAbout, getIidPartners, getIidTeam } from '../features/content/api'
import { splitParagraphs } from '../lib/utils/content'

export function AboutPage() {
  const aboutQuery = useQuery({
    queryKey: ['iid', 'about'],
    queryFn: getIidAbout,
  })
  const teamQuery = useQuery({
    queryKey: ['iid', 'team'],
    queryFn: getIidTeam,
  })
  const partnersQuery = useQuery({
    queryKey: ['iid', 'partners'],
    queryFn: getIidPartners,
  })

  return (
    <div className="page-stack">
      <section className="page-intro">
        <div>
          <p className="eyebrow">About IID</p>
          <h1>{aboutQuery.data?.data.title || 'Institute for Innovation and Development'}</h1>
          <p className="lead">{aboutQuery.data?.data.summary || 'IID CMS content đang được lấy trực tiếp từ backend.'}</p>
        </div>
      </section>

      <Card>
        {aboutQuery.isLoading ? (
          <LoadingState />
        ) : aboutQuery.isError ? (
          <ErrorState description="Không tải được about content." onRetry={() => void aboutQuery.refetch()} />
        ) : (
          <div className="rich-copy">
            {splitParagraphs(aboutQuery.data?.data.body).map((paragraph) => (
              <p key={paragraph}>{paragraph}</p>
            ))}
          </div>
        )}
      </Card>

      <div className="card-grid">
        <Card>
          <h2>Team</h2>
          {teamQuery.isLoading ? (
            <LoadingState />
          ) : teamQuery.isError ? (
            <ErrorState description="Không tải được team." onRetry={() => void teamQuery.refetch()} />
          ) : teamQuery.data?.data.length ? (
            <div className="stack-sm">
              {teamQuery.data.data.map((member) => (
                <div key={member.id} className="profile-row">
                  <div>
                    <strong>{member.full_name}</strong>
                    <p className="muted">{member.role_title || 'Role đang cập nhật'}</p>
                  </div>
                </div>
              ))}
            </div>
          ) : (
            <EmptyState title="Chưa có team records" description="Backend IID team endpoint hiện trả rỗng trong dataset local." />
          )}
        </Card>

        <Card>
          <h2>Partners</h2>
          {partnersQuery.isLoading ? (
            <LoadingState />
          ) : partnersQuery.isError ? (
            <ErrorState description="Không tải được partners." onRetry={() => void partnersQuery.refetch()} />
          ) : partnersQuery.data?.data.length ? (
            <div className="stack-sm">
              {partnersQuery.data.data.map((partner) => (
                <div key={partner.id} className="profile-row">
                  <div>
                    <strong>{partner.name}</strong>
                    <p className="muted">{partner.partner_type || 'Partner type đang cập nhật'}</p>
                  </div>
                </div>
              ))}
            </div>
          ) : (
            <EmptyState title="Chưa có partner records" description="Backend IID partners endpoint hiện trả rỗng trong dataset local." />
          )}
        </Card>
      </div>
    </div>
  )
}
