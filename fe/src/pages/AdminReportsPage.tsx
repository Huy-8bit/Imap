import { useMutation, useQuery } from '@tanstack/react-query'
import { useState } from 'react'

import { Badge } from '../components/ui/Badge'
import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { Field, Input, Textarea } from '../components/ui/Field'
import { EmptyState, ErrorState, LoadingState } from '../components/ui/States'
import { createReport, getReports } from '../features/reports/api'
import type { ReportPayload } from '../lib/api/types'

const initialForm: ReportPayload = {
  title: '',
  category: 'general',
  summary: '',
  description: '',
  status: 'published',
  isPremium: false,
  downloadUrl: '',
  storagePath: '',
}

export function AdminReportsPage() {
  const [form, setForm] = useState<ReportPayload>(initialForm)

  const reportsQuery = useQuery({
    queryKey: ['admin', 'reports'],
    queryFn: () => getReports({ page: 1, page_size: 50 }),
  })
  const createMutation = useMutation({
    mutationFn: () => createReport(form),
    onSuccess: () => {
      setForm(initialForm)
      void reportsQuery.refetch()
    },
  })

  return (
    <div className="page-stack">
      <Card>
        <h2>Report catalog</h2>
        {reportsQuery.isLoading ? (
          <LoadingState />
        ) : reportsQuery.isError ? (
          <ErrorState description="Không tải được report list." onRetry={() => void reportsQuery.refetch()} />
        ) : reportsQuery.data?.data.length ? (
          <div className="history-list">
            {reportsQuery.data.data.map((report) => (
              <div key={report.id} className="history-item">
                <div className="stack-inline">
                  <strong>{report.title}</strong>
                  {report.is_premium ? <Badge tone="gold">Premium</Badge> : <Badge tone="green">Public</Badge>}
                </div>
                <p className="muted">{report.category}</p>
              </div>
            ))}
          </div>
        ) : (
          <EmptyState title="No reports" description="Catalog đang trống." />
        )}
      </Card>

      <Card>
        <h2>Create report</h2>
        <form
          className="form-grid"
          onSubmit={(event) => {
            event.preventDefault()
            createMutation.mutate()
          }}
        >
          <Field label="Title">
            <Input value={form.title || ''} onChange={(event) => setForm((current) => ({ ...current, title: event.target.value }))} required />
          </Field>
          <Field label="Category">
            <Input value={form.category || 'general'} onChange={(event) => setForm((current) => ({ ...current, category: event.target.value }))} />
          </Field>
          <Field label="Slug">
            <Input value={form.slug || ''} onChange={(event) => setForm((current) => ({ ...current, slug: event.target.value }))} />
          </Field>
          <Field label="Download URL">
            <Input value={form.downloadUrl || ''} onChange={(event) => setForm((current) => ({ ...current, downloadUrl: event.target.value }))} />
          </Field>
          <Field label="Storage path">
            <Input value={form.storagePath || ''} onChange={(event) => setForm((current) => ({ ...current, storagePath: event.target.value }))} />
          </Field>
          <Field label="Status">
            <Input value={form.status || 'published'} onChange={(event) => setForm((current) => ({ ...current, status: event.target.value }))} />
          </Field>
          <div className="form-grid-span">
            <Field label="Summary">
              <Textarea value={form.summary || ''} onChange={(event) => setForm((current) => ({ ...current, summary: event.target.value }))} />
            </Field>
          </div>
          <div className="form-grid-span">
            <Field label="Description">
              <Textarea value={form.description || ''} onChange={(event) => setForm((current) => ({ ...current, description: event.target.value }))} />
            </Field>
          </div>
          <label className="toggle-row form-grid-span">
            <input
              type="checkbox"
              checked={Boolean(form.isPremium)}
              onChange={(event) => setForm((current) => ({ ...current, isPremium: event.target.checked }))}
            />
            Premium download
          </label>
          {createMutation.isError ? <ErrorState description="Không tạo được report." /> : null}
          {createMutation.isSuccess ? <div className="success-banner">Report đã được tạo.</div> : null}
          <div className="form-grid-span">
            <Button type="submit" disabled={createMutation.isPending}>
              {createMutation.isPending ? 'Đang tạo...' : 'Create report'}
            </Button>
          </div>
        </form>
      </Card>
    </div>
  )
}
