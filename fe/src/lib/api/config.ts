const DEFAULT_API_BASE_URL = 'http://127.0.0.1:8010'

function resolveBaseUrl(): string {
  const envUrl = import.meta.env.VITE_API_BASE_URL as string | undefined
  // Empty string → đang chạy trong Docker với nginx proxy → dùng window.location.origin
  if (!envUrl) {
    return typeof window !== 'undefined' ? window.location.origin : DEFAULT_API_BASE_URL
  }
  return envUrl.replace(/\/$/, '')
}

export const apiConfig = {
  baseUrl: resolveBaseUrl(),
  googleClientId: import.meta.env.VITE_GOOGLE_CLIENT_ID || '',
}
