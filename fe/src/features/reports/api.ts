import { apiClient } from '../../lib/api/http'
import type {
  CustomAnalysisCreatePayload,
  CustomAnalysisRequestItem,
  CustomAnalysisUpdatePayload,
  DueDiligenceReportData,
  PaginationMeta,
  ReportDetail,
  ReportDownloadData,
  ReportPayload,
  ReportSummary,
  SroiReportData,
} from '../../lib/api/types'

export function getReports(params: { page?: number; page_size?: number; category?: string } = {}) {
  return apiClient.get<ReportSummary[], PaginationMeta>('/api/reports', { query: params })
}

export function getReportDetail(reportId: number) {
  return apiClient.get<ReportDetail>(`/api/reports/${reportId}`)
}

export function downloadReport(reportId: number) {
  return apiClient.get<ReportDownloadData>(`/api/reports/${reportId}/download`)
}

export function createReport(payload: ReportPayload) {
  return apiClient.post<ReportDetail>('/api/reports', payload)
}

export function getProvinceReport() {
  return apiClient.get<Array<{ bucket_code: string; bucket_name: string; organization_count: number; mappable_count: number }>, { matched_total: number; bucket_count: number; group_by: string }>(
    '/api/reports/province',
  )
}

export function getSectorReport() {
  return apiClient.get<Array<{ bucket_code: string; bucket_name: string; organization_count: number; mappable_count: number }>, { matched_total: number; bucket_count: number; group_by: string }>(
    '/api/reports/sector',
  )
}

export function getDueDiligenceReport() {
  return apiClient.get<DueDiligenceReportData, { matched_total: number; returned_total: number }>(
    '/api/reports/due-dil',
  )
}

export function getSroiReport() {
  return apiClient.get<SroiReportData, { matched_total: number; cell_count: number }>('/api/reports/sroi')
}

export function createCustomRequest(payload: CustomAnalysisCreatePayload) {
  return apiClient.post<CustomAnalysisRequestItem>('/api/reports/custom-request', payload)
}

export function getCustomRequests(status?: string) {
  return apiClient.get<CustomAnalysisRequestItem[], PaginationMeta>('/api/reports/custom-request', {
    query: { status, page: 1, page_size: 50 },
  })
}

export function updateCustomRequest(requestId: number, payload: CustomAnalysisUpdatePayload) {
  return apiClient.put<CustomAnalysisRequestItem>(`/api/reports/custom-request/${requestId}`, payload)
}
