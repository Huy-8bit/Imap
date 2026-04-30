import type { ReactNode } from 'react'
import { useMemo, useState } from 'react'
import { useMutation, useQuery } from '@tanstack/react-query'
import { Link } from 'react-router-dom'

import { Badge } from '../components/ui/Badge'
import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { Field, Input, Select, Textarea } from '../components/ui/Field'
import { EmptyState, ErrorState, LoadingState } from '../components/ui/States'
import {
  createCustomRequest,
  getDueDiligenceReport,
  getProvinceReport,
  getReports,
  getSectorReport,
  getSroiReport,
} from '../features/reports/api'
import { useAuth } from '../lib/auth/auth'
import { formatNumber } from '../lib/utils/format'

export function ReportsPage() {
  const { user } = useAuth()
  const [category, setCategory] = useState('')
  const [form, setForm] = useState({
    requesterName: user?.full_name || '',
    requesterEmail: user?.email || '',
    requesterPhone: '',
    subject: '',
    requestType: 'custom_analysis',
    brief: '',
    desiredDueDate: '',
  })

  const reportsQuery = useQuery({
    queryKey: ['reports', 'list', category],
    queryFn: () => getReports({ category: category || undefined }),
  })
  const provinceReportQuery = useQuery({
    queryKey: ['reports', 'province'],
    queryFn: getProvinceReport,
  })
  const sectorReportQuery = useQuery({
    queryKey: ['reports', 'sector'],
    queryFn: getSectorReport,
  })
  const dueDiligenceQuery = useQuery({
    queryKey: ['reports', 'due-diligence'],
    queryFn: getDueDiligenceReport,
  })
  const sroiQuery = useQuery({
    queryKey: ['reports', 'sroi'],
    queryFn: getSroiReport,
  })
  const customRequestMutation = useMutation({
    mutationFn: () =>
      createCustomRequest({
        ...form,
        desiredDueDate: form.desiredDueDate || undefined,
        enterpriseId: user?.organization?.id || undefined,
      }),
  })

  const categories = useMemo(() => {
    return Array.from(new Set((reportsQuery.data?.data || []).map((report) => report.category)))
  }, [reportsQuery.data?.data])

  return (
    <div className="page-stack">
      <section className="page-intro">
        <div>
          <p className="eyebrow">Reports & analysis</p>
          <h1>Catalog, aggregate previews, and custom requests.</h1>
          <p className="lead">
            Report store dùng metadata thật; due diligence và SROI cards hiển thị raw signals từ backend thay vì formula suy diễn.
          </p>
        </div>
      </section>

      <Card className="filter-card">
        <Field label="Category">
          <Select value={category} onChange={(event) => setCategory(event.target.value)}>
            <option value="">Tất cả</option>
            {categories.map((item) => (
              <option key={item} value={item}>
                {item}
              </option>
            ))}
          </Select>
        </Field>
      </Card>

      {reportsQuery.isLoading ? (
        <LoadingState />
      ) : reportsQuery.isError ? (
        <ErrorState description="Không tải được report catalog." onRetry={() => void reportsQuery.refetch()} />
      ) : reportsQuery.data?.data.length ? (
        <div className="card-grid">
          {reportsQuery.data.data.map((report) => (
            <Card key={report.id}>
              <div className="stack-sm">
                <div className="stack-inline">
                  <Badge tone="blue">{report.category}</Badge>
                  {report.is_premium ? <Badge tone="gold">Premium download</Badge> : <Badge tone="green">Public</Badge>}
                </div>
                <h3>{report.title}</h3>
                <p className="muted">{report.summary || report.preview_text || 'Chưa có executive summary.'}</p>
                <Link to={`/reports/${report.id}`} className="inline-link">
                  Mở report detail
                </Link>
              </div>
            </Card>
          ))}
        </div>
      ) : (
        <EmptyState title="Chưa có report" description="Catalog hiện không có report public nào cho filter này." />
      )}

      <div className="dashboard-grid">
        <AggregateCard title="Province report" query={provinceReportQuery}>
          <div className="stack-sm">
            {provinceReportQuery.data?.data.slice(0, 5).map((bucket) => (
              <div key={bucket.bucket_code} className="metric-row">
                <span>{bucket.bucket_name}</span>
                <strong>{formatNumber(bucket.organization_count)}</strong>
              </div>
            ))}
          </div>
        </AggregateCard>
        <AggregateCard title="Sector report" query={sectorReportQuery}>
          <div className="stack-sm">
            {sectorReportQuery.data?.data.slice(0, 5).map((bucket) => (
              <div key={bucket.bucket_code} className="metric-row">
                <span>{bucket.bucket_name}</span>
                <strong>{formatNumber(bucket.organization_count)}</strong>
              </div>
            ))}
          </div>
        </AggregateCard>
        <AggregateCard title="Due diligence preview" query={dueDiligenceQuery}>
          <div className="stack-sm">
            <p className="muted">
              Matched organizations: {formatNumber(dueDiligenceQuery.data?.meta.matched_total || 0)}
            </p>
            {(dueDiligenceQuery.data?.data.enterprises || []).slice(0, 4).map((enterprise) => (
              <div key={enterprise.id} className="metric-row">
                <span>{enterprise.display_name}</span>
                <strong>{enterprise.province?.display_name || 'N/A'}</strong>
              </div>
            ))}
          </div>
        </AggregateCard>
        <AggregateCard title="SROI" query={sroiQuery}>
          {sroiQuery.data?.data.metric_available ? (
            <div>Formula available</div>
          ) : (
            <EmptyState
              title="Raw signals only"
              description={sroiQuery.data?.data.message || 'IID chưa cung cấp SROI formula final.'}
            />
          )}
        </AggregateCard>
      </div>

      <Card>
        <div className="section-header compact">
          <div>
            <p className="eyebrow">Custom analysis</p>
            <h2>Request a custom analysis</h2>
          </div>
        </div>
        <form
          className="form-grid"
          onSubmit={(event) => {
            event.preventDefault()
            customRequestMutation.mutate()
          }}
        >
          <Field label="Requester name">
            <Input
              value={form.requesterName}
              onChange={(event) => setForm((current) => ({ ...current, requesterName: event.target.value }))}
              required
            />
          </Field>
          <Field label="Requester email">
            <Input
              type="email"
              value={form.requesterEmail}
              onChange={(event) => setForm((current) => ({ ...current, requesterEmail: event.target.value }))}
              required
            />
          </Field>
          <Field label="Phone">
            <Input
              value={form.requesterPhone}
              onChange={(event) => setForm((current) => ({ ...current, requesterPhone: event.target.value }))}
            />
          </Field>
          <Field label="Request type">
            <Select
              value={form.requestType}
              onChange={(event) => setForm((current) => ({ ...current, requestType: event.target.value }))}
            >
              <option value="custom_analysis">custom_analysis</option>
              <option value="due_diligence">due_diligence</option>
              <option value="sector_study">sector_study</option>
            </Select>
          </Field>
          <Field label="Subject">
            <Input value={form.subject} onChange={(event) => setForm((current) => ({ ...current, subject: event.target.value }))} required />
          </Field>
          <Field label="Desired due date">
            <Input
              type="date"
              value={form.desiredDueDate}
              onChange={(event) => setForm((current) => ({ ...current, desiredDueDate: event.target.value }))}
            />
          </Field>
          <div className="form-grid-span">
            <Field label="Brief">
              <Textarea
                value={form.brief}
                onChange={(event) => setForm((current) => ({ ...current, brief: event.target.value }))}
                placeholder="Mô tả ngắn về câu hỏi nghiên cứu, phạm vi, hoặc đối tượng quan tâm."
              />
            </Field>
          </div>
          {customRequestMutation.isError ? <ErrorState description="Không gửi được custom request." /> : null}
          {customRequestMutation.isSuccess ? (
            <div className="success-banner">Custom request đã được gửi thành công.</div>
          ) : null}
          <div className="form-grid-span">
            <Button type="submit" disabled={customRequestMutation.isPending}>
              {customRequestMutation.isPending ? 'Đang gửi...' : 'Submit custom request'}
            </Button>
          </div>
        </form>
      </Card>
    </div>
  )
}

function AggregateCard({
  title,
  query,
  children,
}: {
  title: string
  query: {
    isLoading: boolean
    isError: boolean
    refetch: () => Promise<unknown>
    data?: unknown
  }
  children: ReactNode
}) {
  return (
    <Card>
      <div className="section-header compact">
        <div>
          <h2>{title}</h2>
        </div>
      </div>
      {query.isLoading ? <LoadingState /> : query.isError ? <ErrorState description={`Không tải được ${title}.`} onRetry={() => void query.refetch()} /> : children}
    </Card>
  )
}
