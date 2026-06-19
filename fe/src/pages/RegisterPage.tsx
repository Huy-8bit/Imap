import { useCallback, useState } from 'react'
import { useLocation, useNavigate } from 'react-router-dom'

import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { Field, Input } from '../components/ui/Field'
import { ErrorState } from '../components/ui/States'
import { GoogleSignInButton } from '../features/auth/GoogleSignInButton'
import { getDefaultAuthRedirectPath, useAuth } from '../lib/auth/auth'

export function RegisterPage() {
  const { loginWithGoogle, register } = useAuth()
  const navigate = useNavigate()
  const location = useLocation()
  const [form, setForm] = useState({
    email: '',
    password: '',
    full_name: '',
    tax_code: '',
  })
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const destination = (location.state as { from?: string } | null)?.from

  const finishRegistration = useCallback(
    (user: Parameters<typeof getDefaultAuthRedirectPath>[0]) => {
      navigate(destination || getDefaultAuthRedirectPath(user), { replace: true })
    },
    [destination, navigate],
  )

  const handleGoogleCredential = useCallback(
    (credential: string) => {
      setError(null)
      setIsSubmitting(true)
      loginWithGoogle(credential)
        .then(finishRegistration)
        .catch((submissionError: unknown) => {
          setError(submissionError instanceof Error ? submissionError.message : 'Đăng ký bằng Google thất bại')
        })
        .finally(() => {
          setIsSubmitting(false)
        })
    },
    [finishRegistration, loginWithGoogle],
  )

  return (
    <div className="auth-page">
      <Card className="auth-card">
        <div className="stack-md">
          <div>
            <p className="eyebrow">Register</p>
            <h1>Tạo enterprise account</h1>
            <p className="lead">Tạo tài khoản doanh nghiệp để tham gia hệ sinh thái Impactonomy.</p>
          </div>
          <form
            className="stack-md"
            onSubmit={async (event) => {
              event.preventDefault()
              setError(null)
              setIsSubmitting(true)
              try {
                const user = await register(form)
                finishRegistration(user)
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
            <Field label="Mã số thuế" hint="Không bắt buộc. Nhập để hệ thống tự liên kết với hồ sơ doanh nghiệp nếu đã có.">
              <Input value={form.tax_code} onChange={(event) => setForm((current) => ({ ...current, tax_code: event.target.value }))} />
            </Field>
            {error ? <ErrorState description={error} /> : null}
            <Button type="submit" disabled={isSubmitting}>
              {isSubmitting ? 'Đang tạo tài khoản...' : 'Register'}
            </Button>
          </form>
          <div className="auth-divider">
            <span>Hoặc</span>
          </div>
          <GoogleSignInButton
            disabled={isSubmitting}
            text="signup_with"
            onCredential={handleGoogleCredential}
            onError={setError}
          />
        </div>
      </Card>
    </div>
  )
}
