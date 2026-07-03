import { apiClient } from '../../lib/api/http'
import type {
  DashboardGrowthBucket,
  DashboardImpactFlowCell,
  DashboardMeta,
  DashboardOrganizationTypeBucket,
  DashboardProvinceBucket,
  DashboardSectorBucket,
  EnterpriseFilterParams,
  InsightsMeta,
  InsightsSummaryData,
  StatsOverviewData,
} from '../../lib/api/types'

// ── Insights (versioned, richer breakdown) ────────────────────────────────

export function getInsightsSummary(params: EnterpriseFilterParams = {}) {
  return apiClient.get<InsightsSummaryData, InsightsMeta>('/api/v1/insights/summary', {
    query: params,
    auth: false,
  })
}

// ── Stats Overview (legacy, giữ backward compat) ─────────────────────────

export function getStatsOverview(params: EnterpriseFilterParams = {}) {
  return apiClient.get<StatsOverviewData, { cache_ttl_seconds: number }>('/api/stats/overview', {
    query: params,
    auth: false,
  })
}

// ── Dashboard breakdowns ───────────────────────────────────────────────────

export function getDashboardByProvince(params: EnterpriseFilterParams = {}) {
  return apiClient.get<DashboardProvinceBucket[], DashboardMeta>('/api/dashboard/by-province', {
    query: params,
    auth: false,
  })
}

export function getDashboardBySector(params: EnterpriseFilterParams = {}) {
  return apiClient.get<DashboardSectorBucket[], DashboardMeta>('/api/dashboard/by-sector', {
    query: params,
    auth: false,
  })
}

export function getDashboardByOrganizationType(params: EnterpriseFilterParams = {}) {
  return apiClient.get<DashboardOrganizationTypeBucket[], DashboardMeta>(
    '/api/dashboard/by-organization-type',
    { query: params, auth: false },
  )
}

export function getDashboardGrowth(params: EnterpriseFilterParams & { yearFrom?: number; yearTo?: number } = {}) {
  return apiClient.get<DashboardGrowthBucket[], DashboardMeta>('/api/dashboard/growth', {
    query: params,
    auth: false,
  })
}

export function getDashboardImpactFlows(params: EnterpriseFilterParams & { limit?: number } = {}) {
  return apiClient.get<DashboardImpactFlowCell[], DashboardMeta>('/api/dashboard/impact-flows', {
    query: params,
    auth: false,
  })
}
