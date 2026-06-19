import { apiClient } from '../../lib/api/http'
import type {
  AdminQueueData,
  CertIssueData,
  CertIssueInput,
  ScoreOverrideData,
  ScoreOverrideInput,
} from '../../lib/api/types'

export function getAdminQueue() {
  return apiClient.get<AdminQueueData>('/api/v1/admin/queue')
}

export function overrideOrgScore(orgId: number, payload: ScoreOverrideInput) {
  return apiClient.post<ScoreOverrideData>(`/api/v1/admin/orgs/${orgId}/score`, payload)
}

export function issueCertification(orgId: number, payload: CertIssueInput) {
  return apiClient.post<CertIssueData>(`/api/v1/admin/certifications/${orgId}`, payload)
}

export function approveSecondCertification(orgId: number) {
  return apiClient.post<CertIssueData>(`/api/v1/admin/certifications/${orgId}/approve-second`)
}
