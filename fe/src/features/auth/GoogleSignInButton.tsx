import { useEffect, useRef } from 'react'

import { Button } from '../../components/ui/Button'
import { apiConfig } from '../../lib/api/config'
import { cn } from '../../lib/utils/cn'

const GOOGLE_IDENTITY_SCRIPT_ID = 'google-identity-services'
const GOOGLE_IDENTITY_SCRIPT_SRC = 'https://accounts.google.com/gsi/client'

let googleIdentityScriptPromise: Promise<void> | null = null

type GoogleButtonText = 'signin_with' | 'signup_with' | 'continue_with'

interface GoogleCredentialResponse {
  credential?: string
  select_by?: string
}

interface GoogleIdentityServices {
  accounts: {
    id: {
      initialize: (options: {
        client_id: string
        callback: (response: GoogleCredentialResponse) => void
        auto_select?: boolean
        ux_mode?: 'popup' | 'redirect'
      }) => void
      renderButton: (
        parent: HTMLElement,
        options: {
          theme?: 'outline' | 'filled_blue' | 'filled_black'
          size?: 'large' | 'medium' | 'small'
          type?: 'standard' | 'icon'
          shape?: 'rectangular' | 'pill' | 'circle' | 'square'
          text?: GoogleButtonText
          logo_alignment?: 'left' | 'center'
          width?: number
          locale?: string
        },
      ) => void
    }
  }
}

declare global {
  interface Window {
    google?: GoogleIdentityServices
  }
}

function loadGoogleIdentityScript() {
  if (window.google?.accounts?.id) {
    return Promise.resolve()
  }

  if (googleIdentityScriptPromise) {
    return googleIdentityScriptPromise
  }

  googleIdentityScriptPromise = new Promise<void>((resolve, reject) => {
    const existingScript = document.getElementById(GOOGLE_IDENTITY_SCRIPT_ID) as HTMLScriptElement | null
    if (existingScript) {
      existingScript.addEventListener('load', () => resolve(), { once: true })
      existingScript.addEventListener('error', () => reject(new Error('Không tải được Google Sign-In')), {
        once: true,
      })
      return
    }

    const script = document.createElement('script')
    script.id = GOOGLE_IDENTITY_SCRIPT_ID
    script.src = GOOGLE_IDENTITY_SCRIPT_SRC
    script.async = true
    script.defer = true
    script.onload = () => resolve()
    script.onerror = () => {
      googleIdentityScriptPromise = null
      reject(new Error('Không tải được Google Sign-In'))
    }
    document.head.appendChild(script)
  })

  return googleIdentityScriptPromise
}

export function GoogleSignInButton({
  disabled = false,
  text = 'signin_with',
  onCredential,
  onError,
}: {
  disabled?: boolean
  text?: GoogleButtonText
  onCredential: (credential: string) => void
  onError: (message: string) => void
}) {
  const buttonRef = useRef<HTMLDivElement | null>(null)
  const fallbackLabel = text === 'signup_with' ? 'Đăng ký với Google' : 'Đăng nhập với Google'

  useEffect(() => {
    if (!apiConfig.googleClientId) {
      return
    }

    let isMounted = true

    loadGoogleIdentityScript()
      .then(() => {
        if (!isMounted || !buttonRef.current || !window.google?.accounts?.id) {
          return
        }

        buttonRef.current.innerHTML = ''
        window.google.accounts.id.initialize({
          client_id: apiConfig.googleClientId,
          callback: (response) => {
            if (response.credential) {
              onCredential(response.credential)
              return
            }
            onError('Google không trả về credential hợp lệ')
          },
          auto_select: false,
          ux_mode: 'popup',
        })
        window.google.accounts.id.renderButton(buttonRef.current, {
          theme: 'outline',
          size: 'large',
          type: 'standard',
          shape: 'pill',
          text,
          logo_alignment: 'left',
          width: Math.min(Math.max(buttonRef.current.offsetWidth || 360, 240), 400),
          locale: 'vi',
        })
      })
      .catch((error: unknown) => {
        if (isMounted) {
          onError(error instanceof Error ? error.message : 'Không tải được Google Sign-In')
        }
      })

    return () => {
      isMounted = false
    }
  }, [onCredential, onError, text])

  if (!apiConfig.googleClientId) {
    return (
      <Button type="button" variant="secondary" block disabled title="Thiếu VITE_GOOGLE_CLIENT_ID">
        {fallbackLabel}
      </Button>
    )
  }

  return (
    <div className={cn('google-signin-frame', disabled && 'is-disabled')}>
      <div ref={buttonRef} />
    </div>
  )
}
