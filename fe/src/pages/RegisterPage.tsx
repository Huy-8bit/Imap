import { useState } from 'react'
import { useNavigate } from 'react-router-dom'

import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { Field, Input } from '../components/ui/Field'
import { ErrorState } from '../components/ui/States'
import { useAuth } from '../lib/auth/auth'

export function RegisterPage() {
  const { register } = useAuth()
  const navigate = useNavigate()
  const [form, setForm] = useState({
    email: '',
    password: '',
    full_name: '',
    tax_code: '',
  })
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [error, setError] = useState<string | null>(null)

  return (
    <div className="auth-page">
      <Card className="auth-card">
        <div className="stack-md">
          <div>
            <p className="eyebrow">Register</p>
            <h1>Tạo enterprise account</h1>
            <p className="lead">Nếu `tax_code` khớp dataset hiện có, backend sẽ tự link account vào organization profile.</p>
          </div>
          <form
            className="stack-md"
            onSubmit={async (event) => {
              event.preventDefault()
              setError(null)
              setIsSubmitting(true)
              try {
                await register(form)
                navigate('/assessment', { replace: true })
              } catch (submissionError) {
                setError(submissionError instanceof Error ? submissionError.message : 'Đăng ký thất bại')
              } finally {
                setIsSubmitting(false)
              }
            }}
          >
            <Field label="Full name">
              <Input value={form.full_name} onChange={(event) => setForm((current) => ({ ...current, full_name: event.target.value }))} />
            </Field>
            <Field label="Email">
              <Input value={form.email} onChange={(event) => setForm((current) => ({ ...current, email: event.target.value }))} type="email" required />
            </Field>
            <Field label="Password">
              <Input value={form.password} onChange={(event) => setForm((current) => ({ ...current, password: event.target.value }))} type="password" minLength={8} required />
            </Field>
            <Field label="Tax code" hint="Optional nhưng nên nhập để backend link organization profile thật.">
              <Input value={form.tax_code} onChange={(event) => setForm((current) => ({ ...current, tax_code: event.target.value }))} />
            </Field>
            {error ? <ErrorState description={error} /> : null}
            <Button type="submit" disabled={isSubmitting}>
              {isSubmitting ? 'Đang tạo tài khoản...' : 'Register'}
            </Button>
          </form>
        </div>
      </Card>
    </div>
  )
}
