export interface ApiEnvelope<T, M = unknown> {
  success: boolean
  message: string
  data: T
  meta: M
}

export interface PaginationMeta {
  total: number
  page: number
  page_size: number
  total_pages: number
  sort: string | null
  order: string | null
  query: string | null
}

export interface TaxonomyItem {
  id: number
  code: string
  display_name: string
  display_name_en?: string | null
  display_name_vi?: string | null
  sort_order: number
  metadata: Record<string, unknown>
}

export interface TaxonomyCatalogData {
  taxonomies: Record<string, TaxonomyItem[]>
}

export interface TaxonomySummary {
  id: number
  code: string
  display_name: string
}

export interface EnterpriseFilterParams {
  province?: string
  operationalStatus?: string
  organizationType?: string
  primaryIndustrySector?: string
  hasPositiveSocialImpact?: boolean
  environmentalImpactArea?: string
}

export interface EnterpriseListParams extends EnterpriseFilterParams {
  page?: number
  page_size?: number
  sort?: 'name' | 'foundedYear' | 'createdAt' | 'updatedAt'
  order?: 'asc' | 'desc'
}

export interface EnterpriseListItem {
  id: number
  external_code: string | null
  display_name: string
  trade_name: string | null
  registered_name: string | null
  founded_year: number | null
  province: TaxonomySummary | null
  ward_name: string | null
  operational_status: TaxonomySummary | null
  organization_type: TaxonomySummary | null
  primary_industry_sector: TaxonomySummary | null
  environmental_impact_areas: TaxonomySummary[]
  has_positive_social_impact: boolean | null
  impact_entity_type: TaxonomySummary | null
  star_rating: number | null
  is_featured: boolean
  website: string | null
  location_precision: string | null
  source_status: string
}

export interface EnterpriseDetail {
  id: number
  external_code: string | null
  display_name: string
  source_status: string
  is_featured: boolean
  created_at: string
  updated_at: string
  general: {
    trade_name: string | null
    registered_name: string | null
    founded_year: number | null
    tax_code: string | null
    operational_status: TaxonomySummary | null
    closed_year: number | null
  }
  classification: {
    organization_type: TaxonomySummary | null
    primary_industry_sector: TaxonomySummary | null
    other_industry_sectors: TaxonomySummary[]
    environmental_impact_areas: TaxonomySummary[]
    has_positive_social_impact: boolean | null
    primary_product_type: TaxonomySummary | null
    other_product_type: TaxonomySummary | null
    impact_entity_type: TaxonomySummary | null
    star_rating: number | null
  }
  contacts: {
    website: string | null
    email: string | null
    phone: string | null
  }
  location: {
    province: TaxonomySummary | null
    ward_name: string | null
    full_address: string | null
    latitude: number | null
    longitude: number | null
    location_precision: string | null
    geocode_source: string | null
  }
}

export interface EnterpriseRadarData {
  enterprise_id: number
  has_data: boolean
  overall_score: number | null
  scoring_version: string | null
  scored_at: string | null
  pillars: Array<{
    pillar_code: string
    pillar_name: string
    score: number | null
  }>
}

export interface EnterpriseQuickInfo {
  id: number
  external_code: string | null
  display_name: string
  trade_name: string | null
  registered_name: string | null
  province: TaxonomySummary | null
  full_address: string | null
  website: string | null
  organization_type: TaxonomySummary | null
  operational_status: TaxonomySummary | null
  location_precision: string | null
  radar: EnterpriseRadarData
}

export interface EnterpriseFeaturedItem {
  id: number
  external_code: string | null
  display_name: string
  trade_name: string | null
  registered_name: string | null
  province: TaxonomySummary | null
  organization_type: TaxonomySummary | null
  primary_industry_sector: TaxonomySummary | null
  star_rating: number | null
  website: string | null
  is_featured: boolean
}

export interface MapBoundingBox {
  min_longitude: number
  min_latitude: number
  max_longitude: number
  max_latitude: number
}

export interface EnterpriseMapFeature {
  type: 'Feature'
  geometry: {
    type: 'Point'
    coordinates: [number, number]
  }
  properties: {
    id: number
    external_code: string | null
    display_name: string
    trade_name: string | null
    registered_name: string | null
    province: TaxonomySummary | null
    operational_status: TaxonomySummary | null
    organization_type: TaxonomySummary | null
    primary_industry_sector: TaxonomySummary | null
    has_positive_social_impact: boolean | null
    environmental_impact_areas: TaxonomySummary[]
    star_rating: number | null
    location_precision: string | null
    website: string | null
  }
}

