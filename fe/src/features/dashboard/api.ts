import { apiClient } from '../../lib/api/http'
import type {
  DashboardGrowthBucket,
  DashboardImpactFlowCell,
  DashboardMeta,
  DashboardOrganizationTypeBucket,
  DashboardProvinceBucket,
  DashboardSectorBucket,
  EnterpriseFilterParams,
  StatsOverviewData,
} from '../../lib/api/types'

export function getStatsOverview(params: EnterpriseFilterParams = {}) {
  return apiClient.get<StatsOverviewData, { cache_ttl_seconds: number }>('/api/stats/overview', {
    query: params,
  })
}

export function getDashboardByProvince(params: EnterpriseFilterParams = {}) {
  return apiClient.get<DashboardProvinceBucket[], DashboardMeta>('/api/dashboard/by-province', {
    query: params,
  })
}

export function getDashboardBySector(params: EnterpriseFilterParams = {}) {
  return apiClient.get<DashboardSectorBucket[], DashboardMeta>('/api/dashboard/by-sector', {
    query: params,
  })
}

export function getDashboardByOrganizationType(params: EnterpriseFilterParams = {}) {
  return apiClient.get<DashboardOrganizationTypeBucket[], DashboardMeta>(
    '/api/dashboard/by-organization-type',
    { query: params },
  )
}

export function getDashboardGrowth(params: EnterpriseFilterParams & { yearFrom?: number; yearTo?: number } = {}) {
  return apiClient.get<DashboardGrowthBucket[], DashboardMeta>('/api/dashboard/growth', { query: params })
}

export function getDashboardImpactFlows(params: EnterpriseFilterParams & { limit?: number } = {}) {
  return apiClient.get<DashboardImpactFlowCell[], DashboardMeta>('/api/dashboard/impact-flows', {
    query: params,
  })
}
