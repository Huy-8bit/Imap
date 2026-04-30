import { useState } from 'react'
import { useMutation, useQuery } from '@tanstack/react-query'

import { Badge } from '../components/ui/Badge'
import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { Field, Input, Select, Textarea } from '../components/ui/Field'
import { EmptyState, ErrorState, LoadingState } from '../components/ui/States'
import {
  getCertificationDetail,
  reviewCertification,
  upgradeCertification,
} from '../features/certification/api'
import { getTaxonomies } from '../features/taxonomies/api'

export function AdminCertificationsPage() {
  const [enterpriseIdInput, setEnterpriseIdInput] = useState('1')
  const [reviewPayload, setReviewPayload] = useState({
    action: 'approve' as 'approve' | 'reject' | 'request_changes' | 'comment',
    comment: '',
    publicNote: '',
  })
  const [upgradePayload, setUpgradePayload] = useState({
    levelCode: 'gold',
    status: 'active',
    publicNote: '',
    directoryVisible: true,
    expiresAt: '',
    reason: '',
  })

  const enterpriseId = Number(enterpriseIdInput)

  const taxonomiesQuery = useQuery({
    queryKey: ['taxonomies', 'admin-certifications'],
    queryFn: getTaxonomies,
  })
  const certificationQuery = useQuery({
    queryKey: ['admin', 'certification-detail', enterpriseId],
    queryFn: () => getCertificationDetail(enterpriseId),
    enabled: Number.isFinite(enterpriseId) && enterpriseId > 0,
  })

  const reviewMutation = useMutation({
    mutationFn: (applicationId: number) => reviewCertification(applicationId, reviewPayload),
    onSuccess: () => void certificationQuery.refetch(),
  })
  const upgradeMutation = useMutation({
    mutationFn: (certificationId: number) =>
      upgradeCertification(certificationId, {
        ...upgradePayload,
        expiresAt: upgradePayload.expiresAt || null,
      }),
    onSuccess: () => void certificationQuery.refetch(),
  })

  const latestApplication = certificationQuery.data?.data.applications[0]
  const currentCertification = certificationQuery.data?.data.current

  return (
    <div className="page-stack">
      <Card>
        <Field label="Enterprise ID">
          <Input value={enterpriseIdInput} onChange={(event) => setEnterpriseIdInput(event.target.value)} />
        </Field>
      </Card>

      <Card>
        <h2>Certification detail</h2>
        {certificationQuery.isLoading ? (
          <LoadingState />
        ) : certificationQuery.isError ? (
          <ErrorState description="Không tải được certification detail." onRetry={() => void certificationQuery.refetch()} />
        ) : certificationQuery.data ? (
          <div className="stack-md">
            {currentCertification ? (
              <div className="stack-sm">
                <div className="stack-inline">
                  {currentCertification.certification_level ? <Badge tone="gold">{currentCertification.certification_level.display_name}</Badge> : null}
                  <Badge tone="green">{currentCertification.status}</Badge>
                </div>
                <p className="muted">{currentCertification.public_note || 'No public note.'}</p>
              </div>
            ) : (
              <EmptyState title="No current certification" description="Enterprise này chưa có current certification record." />
            )}

            {latestApplication ? (
              <div className="stack-sm">
                <h3>Latest application #{latestApplication.id}</h3>
                <p className="muted">{latestApplication.status}</p>
              </div>
            ) : null}
          </div>
        ) : null}
      </Card>

      <div className="card-grid">
        <Card>
          <h2>Review application</h2>
          {latestApplication ? (
            <form
              className="stack-md"
              onSubmit={(event) => {
                event.preventDefault()
                reviewMutation.mutate(latestApplication.id)
              }}
            >
              <Field label="Action">
                <Select
                  value={reviewPayload.action}
                  onChange={(event) =>
                    setReviewPayload((current) => ({
                      ...current,
                      action: event.target.value as typeof reviewPayload.action,
                    }))
                  }
                >
                  <option value="approve">approve</option>
                  <option value="reject">reject</option>
                  <option value="request_changes">request_changes</option>
                  <option value="comment">comment</option>
                </Select>
              </Field>
              <Field label="Comment">
                <Textarea value={reviewPayload.comment} onChange={(event) => setReviewPayload((current) => ({ ...current, comment: event.target.value }))} />
              </Field>
              <Field label="Public note">
                <Textarea value={reviewPayload.publicNote} onChange={(event) => setReviewPayload((current) => ({ ...current, publicNote: event.target.value }))} />
              </Field>
              {reviewMutation.isError ? <ErrorState description="Không review được application." /> : null}
              <Button type="submit" disabled={reviewMutation.isPending}>
                {reviewMutation.isPending ? 'Đang review...' : 'Submit review'}
              </Button>
            </form>
          ) : (
            <EmptyState title="No application" description="Enterprise này chưa có application để review." />
          )}
        </Card>

        <Card>
          <h2>Upgrade certification</h2>
          {currentCertification ? (
            <form
              className="stack-md"
              onSubmit={(event) => {
                event.preventDefault()
                upgradeMutation.mutate(currentCertification.id)
              }}
            >
              <Field label="Level">
                <Select
                  value={upgradePayload.levelCode}
                  onChange={(event) => setUpgradePayload((current) => ({ ...current, levelCode: event.target.value }))}
                >
                  {(taxonomiesQuery.data?.data.taxonomies.certification_levels || []).map((item) => (
                    <option key={item.code} value={item.code}>
                      {item.display_name}
                    </option>
                  ))}
                </Select>
              </Field>
              <Field label="Status">
                <Input value={upgradePayload.status} onChange={(event) => setUpgradePayload((current) => ({ ...current, status: event.target.value }))} />
              </Field>
              <Field label="Public note">
                <Textarea value={upgradePayload.publicNote} onChange={(event) => setUpgradePayload((current) => ({ ...current, publicNote: event.target.value }))} />
              </Field>
              <Field label="Expires at">
                <Input type="datetime-local" value={upgradePayload.expiresAt} onChange={(event) => setUpgradePayload((current) => ({ ...current, expiresAt: event.target.value }))} />
              </Field>
              <Field label="Reason">
                <Textarea value={upgradePayload.reason} onChange={(event) => setUpgradePayload((current) => ({ ...current, reason: event.target.value }))} />
              </Field>
              <label className="toggle-row">
                <input
                  type="checkbox"
                  checked={upgradePayload.directoryVisible}
                  onChange={(event) =>
                    setUpgradePayload((current) => ({
                      ...current,
                      directoryVisible: event.target.checked,
                    }))
                  }
                />
                Directory visible
              </label>
              {upgradeMutation.isError ? <ErrorState description="Không upgrade được certification." /> : null}
              <Button type="submit" disabled={upgradeMutation.isPending}>
                {upgradeMutation.isPending ? 'Đang upgrade...' : 'Submit upgrade'}
              </Button>
            </form>
          ) : (
            <EmptyState title="No certification record" description="Cần current certification record để dùng endpoint upgrade." />
          )}
        </Card>
      </div>
    </div>
  )
}
