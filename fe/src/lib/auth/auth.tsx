import type { PropsWithChildren } from 'react'
import { createContext, useContext, useEffect, useMemo, useRef, useState } from 'react'
import type { QueryClient } from '@tanstack/react-query'
import { Navigate, useLocation } from 'react-router-dom'

import { authApi } from '../../features/auth/api'
import type { ApiEnvelope, AuthTokenData, AuthTokens, AuthUserProfile } from '../api/types'
import { apiClient } from '../api/http'

interface AuthContextValue {
  user: AuthUserProfile | null
  tokens: AuthTokens | null
  status: 'loading' | 'authenticated' | 'guest'
  login: (payload: { email: string; password: string }) => Promise<AuthUserProfile>
  loginWithGoogle: (credential: string) => Promise<AuthUserProfile>
  register: (payload: {
    email: string
    password: string
    full_name?: string
    tax_code?: string
  }) => Promise<AuthUserProfile>
  logout: () => Promise<void>
  refreshSession: () => Promise<string | null>
  reloadProfile: () => Promise<AuthUserProfile>
  isAdmin: boolean
  isEnterprise: boolean
}

const AUTH_STORAGE_KEY = 'imapvietnam.auth'
const ACCESS_TOKEN_REFRESH_LEAD_MS = 60_000
const ACCESS_TOKEN_REFRESH_MIN_DELAY_MS = 5_000

const AuthContext = createContext<AuthContextValue | null>(null)

function readStoredTokens(): AuthTokens | null {
  const raw = window.localStorage.getItem(AUTH_STORAGE_KEY)
  if (!raw) {
    return null
  }
  try {
    return JSON.parse(raw) as AuthTokens
  } catch {
    window.localStorage.removeItem(AUTH_STORAGE_KEY)
    return null
  }
}

function toStoredTokens(data: AuthTokenData): AuthTokens {
  return {
    accessToken: data.access_token,
    refreshToken: data.refresh_token,
    accessExpiresAt: data.access_expires_at,
    refreshExpiresAt: data.refresh_expires_at,
  }
}

function persistTokens(tokens: AuthTokens | null) {
  if (!tokens) {
    window.localStorage.removeItem(AUTH_STORAGE_KEY)
    return
  }
  window.localStorage.setItem(AUTH_STORAGE_KEY, JSON.stringify(tokens))
}

