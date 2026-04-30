import { apiClient } from '../../lib/api/http'
import type {
  CertificationApplyPayload,
  CertificationDetailData,
  CertificationDirectoryItem,
  CertificationReviewPayload,
  CertificationUpgradePayload,
  PaginationMeta,
} from '../../lib/api/types'

export function getCertificationDirectory(params: {
  page?: number
  page_size?: number
  province?: string
  organizationType?: string
  primaryIndustrySector?: string
  certificationLevel?: string
} = {}) {
  return apiClient.get<CertificationDirectoryItem[], PaginationMeta>('/api/certification/directory', {
    query: params,
  })
}

export function getCertificationDetail(enterpriseId: number) {
  return apiClient.get<CertificationDetailData>(`/api/certification/${enterpriseId}`)
}

export function applyCertification(payload: CertificationApplyPayload) {
  return apiClient.post<CertificationDetailData>('/api/certification/apply', payload)
}

export function reviewCertification(applicationId: number, payload: CertificationReviewPayload) {
  return apiClient.put<CertificationDetailData>(`/api/certification/${applicationId}/review`, payload)
}

export function upgradeCertification(certificationId: number, payload: CertificationUpgradePayload) {
  return apiClient.put<CertificationDetailData>(`/api/certification/${certificationId}/upgrade`, payload)
}
