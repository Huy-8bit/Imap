import { apiClient } from '../../lib/api/http'
import type {
  AssessmentDraftInput,
  AssessmentHistoryItem,
  AssessmentPillarQuestionGroup,
  AssessmentResultData,
  AssessmentSubmitPayload,
  AssessmentV2Detail,
  PaginationMeta,
} from '../../lib/api/types'

// ── Legacy assessment (assessment_submissions table) ──────────────────────

export function getAssessmentQuestions() {
  return apiClient.get<AssessmentPillarQuestionGroup[], { pillar_count: number }>('/api/assessment/questions', {
    auth: false,
  })
}

export function submitAssessment(payload: AssessmentSubmitPayload) {
  return apiClient.post<AssessmentResultData>('/api/assessment/submit', payload)
}

export function getAssessmentResults(enterpriseId: number) {
  return apiClient.get<AssessmentResultData>(`/api/assessment/${enterpriseId}/results`)
}

export function getAssessmentHistory(enterpriseId: number, page = 1) {
  return apiClient.get<AssessmentHistoryItem[], PaginationMeta>(`/api/assessment/${enterpriseId}/history`, {
    query: { page, page_size: 20 },
  })
}

// ── Assessment v2 (assessments table — /api/v1/assessments) ──────────────

export function getAssessmentV2(assessmentId: number) {
  return apiClient.get<AssessmentV2Detail>(`/api/v1/assessments/${assessmentId}`)
}

// Auto-save draft — gọi khi người dùng pause nhập
export function saveAssessmentDraft(assessmentId: number, payload: AssessmentDraftInput) {
  return apiClient.request<AssessmentV2Detail>(
    `/api/v1/assessments/${assessmentId}`,
    { method: 'PATCH', body: payload },
  )
}
