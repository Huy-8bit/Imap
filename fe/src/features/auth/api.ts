import { apiClient } from '../../lib/api/http'
import type { ApiEnvelope, AuthTokenData, AuthUserProfile } from '../../lib/api/types'

export const authApi = {
  login(payload: { email: string; password: string }) {
    return apiClient.post<AuthTokenData>('/api/auth/login', payload, { auth: false, retry: false })
  },
  register(payload: {
    email: string
    password: string
    full_name?: string
    tax_code?: string
  }) {
    return apiClient.post<AuthTokenData>('/api/auth/register', payload, { auth: false, retry: false })
  },
  refresh(refreshToken: string): Promise<ApiEnvelope<AuthTokenData>> {
    return apiClient.post<AuthTokenData>(
      '/api/auth/refresh',
      { refresh_token: refreshToken },
      { auth: false, retry: false },
    )
  },
  logout(refreshToken?: string) {
    return apiClient.post<{ revoked: boolean }>(
      '/api/auth/logout',
      refreshToken ? { refresh_token: refreshToken } : undefined,
    )
  },
  me() {
    return apiClient.get<AuthUserProfile>('/api/auth/me')
  },
}
