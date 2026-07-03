import { useState } from 'react'
import { useMutation } from '@tanstack/react-query'

import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { Field } from '../components/ui/Field'
import { issueCertification, overrideOrgScore } from '../features/admin/api'

export function AdminScorePage() {
  const [scoreOrgId, setScoreOrgId] = useState('')
  const [scoreValue, setScoreValue] = useState('')
  const [scoreReason, setScoreReason] = useState('')
  const [scoreResult, setScoreResult] = useState<string | null>(null)

  const [certOrgId, setCertOrgId] = useState('')
  const [starRating, setStarRating] = useState('3')
  const [certNotes, setCertNotes] = useState('')
  const [certResult, setCertResult] = useState<string | null>(null)

  const scoreMutation = useMutation({
    mutationFn: () =>
      overrideOrgScore(Number(scoreOrgId), {
        score: Number(scoreValue),
        reason: scoreReason,
      }),
    onSuccess: (data) => {
      setScoreResult(
        `Score org #${data.data.org_id} đã cập nhật: ${data.data.old_score ?? 'null'} → ${data.data.new_score}. Audit ID: ${data.data.audit_id}`,
      )
      setScoreOrgId('')
      setScoreValue('')
      setScoreReason('')
    },
  })

  const certMutation = useMutation({
    mutationFn: () =>
      issueCertification(Number(certOrgId), {
        star_rating: Number(starRating),
        notes: certNotes || null,
      }),
    onSuccess: (data) => {
      const d = data.data
      if (d.requires_second_approval) {
        setCertResult(
          `Certification ★★★★★ org #${d.org_id} đã tạo và đang chờ second approver. Status: ${d.status}`,
        )
      } else {
        setCertResult(
          `Certification ${d.star_rating}★ org #${d.org_id} đã cấp thành công. Audit ID: ${d.audit_id ?? '—'}`,
        )
      }
      setCertOrgId('')
      setCertNotes('')
    },
  })

  return (
    <div className="stack-md">
      <div className="section-header compact">
        <div>
          <p className="eyebrow">Score &amp; Certification</p>
          <h2>Admin overrides</h2>
        </div>
      </div>

      <Card>
        <div className="section-header compact">
          <div>
            <p className="eyebrow">Score override</p>
            <h2>Ghi đè AI Composite Score</h2>
            <p className="section-description">
              Bắt buộc có <strong>reason</strong> ≥ 10 ký tự. Score hợp lệ: 0–39.
            </p>
          </div>
        </div>
        {scoreResult && (
          <div className="success-banner">
            <strong>{scoreResult}</strong>
          </div>
        )}
        <div className="stack-md">
          <div className="inline-form">
            <Field label="Org ID">
              <input
                type="number"
                className="field-input"
                min={1}
                value={scoreOrgId}
                onChange={(e) => setScoreOrgId(e.target.value)}
                placeholder="1"
              />
            </Field>
            <Field label="New score (0–39)">
              <input
                type="number"
                className="field-input"
                min={0}
                max={39}
                step={0.01}
                value={scoreValue}
                onChange={(e) => setScoreValue(e.target.value)}
                placeholder="25.50"
              />
            </Field>
          </div>
          <Field label="Reason (bắt buộc, ≥ 10 ký tự)">
            <textarea
              className="field-input"
              rows={3}
              value={scoreReason}
              onChange={(e) => setScoreReason(e.target.value)}
              placeholder="Lý do cụ thể cho việc ghi đè điểm số..."
            />
          </Field>
          {scoreMutation.isError && (
            <p className="error-text">
              {scoreMutation.error instanceof Error ? scoreMutation.error.message : 'Ghi đè score thất bại.'}
            </p>
          )}
          <Button
            variant="primary"
            onClick={() => scoreMutation.mutate()}
            disabled={
              !scoreOrgId ||
              !scoreValue ||
              scoreReason.length < 10 ||
              scoreMutation.isPending
            }
          >
            {scoreMutation.isPending ? 'Đang xử lý...' : 'Ghi đè score'}
          </Button>
        </div>
      </Card>

      <Card>
        <div className="section-header compact">
          <div>
            <p className="eyebrow">Certification issue</p>
            <h2>Cấp chứng nhận</h2>
            <p className="section-description">
              ★★★★★ (5 sao) sẽ kích hoạt two-person rule — cần second approver phê duyệt riêng trong Admin Queue.
            </p>
          </div>
        </div>
        {certResult && (
          <div className="success-banner">
            <strong>{certResult}</strong>
          </div>
        )}
        <div className="stack-md">
          <div className="inline-form">
            <Field label="Org ID">
              <input
                type="number"
                className="field-input"
                min={1}
                value={certOrgId}
                onChange={(e) => setCertOrgId(e.target.value)}
                placeholder="1"
              />
            </Field>
            <Field label="Star rating (1–5)">
              <select
                className="field-input"
                value={starRating}
                onChange={(e) => setStarRating(e.target.value)}
              >
                <option value="1">1 ★</option>
                <option value="2">2 ★★</option>
                <option value="3">3 ★★★</option>
                <option value="4">4 ★★★★</option>
                <option value="5">5 ★★★★★ (two-person rule)</option>
              </select>
            </Field>
          </div>
          <Field label="Notes (không bắt buộc)">
            <textarea
              className="field-input"
              rows={2}
              value={certNotes}
              onChange={(e) => setCertNotes(e.target.value)}
              placeholder="Public note kèm theo chứng nhận..."
            />
          </Field>
          {certMutation.isError && (
            <p className="error-text">
              {certMutation.error instanceof Error ? certMutation.error.message : 'Cấp chứng nhận thất bại.'}
            </p>
          )}
          <Button
            variant="primary"
            onClick={() => certMutation.mutate()}
            disabled={!certOrgId || certMutation.isPending}
          >
            {certMutation.isPending
              ? 'Đang xử lý...'
              : Number(starRating) === 5
              ? 'Gửi yêu cầu ★★★★★ (two-person rule)'
              : 'Cấp chứng nhận'}
          </Button>
        </div>
      </Card>
    </div>
  )
}