export function AuthProvider({
  children,
  queryClient,
}: PropsWithChildren<{ queryClient: QueryClient }>) {
  const [tokens, setTokens] = useState<AuthTokens | null>(() => readStoredTokens())
  const [user, setUser] = useState<AuthUserProfile | null>(null)
  const [status, setStatus] = useState<'loading' | 'authenticated' | 'guest'>('loading')
  const tokensRef = useRef<AuthTokens | null>(tokens)
  const refreshTimeoutRef = useRef<number | null>(null)

  useEffect(() => {
    tokensRef.current = tokens
    persistTokens(tokens)
  }, [tokens])

  function applyTokens(nextTokens: AuthTokens | null) {
    tokensRef.current = nextTokens
    persistTokens(nextTokens)
    setTokens(nextTokens)
  }

  function clearSessionState() {
    applyTokens(null)
    setUser(null)
    setStatus('guest')
    queryClient.clear()
  }

  function clearRefreshTimer() {
    if (refreshTimeoutRef.current !== null) {
      window.clearTimeout(refreshTimeoutRef.current)
      refreshTimeoutRef.current = null
    }
  }

  useEffect(() => {
    apiClient.setAuthAdapter({
      getAccessToken: () => tokensRef.current?.accessToken || null,
      getRefreshToken: () => tokensRef.current?.refreshToken || null,
      refreshTokens: async () => {
        const currentRefreshToken = tokensRef.current?.refreshToken
        if (!currentRefreshToken) {
          return null
        }
        const envelope = await authApi.refresh(currentRefreshToken)
        const nextTokens = toStoredTokens(envelope.data)
        applyTokens(nextTokens)
        return nextTokens.accessToken
      },
      clearSession: () => {
        clearSessionState()
      },
    })

    return () => {
      apiClient.setAuthAdapter(undefined)
    }
  }, [queryClient])

  useEffect(() => {
    let cancelled = false

    async function bootstrap() {
      if (!tokensRef.current) {
        if (!cancelled) {
          setStatus('guest')
        }
        return
      }

      try {
        const me = await authApi.me()
        if (!cancelled) {
          setUser(me.data)
          setStatus('authenticated')
        }
      } catch {
        if (!cancelled) {
          clearSessionState()
        }
      }
    }

    void bootstrap()
    return () => {
      cancelled = true
    }
  }, [])

  useEffect(() => {
    clearRefreshTimer()

    if (!tokens?.accessExpiresAt) {
      return
    }

    const accessExpiresAt = new Date(tokens.accessExpiresAt).getTime()
    if (Number.isNaN(accessExpiresAt)) {
      return
    }

    const refreshDelay = accessExpiresAt - Date.now() - ACCESS_TOKEN_REFRESH_LEAD_MS
    if (refreshDelay <= 0) {
      void refreshSession()
      return
    }

    refreshTimeoutRef.current = window.setTimeout(() => {
      void refreshSession()
    }, Math.max(refreshDelay, ACCESS_TOKEN_REFRESH_MIN_DELAY_MS))

    return () => {
      clearRefreshTimer()
    }
  }, [tokens?.accessExpiresAt])

  async function establishSession(envelope: ApiEnvelope<AuthTokenData, unknown>) {
    const nextTokens = toStoredTokens(envelope.data)
    applyTokens(nextTokens)
    const me = await authApi.me()
    setUser(me.data)
    setStatus('authenticated')
    queryClient.clear()
    return me.data
  }

  async function login(payload: { email: string; password: string }) {
    const envelope = await authApi.login(payload)
    return establishSession(envelope)
  }

  async function loginWithGoogle(credential: string) {
    const envelope = await authApi.loginWithGoogle({ credential })
    return establishSession(envelope)
  }

  async function register(payload: {
    email: string
    password: string
    full_name?: string
    tax_code?: string
  }) {
    const envelope = await authApi.register(payload)
    return establishSession(envelope)
  }

  async function logout() {
    try {
      if (tokensRef.current) {
        await authApi.logout(tokensRef.current.refreshToken)
      }
    } finally {
      clearSessionState()
    }
  }

  async function refreshSession() {
    const refreshToken = tokensRef.current?.refreshToken
    if (!refreshToken) {
      return null
    }
    try {
      const envelope = await authApi.refresh(refreshToken)
      const nextTokens = toStoredTokens(envelope.data)
      applyTokens(nextTokens)
      return nextTokens.accessToken
    } catch {
      clearSessionState()
      return null
    }
  }

  async function reloadProfile() {
    const me = await authApi.me()
    setUser(me.data)
    setStatus('authenticated')
    return me.data
  }

  const value = useMemo<AuthContextValue>(
    () => ({
      user,
      tokens,
      status,
      login,
      loginWithGoogle,
      register,
      logout,
      refreshSession,
      reloadProfile,
      isAdmin: user?.role === 'admin',
      isEnterprise: user?.role === 'enterprise' || user?.role === 'admin',
    }),
    [status, tokens, user],
  )

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}

// eslint-disable-next-line react-refresh/only-export-components
export function useAuth() {
  const context = useContext(AuthContext)
  if (!context) {
    throw new Error('useAuth must be used within AuthProvider')
  }
  return context
}

// eslint-disable-next-line react-refresh/only-export-components
export function getDefaultAuthRedirectPath(user: Pick<AuthUserProfile, 'role'>) {
  return user.role === 'admin' ? '/admin' : '/assessment'
}

export function RequireGuest({ children }: PropsWithChildren) {
  const { status, user } = useAuth()

  if (status === 'loading') {
    return <div className="page-message">Đang kiểm tra phiên đăng nhập...</div>
  }
  if (status === 'authenticated' && user) {
    return <Navigate to={getDefaultAuthRedirectPath(user)} replace />
  }
  return <>{children}</>
}

export function RequireEnterprise({ children }: PropsWithChildren) {
  const { status, isEnterprise } = useAuth()
  const location = useLocation()

  if (status === 'loading') {
    return <div className="page-message">Đang kiểm tra phiên đăng nhập...</div>
  }
  if (!isEnterprise) {
    return <Navigate to="/login" replace state={{ from: location.pathname }} />
  }
  return <>{children}</>
}

export function RequireAdmin({ children }: PropsWithChildren) {
  const { status, isAdmin } = useAuth()
  const location = useLocation()

  if (status === 'loading') {
    return <div className="page-message">Đang kiểm tra quyền truy cập...</div>
  }
  if (!isAdmin) {
    return <Navigate to="/login" replace state={{ from: location.pathname }} />
  }
  return <>{children}</>
}
