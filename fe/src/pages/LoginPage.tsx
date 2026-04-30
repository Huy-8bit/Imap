import { useState } from 'react'
import { useLocation, useNavigate } from 'react-router-dom'

import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { Field, Input } from '../components/ui/Field'
import { ErrorState } from '../components/ui/States'
import { useAuth } from '../lib/auth/auth'

export function LoginPage() {
  const { login } = useAuth()
  const navigate = useNavigate()
  const location = useLocation()
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const destination = (location.state as { from?: string } | null)?.from || '/assessment'

  return (
    <div className="auth-page">
      <Card className="auth-card">
        <div className="stack-md">
          <div>
            <p className="eyebrow">Login</p>
            <h1>Đăng nhập enterprise workspace</h1>
          </div>
          <form
            className="stack-md"
            onSubmit={async (event) => {
              event.preventDefault()
              setError(null)
              setIsSubmitting(true)
              try {
                await login({ email, password })
                navigate(destination, { replace: true })
              } catch (submissionError) {
                setError(submissionError instanceof Error ? submissionError.message : 'Đăng nhập thất bại')
              } finally {
                setIsSubmitting(false)
              }
            }}
          >
            <Field label="Email">
              <Input value={email} onChange={(event) => setEmail(event.target.value)} type="email" required />
            </Field>
            <Field label="Password">
              <Input value={password} onChange={(event) => setPassword(event.target.value)} type="password" required />
            </Field>
            {error ? <ErrorState description={error} /> : null}
            <Button type="submit" disabled={isSubmitting}>
              {isSubmitting ? 'Đang đăng nhập...' : 'Login'}
            </Button>
          </form>
        </div>
      </Card>
    </div>
  )
}
