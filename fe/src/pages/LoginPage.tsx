import { useCallback, useState } from 'react'
import { useLocation, useNavigate } from 'react-router-dom'

import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { Field, Input } from '../components/ui/Field'
import { ErrorState } from '../components/ui/States'
import { GoogleSignInButton } from '../features/auth/GoogleSignInButton'
import { getDefaultAuthRedirectPath, useAuth } from '../lib/auth/auth'

export function LoginPage() {
  const { login, loginWithGoogle } = useAuth()
  const navigate = useNavigate()
  const location = useLocation()
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const destination = (location.state as { from?: string } | null)?.from

  const finishLogin = useCallback(
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
        .then(finishLogin)
        .catch((submissionError: unknown) => {
          setError(submissionError instanceof Error ? submissionError.message : 'Đăng nhập Google thất bại')
        })
        .finally(() => {
          setIsSubmitting(false)
        })
    },
    [finishLogin, loginWithGoogle],
  )

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
                const user = await login({ email, password })
                finishLogin(user)
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
          <div className="auth-divider">
            <span>Hoặc</span>
          </div>
          <GoogleSignInButton
            disabled={isSubmitting}
            onCredential={handleGoogleCredential}
            onError={setError}
          />
        </div>
      </Card>
    </div>
  )
}
