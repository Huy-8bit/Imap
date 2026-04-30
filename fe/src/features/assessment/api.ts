import { apiClient } from '../../lib/api/http'
import type {
  AssessmentHistoryItem,
  AssessmentPillarQuestionGroup,
  AssessmentResultData,
  AssessmentSubmitPayload,
  PaginationMeta,
} from '../../lib/api/types'

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
