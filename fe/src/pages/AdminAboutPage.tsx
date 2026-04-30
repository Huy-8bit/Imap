import { useEffect, useState } from 'react'
import { useMutation, useQuery } from '@tanstack/react-query'

import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { Field, Input, Textarea } from '../components/ui/Field'
import { ErrorState, LoadingState } from '../components/ui/States'
import { getIidAbout, updateIidAbout } from '../features/content/api'
import type { IidAboutPayload } from '../lib/api/types'

export function AdminAboutPage() {
  const [form, setForm] = useState<IidAboutPayload>({
    title: '',
    summary: '',
    body: '',
    status: 'published',
  })

  const aboutQuery = useQuery({
    queryKey: ['admin', 'about'],
    queryFn: getIidAbout,
  })

  useEffect(() => {
    if (aboutQuery.data) {
      setForm({
        title: aboutQuery.data.data.title,
        summary: aboutQuery.data.data.summary,
        body: aboutQuery.data.data.body,
        status: aboutQuery.data.data.status,
      })
    }
  }, [aboutQuery.data])

  const updateMutation = useMutation({
    mutationFn: () => updateIidAbout(form),
    onSuccess: () => void aboutQuery.refetch(),
  })

  return (
    <div className="page-stack">
      <Card>
        <h2>Edit About IID</h2>
        {aboutQuery.isLoading ? (
          <LoadingState />
        ) : (
          <form
            className="form-grid"
            onSubmit={(event) => {
              event.preventDefault()
              updateMutation.mutate()
            }}
          >
            <Field label="Title">
              <Input value={form.title} onChange={(event) => setForm((current) => ({ ...current, title: event.target.value }))} required />
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
              <Field label="Body">
                <Textarea value={form.body || ''} onChange={(event) => setForm((current) => ({ ...current, body: event.target.value }))} />
              </Field>
            </div>
            {updateMutation.isError ? <ErrorState description="Không cập nhật được about page." /> : null}
            {updateMutation.isSuccess ? <div className="success-banner">About page đã được cập nhật.</div> : null}
            <div className="form-grid-span">
              <Button type="submit" disabled={updateMutation.isPending}>
                {updateMutation.isPending ? 'Đang cập nhật...' : 'Update about page'}
              </Button>
            </div>
          </form>
        )}
      </Card>
    </div>
  )
}