export interface EnterpriseMapMeta {
  matched_total: number
  mappable_total: number
  unmapped_total: number
  returned_total: number
  bbox: MapBoundingBox | null
}

export interface StatsOverviewData {
  total_organizations: number
  active_organizations: number
  provinces_count: number
  social_impact_organizations: number
  environmental_impact_organizations: number
  mappable_organizations: number
}

export interface DashboardProvinceBucket {
  province_code: string
  province_name: string
  organization_count: number
  mappable_count: number
}

export interface DashboardSectorBucket {
  primary_industry_sector_code: string
  primary_industry_sector_name: string
  organization_count: number
  mappable_count: number
}

export interface DashboardOrganizationTypeBucket {
  organization_type_code: string
  organization_type_name: string
  organization_count: number
  mappable_count: number
}

export interface DashboardGrowthBucket {
  founded_year: number
  total_count: number
  active_count: number
  inactive_count: number
  social_impact_count: number
}

export interface DashboardImpactFlowCell {
  primary_industry_sector: TaxonomySummary | null
  environmental_impact_area: TaxonomySummary | null
  province: TaxonomySummary | null
  organization_type: TaxonomySummary | null
  organization_count: number
  social_impact_count: number
  mappable_count: number
}

export interface DashboardMeta {
  matched_total: number
  bucket_count?: number
  year_count?: number
  cell_count?: number
  group_by?: string
  filters_applied?: Record<string, string | boolean | number>
  cache_hit?: boolean
  cache_ttl_seconds?: number
}

export interface LinkedOrganizationSummary {
  id: number | null
  external_code: string | null
  display_name: string | null
  tax_code: string | null
  link_status: string | null
}

export interface AuthTokenData {
  access_token: string
  refresh_token: string
  token_type: 'bearer'
  access_expires_at: string
  refresh_expires_at: string
}

export interface AuthUserProfile {
  id: number
  email: string
  full_name: string | null
  role: string
  status: string
  organization: LinkedOrganizationSummary | null
  last_login_at: string | null
  created_at: string
}

export interface AuthTokens {
  accessToken: string
  refreshToken: string
  accessExpiresAt: string
  refreshExpiresAt: string
}

export interface AssessmentPillarItem {
  id: number
  code: string
  display_name: string
  description: string | null
  sort_order: number
}

export interface AssessmentQuestionOptionItem {
  id: number
  code: string
  label: string
  weight: number | null
  sort_order: number
}

export interface AssessmentQuestionItem {
  id: number
  code: string
  prompt: string
  help_text: string | null
  question_type: string
  is_required: boolean
  sort_order: number
  config: Record<string, unknown>
  options: AssessmentQuestionOptionItem[]
}

export interface AssessmentPillarQuestionGroup {
  pillar: AssessmentPillarItem
  questions: AssessmentQuestionItem[]
}

export interface AssessmentResultData {
  enterprise_id: number
  latest_submission_id: number | null
  has_data: boolean
  overall_score: number | null
  scoring_version: string | null
  scored_at: string | null
  pillars: Array<{
    pillar_code: string
    pillar_name: string
    score: number | null
  }>
  summary: Record<string, unknown>
}

export interface AssessmentHistoryItem {
  submission_id: number
  status: string
  overall_score: number | null
  scoring_version: string
  submitted_at: string
  notes: string | null
}

export interface AssessmentAnswerInput {
  question_id: number
  selected_option_ids?: number[]
  text_value?: string | null
  number_value?: number | null
  boolean_value?: boolean | null
}

export interface AssessmentSubmitPayload {
  enterpriseId?: number
  notes?: string
  answers: AssessmentAnswerInput[]
}

export interface CertificationDirectoryItem {
  organization_id: number
  external_code: string | null
  display_name: string
  province: TaxonomySummary | null
  organization_type: TaxonomySummary | null
  primary_industry_sector: TaxonomySummary | null
  certification_level: TaxonomySummary | null
  certification_status: string
  issued_at: string | null
  expires_at: string | null
  directory_visible: boolean
}

export interface CertificationDocument {
  id: number
  document_type: string
  title: string
  file_name: string | null
  file_url: string | null
  storage_path: string | null
  created_at: string
}

export interface CertificationApplicationSummary {
  id: number
  requested_level: TaxonomySummary | null
  status: string
  application_note: string | null
  review_note: string | null
  submitted_at: string
  decided_at: string | null
  documents: CertificationDocument[]
}

