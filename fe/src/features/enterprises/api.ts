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
  MapPinFeature,
  MapPinMeta,
  OrgClaimData,
  OrgClaimInput,
  OrgFullProfile,
  OrganizationSelfRegistrationPayload,
  OrganizationUpsertData,
  PaginationMeta,
} from '../../lib/api/types'

// ── Catalog (v1 primary, deprecated /enterprises paths giữ backward compat) ─

export function getEnterprises(params: EnterpriseListParams = {}) {
  return apiClient.get<EnterpriseListItem[], PaginationMeta>('/api/v1/orgs', { query: params })
}

// search được gộp vào GET /api/v1/orgs qua q param — không còn route /search riêng
export function searchEnterprises(q: string, page = 1) {
  return apiClient.get<EnterpriseListItem[], PaginationMeta>('/api/v1/orgs', {
    query: { q, page, page_size: 12 },
  })
}

export function getFeaturedEnterprises(limit = 5) {
  return apiClient.get<EnterpriseFeaturedItem[], { total: number; limit: number }>(
    '/api/v1/orgs/featured',
    { query: { limit } },
  )
}

export function getEnterpriseDetail(enterpriseId: number) {
  return apiClient.get<EnterpriseDetail>(`/api/v1/orgs/${enterpriseId}`)
}

export function getEnterpriseQuick(enterpriseId: number) {
  return apiClient.get<EnterpriseQuickInfo>(`/api/v1/orgs/${enterpriseId}/quick`)
}

export function getEnterpriseRadar(enterpriseId: number) {
  return apiClient.get<EnterpriseRadarData>(`/api/v1/orgs/${enterpriseId}/radar`)
}

// Full profile — yêu cầu investor hoặc admin JWT
export function getOrgFull(enterpriseId: number) {
  return apiClient.get<OrgFullProfile>(`/api/v1/orgs/${enterpriseId}/full`)
}

// Claim org — yêu cầu enterprise JWT
export function claimOrg(enterpriseId: number, payload: OrgClaimInput = {}) {
  return apiClient.post<OrgClaimData>(`/api/v1/orgs/${enterpriseId}/claim`, payload)
}

export function selfRegisterEnterprise(payload: OrganizationSelfRegistrationPayload) {
  return apiClient.post<OrganizationUpsertData>('/api/v1/orgs/self-registration', payload)
}

// ── Map endpoints ─────────────────────────────────────────────────────────

// Lean pin endpoint — fast initial load, trả toàn bộ pin không có filter
export function getMapPins() {
  return apiClient.get<{ type: 'FeatureCollection'; features: MapPinFeature[] }, MapPinMeta>(
    '/api/v1/map/pins',
    { auth: false },
  )
}

// Full map — hỗ trợ filter + bbox
export function getMapEnterprises(params: EnterpriseFilterParams & { bbox?: string } = {}) {
  return apiClient.get<{ type: 'FeatureCollection'; features: EnterpriseMapFeature[] }, EnterpriseMapMeta>(
    '/api/map/enterprises',
    { query: params },
  )
}
