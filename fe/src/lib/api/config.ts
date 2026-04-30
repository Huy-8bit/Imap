const DEFAULT_API_BASE_URL = 'http://127.0.0.1:8010'

export const apiConfig = {
  baseUrl: (import.meta.env.VITE_API_BASE_URL || DEFAULT_API_BASE_URL).replace(/\/$/, ''),
}