export interface CertificationCurrentRecord {
  id: number
  certification_level: TaxonomySummary | null
  status: string
  directory_visible: boolean
  issued_at: string | null
  expires_at: string | null
  public_note: string | null
}

export interface CertificationDetailData {
  enterprise_id: number
  current: CertificationCurrentRecord | null
  applications: CertificationApplicationSummary[]
}

export interface CertificationApplyPayload {
  enterpriseId?: number
  requestedLevelCode?: string | null
  applicationNote?: string | null
  documents?: Array<{
    document_type: string
    title: string
    file_name?: string | null
    file_url?: string | null
    storage_path?: string | null
    metadata?: Record<string, unknown>
  }>
  metadata?: Record<string, unknown>
}

export interface CertificationReviewPayload {
  action: 'approve' | 'reject' | 'request_changes' | 'comment'
  comment?: string | null
  publicNote?: string | null
}

export interface CertificationUpgradePayload {
  levelCode: string
  status?: string
  publicNote?: string | null
  directoryVisible?: boolean
  expiresAt?: string | null
  reason?: string | null
}

export interface NewsArticle {
  id: number
  slug: string
  title: string
  summary: string | null
  body: string | null
  cover_image_url: string | null
  tags: string[]
  status: string
  published_at: string | null
  created_at: string
  updated_at: string
}

export interface NewsPayload {
  title: string
  slug?: string | null
  summary?: string | null
  body?: string | null
  cover_image_url?: string | null
  tags?: string[]
  status?: string
  published_at?: string | null
  metadata?: Record<string, unknown>
}

export interface IidAboutPage {
  slug: string
  title: string
  summary: string | null
  body: string | null
  status: string
  updated_at: string | null
}

export interface IidAboutPayload {
  title: string
  summary?: string | null
  body?: string | null
  status?: string
  metadata?: Record<string, unknown>
}

export interface IidTeamMember {
  id: number
  full_name: string
  role_title: string | null
  biography: string | null
  avatar_url: string | null
  website: string | null
  email: string | null
  sort_order: number
}

export interface IidPartner {
  id: number
  name: string
  partner_type: string | null
  description: string | null
  logo_url: string | null
  website: string | null
  sort_order: number
}

export interface ReportSummary {
  id: number
  slug: string
  title: string
  category: string
  summary: string | null
  preview_text: string | null
  thumbnail_url: string | null
  status: string
  is_premium: boolean
  published_at: string | null
  created_at: string
  updated_at: string
}

export interface ReportDetail extends ReportSummary {
  description: string | null
  storage_path: string | null
  download_url: string | null
  metadata: Record<string, unknown>
}

export interface ReportPayload {
  title: string
  slug?: string | null
  category?: string
  summary?: string | null
  description?: string | null
  previewText?: string | null
  thumbnailUrl?: string | null
  storagePath?: string | null
  downloadUrl?: string | null
  status?: string
  isPremium?: boolean
  metadata?: Record<string, unknown>
}

export interface ReportDownloadData {
  report_id: number
  allowed: boolean
  download_url: string | null
  storage_path: string | null
  is_premium: boolean
}

export interface DueDiligenceReportData {
  overview: StatsOverviewData
  enterprises: EnterpriseListItem[]
}

export interface SroiReportData {
  metric_available: boolean
  message: string
  overview: StatsOverviewData
  impact_flows: DashboardImpactFlowCell[]
}

export interface CustomAnalysisAttachmentInput {
  title?: string | null
  fileName?: string | null
  fileUrl?: string | null
  storagePath?: string | null
  metadata?: Record<string, unknown>
}

export interface CustomAnalysisCreatePayload {
  enterpriseId?: number
  requesterName: string
  requesterEmail: string
  requesterPhone?: string | null
  subject: string
  requestType?: string
  brief?: string | null
  desiredDueDate?: string | null
  attachments?: CustomAnalysisAttachmentInput[]
  metadata?: Record<string, unknown>
}

export interface CustomAnalysisRequestItem {
  id: number
  requester_name: string
  requester_email: string
  requester_phone: string | null
  subject: string
  request_type: string
  brief: string | null
  status: string
  attachment_count: number
  desired_due_date: string | null
  admin_notes: string | null
  quote_amount: number | null
  quote_currency: string | null
  created_at: string
  updated_at: string
}

export interface CustomAnalysisUpdatePayload {
  status: string
  adminNotes?: string | null
  quoteAmount?: number | null
  quoteCurrency?: string | null
  note?: string | null
}
