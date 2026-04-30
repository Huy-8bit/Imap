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
  register: (payload: {
    email: string
    password: string
    full_name?: string
    tax_code?: string
  }) => Promise<AuthUserProfile>
  logout: () => Promise<void>
  refreshSession: () => Promise<string | null>
  isAdmin: boolean
  isEnterprise: boolean
}

const AUTH_STORAGE_KEY = 'imapvietnam.auth'

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

  useEffect(() => {
    tokensRef.current = tokens
    persistTokens(tokens)
  }, [tokens])

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
        setTokens(nextTokens)
        return nextTokens.accessToken
      },
      clearSession: () => {
        setTokens(null)
        setUser(null)
        setStatus('guest')
        queryClient.clear()
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
          setTokens(null)
          setUser(null)
          setStatus('guest')
        }
      }
    }

    void bootstrap()
    return () => {
      cancelled = true
    }
  }, [])

  async function establishSession(envelope: ApiEnvelope<AuthTokenData, unknown>) {
    const nextTokens = toStoredTokens(envelope.data)
    setTokens(nextTokens)
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
      setTokens(null)
      setUser(null)
      setStatus('guest')
      queryClient.clear()
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
      setTokens(nextTokens)
      return nextTokens.accessToken
    } catch {
      setTokens(null)
      setUser(null)
      setStatus('guest')
      queryClient.clear()
      return null
    }
  }

  const value = useMemo<AuthContextValue>(
    () => ({
      user,
      tokens,
      status,
      login,
      register,
      logout,
      refreshSession,
      isAdmin: user?.role === 'admin',
      isEnterprise: user?.role === 'enterprise' || user?.role === 'admin',
    }),
    [status, tokens, user],
  )

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}

export function useAuth() {
  const context = useContext(AuthContext)
  if (!context) {
    throw new Error('useAuth must be used within AuthProvider')
  }
  return context
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
