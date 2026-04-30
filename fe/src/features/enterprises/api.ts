import { apiClient } from '../../lib/api/http'
import type {
  EnterpriseDetail,
  EnterpriseFeaturedItem,
  EnterpriseFilterParams,
  EnterpriseListItem,
  EnterpriseListParams,
  EnterpriseMapFeature,
  EnterpriseMapMeta,
  EnterpriseQuickInfo,
  EnterpriseRadarData,
  PaginationMeta,
} from '../../lib/api/types'

export function getEnterprises(params: EnterpriseListParams = {}) {
  return apiClient.get<EnterpriseListItem[], PaginationMeta>('/api/enterprises', { query: params })
}

export function searchEnterprises(q: string, page = 1) {
  return apiClient.get<EnterpriseListItem[], PaginationMeta>('/api/enterprises/search', {
    query: { q, page, page_size: 12 },
  })
}

export function getFeaturedEnterprises(limit = 5) {
  return apiClient.get<EnterpriseFeaturedItem[], { total: number; limit: number }>('/api/enterprises/featured', {
    query: { limit },
  })
}

export function getEnterpriseDetail(enterpriseId: number) {
  return apiClient.get<EnterpriseDetail>(`/api/enterprises/${enterpriseId}`)
}

export function getEnterpriseQuick(enterpriseId: number) {
  return apiClient.get<EnterpriseQuickInfo>(`/api/enterprises/${enterpriseId}/quick`)
}

export function getEnterpriseRadar(enterpriseId: number) {
  return apiClient.get<EnterpriseRadarData>(`/api/enterprises/${enterpriseId}/radar`)
}

export function getMapEnterprises(params: EnterpriseFilterParams & { bbox?: string } = {}) {
  return apiClient.get<{ type: 'FeatureCollection'; features: EnterpriseMapFeature[] }, EnterpriseMapMeta>(
    '/api/map/enterprises',
    { query: params },
  )
}
