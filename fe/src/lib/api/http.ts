import { apiConfig } from './config'
import { ApiError } from './errors'
import type { ApiEnvelope } from './types'

interface AuthAdapter {
  getAccessToken: () => string | null
  getRefreshToken: () => string | null
  refreshTokens: () => Promise<string | null>
  clearSession: () => void
}

interface RequestOptions {
  auth?: boolean
  retry?: boolean
  query?: object
}

class ApiClient {
  private authAdapter?: AuthAdapter
  private refreshPromise: Promise<string | null> | null = null

  setAuthAdapter(adapter?: AuthAdapter) {
    this.authAdapter = adapter
  }

  async get<T, M = unknown>(path: string, options: RequestOptions = {}) {
    return this.request<T, M>(path, { method: 'GET' }, options)
  }

  async post<T, M = unknown>(path: string, body?: unknown, options: RequestOptions = {}) {
    return this.request<T, M>(path, { method: 'POST', body }, options)
  }

  async put<T, M = unknown>(path: string, body?: unknown, options: RequestOptions = {}) {
    return this.request<T, M>(path, { method: 'PUT', body }, options)
  }

  async delete<T, M = unknown>(path: string, options: RequestOptions = {}) {
    return this.request<T, M>(path, { method: 'DELETE' }, options)
  }

  async request<T, M = unknown>(
    path: string,
    init: Omit<RequestInit, 'body'> & { body?: unknown } = {},
    options: RequestOptions = {},
  ): Promise<ApiEnvelope<T, M>> {
    const authEnabled = options.auth ?? true
    const shouldRetry = options.retry ?? true
    const { body: rawBody, ...requestInit } = init
    const headers = new Headers(init.headers)
    const token = authEnabled ? this.authAdapter?.getAccessToken() : null

    headers.set('Accept', 'application/json')
    if (token) {
      headers.set('Authorization', `Bearer ${token}`)
    }

    let body: BodyInit | undefined
    if (rawBody !== undefined) {
      headers.set('Content-Type', 'application/json')
      body = JSON.stringify(rawBody)
    }

    const response = await fetch(this.buildUrl(path, options.query), {
      ...requestInit,
      headers,
      body,
    })

    const payload = (await response.json().catch(() => null)) as ApiEnvelope<T, M> | null

    if ((response.status === 401 || response.status === 403) && authEnabled && shouldRetry) {
      const refreshed = await this.tryRefresh()
      if (refreshed) {
        return this.request<T, M>(path, init, { ...options, retry: false })
      }
    }

    if (!response.ok || payload?.success === false || payload === null) {
      if (response.status === 401 || response.status === 403) {
        this.authAdapter?.clearSession()
      }
      throw new ApiError(payload?.message || response.statusText || 'Request failed', response.status, payload)
    }

    return payload
  }

  private buildUrl(path: string, query?: object) {
    const url = new URL(path, apiConfig.baseUrl)
    if (query) {
      Object.entries(query as Record<string, unknown>).forEach(([key, value]) => {
        if (
          value !== undefined &&
          value !== null &&
          value !== '' &&
          ['string', 'number', 'boolean'].includes(typeof value)
        ) {
          url.searchParams.set(key, String(value))
        }
      })
    }
    return url.toString()
  }

  private async tryRefresh() {
    const refreshToken = this.authAdapter?.getRefreshToken()
    if (!this.authAdapter || !refreshToken) {
      return null
    }

    if (this.refreshPromise) {
      return this.refreshPromise
    }

    this.refreshPromise = this.authAdapter
      .refreshTokens()
      .catch(() => null)
      .finally(() => {
        this.refreshPromise = null
      })

    return this.refreshPromise
  }
}

export const apiClient = new ApiClient()
