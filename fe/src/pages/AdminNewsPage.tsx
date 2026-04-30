import { useEffect, useState } from 'react'
import { useMutation, useQuery } from '@tanstack/react-query'

import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { Field, Input, Textarea } from '../components/ui/Field'
import { EmptyState, ErrorState, LoadingState } from '../components/ui/States'
import { createNews, deleteNews, getNews, updateNews } from '../features/content/api'
import type { NewsArticle, NewsPayload } from '../lib/api/types'

const initialNewsForm: NewsPayload = {
  title: '',
  summary: '',
  body: '',
  tags: [],
  status: 'published',
}

export function AdminNewsPage() {
  const [selected, setSelected] = useState<NewsArticle | null>(null)
  const [form, setForm] = useState<NewsPayload>(initialNewsForm)
  const newsQuery = useQuery({
    queryKey: ['admin', 'news'],
    queryFn: () => getNews({ page: 1, page_size: 50 }),
  })

  useEffect(() => {
    if (selected) {
      setForm({
        title: selected.title,
        slug: selected.slug,
        summary: selected.summary,
        body: selected.body,
        cover_image_url: selected.cover_image_url,
        tags: selected.tags,
        status: selected.status,
        published_at: selected.published_at,
      })
    }
  }, [selected])

  const saveMutation = useMutation({
    mutationFn: () => (selected ? updateNews(selected.id, form) : createNews(form)),
    onSuccess: () => {
      setSelected(null)
      setForm(initialNewsForm)
      void newsQuery.refetch()
    },
  })
  const deleteMutation = useMutation({
    mutationFn: (articleId: number) => deleteNews(articleId),
    onSuccess: () => void newsQuery.refetch(),
  })

  return (
    <div className="page-stack">
      <Card>
        <div className="section-header compact">
          <div>
            <h2>News list</h2>
          </div>
        </div>
        {newsQuery.isLoading ? (
          <LoadingState />
        ) : newsQuery.isError ? (
          <ErrorState description="Không tải được news list." onRetry={() => void newsQuery.refetch()} />
        ) : newsQuery.data?.data.length ? (
          <div className="history-list">
            {newsQuery.data.data.map((article) => (
              <div key={article.id} className="history-item">
                <strong>{article.title}</strong>
                <p className="muted">{article.summary || 'No summary'}</p>
                <div className="hero-actions">
                  <Button variant="secondary" size="sm" onClick={() => setSelected(article)}>
                    Edit
                  </Button>
                  <Button variant="danger" size="sm" onClick={() => deleteMutation.mutate(article.id)}>
                    Delete
                  </Button>
                </div>
              </div>
            ))}
          </div>
        ) : (
          <EmptyState title="No news articles" description="Admin chưa có article nào ngoài seed." />
        )}
      </Card>

      <Card>
        <div className="section-header compact">
          <div>
            <h2>{selected ? `Edit #${selected.id}` : 'Create article'}</h2>
          </div>
        </div>
        <form
          className="form-grid"
          onSubmit={(event) => {
            event.preventDefault()
            saveMutation.mutate()
          }}
        >
          <Field label="Title">
            <Input value={form.title || ''} onChange={(event) => setForm((current) => ({ ...current, title: event.target.value }))} required />
          </Field>
          <Field label="Slug">
            <Input value={form.slug || ''} onChange={(event) => setForm((current) => ({ ...current, slug: event.target.value }))} />
          </Field>
          <div className="form-grid-span">
            <Field label="Summary">
              <Textarea value={form.summary || ''} onChange={(event) => setForm((current) => ({ ...current, summary: event.target.value }))} />
            </Field>
          </div>
          <div className="form-grid-span">
            <Field label="Body">
              <Textarea value={form.body || ''} onChange={(event) => setForm((current) => ({ ...current, body: event.target.value }))} />
            </Field>
          </div>
          <Field label="Tags (comma separated)">
            <Input
              value={(form.tags || []).join(', ')}
              onChange={(event) =>
                setForm((current) => ({
                  ...current,
                  tags: event.target.value
                    .split(',')
                    .map((item) => item.trim())
                    .filter(Boolean),
                }))
              }
            />
          </Field>
          <Field label="Status">
            <Input value={form.status || 'published'} onChange={(event) => setForm((current) => ({ ...current, status: event.target.value }))} />
          </Field>
          {saveMutation.isError ? <ErrorState description="Không lưu được article." /> : null}
          <div className="form-grid-span hero-actions">
            <Button type="submit" disabled={saveMutation.isPending}>
              {saveMutation.isPending ? 'Đang lưu...' : selected ? 'Update article' : 'Create article'}
            </Button>
            {selected ? (
              <Button
                type="button"
                variant="ghost"
                onClick={() => {
                  setSelected(null)
                  setForm(initialNewsForm)
                }}
              >
                Clear selection
              </Button>
            ) : null}
          </div>
        </form>
      </Card>
    </div>
  )
}
