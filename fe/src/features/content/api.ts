import { apiClient } from '../../lib/api/http'
import type {
  IidAboutPage,
  IidAboutPayload,
  IidPartner,
  IidTeamMember,
  NewsArticle,
  NewsPayload,
  PaginationMeta,
} from '../../lib/api/types'

export function getNews(params: { page?: number; page_size?: number; tag?: string } = {}) {
  return apiClient.get<NewsArticle[], PaginationMeta>('/api/news', { query: params })
}

export function createNews(payload: NewsPayload) {
  return apiClient.post<NewsArticle>('/api/news', payload)
}

export function updateNews(articleId: number, payload: NewsPayload) {
  return apiClient.put<NewsArticle>(`/api/news/${articleId}`, payload)
}

export function deleteNews(articleId: number) {
  return apiClient.delete<{ deleted: boolean }>(`/api/news/${articleId}`)
}

export function getIidAbout() {
  return apiClient.get<IidAboutPage>('/api/iid/about')
}

export function updateIidAbout(payload: IidAboutPayload) {
  return apiClient.put<IidAboutPage>('/api/iid/about', payload)
}

export function getIidTeam() {
  return apiClient.get<IidTeamMember[], { total: number }>('/api/iid/team')
}

export function getIidPartners() {
  return apiClient.get<IidPartner[], { total: number }>('/api/iid/partners')
}
