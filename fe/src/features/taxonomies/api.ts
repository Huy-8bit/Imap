import { apiClient } from '../../lib/api/http'
import type { TaxonomyCatalogData } from '../../lib/api/types'

export function getTaxonomies() {
  return apiClient.get<TaxonomyCatalogData>('/api/taxonomies')
}
