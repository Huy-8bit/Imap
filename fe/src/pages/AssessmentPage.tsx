import { useMemo, useState } from 'react'
import { useMutation, useQuery } from '@tanstack/react-query'

import { RadarScoreCard } from '../components/charts/RadarScoreCard'
import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { Field, Input, Select, Textarea } from '../components/ui/Field'
import { EmptyState, ErrorState, LoadingState } from '../components/ui/States'
import {
  getAssessmentHistory,
  getAssessmentQuestions,
  getAssessmentResults,
  submitAssessment,
} from '../features/assessment/api'
import { selfRegisterEnterprise } from '../features/enterprises/api'
import { getTaxonomies } from '../features/taxonomies/api'
import { useAuth } from '../lib/auth/auth'
import type { AssessmentAnswerInput, AssessmentQuestionItem, OrganizationSelfRegistrationPayload } from '../lib/api/types'
import { formatDate } from '../lib/utils/format'

const initialSelfRegistrationForm: OrganizationSelfRegistrationPayload = {
  general: {
    tradeName: '',
    registeredName: '',
    taxCode: '',
    foundedYear: '',
    operationalStatus: '',
    location: {
      province: '',
      ward: '',
    },
    contacts: {
      website: '',
      email: '',
      phone: '',
    },
  },
  classification: {
    organizationType: '',
    primaryIndustrySector: '',
    otherIndustrySectors: [],
    hasPositiveSocialImpact: null,
    environmentalImpactAreas: [],
    primaryProductType: '',
    otherProductType: '',
  },
}

export function AssessmentPage() {
  const { user } = useAuth()
  const enterpriseId = user?.organization?.id || null
  const [notes, setNotes] = useState('')
  const [answers, setAnswers] = useState<Record<number, AssessmentAnswerInput>>({})

  const questionsQuery = useQuery({
    queryKey: ['assessment', 'questions'],
    queryFn: getAssessmentQuestions,
  })
  const resultsQuery = useQuery({
    queryKey: ['assessment', 'results', enterpriseId],
    queryFn: () => getAssessmentResults(enterpriseId as number),
    enabled: enterpriseId !== null,
  })
  const historyQuery = useQuery({
    queryKey: ['assessment', 'history', enterpriseId],
    queryFn: () => getAssessmentHistory(enterpriseId as number),
    enabled: enterpriseId !== null,
  })
  const submitMutation = useMutation({
    mutationFn: () =>
      submitAssessment({
        enterpriseId: enterpriseId || undefined,
        notes,
        answers: Object.values(answers),
      }),
    onSuccess: () => {
      void resultsQuery.refetch()
      void historyQuery.refetch()
    },
  })

  const totalQuestions = useMemo(
    () => (questionsQuery.data?.data || []).reduce((count, group) => count + group.questions.length, 0),
    [questionsQuery.data?.data],
  )

  if (enterpriseId === null) {
    return <EnterpriseSelfRegistrationPanel />
  }

  return (
    <div className="page-stack">
      <section className="page-intro">
        <div>
          <p className="eyebrow">Self-assessment</p>
          <h1>Assessment flow cho enterprise account</h1>
        </div>
      </section>

      <div className="detail-grid">
        <Card>
          <div className="section-header compact">
            <div>
              <h2>Question bank</h2>
            </div>
          </div>
          {questionsQuery.isLoading ? (
            <LoadingState />
          ) : questionsQuery.isError ? (
            <ErrorState description="Không tải được assessment question bank." onRetry={() => void questionsQuery.refetch()} />
          ) : !totalQuestions ? (
            <EmptyState
              title="Bộ câu hỏi đang được cập nhật"
              description="Vui lòng quay lại sau."
            />
          ) : (
            <form
              className="stack-md"
              onSubmit={(event) => {
                event.preventDefault()
                submitMutation.mutate()
              }}
            >
              {(questionsQuery.data?.data || []).map((group) => (
                <Card key={group.pillar.id} className="nested-card">
                  <div className="stack-sm">
                    <h3>{group.pillar.display_name}</h3>
                    {group.questions.map((question) => (
                      <QuestionField
                        key={question.id}
                        question={question}
                        answer={answers[question.id]}
                        onChange={(answer) =>
                          setAnswers((current) => ({
                            ...current,
                            [question.id]: answer,
                          }))
                        }
                      />
                    ))}
                  </div>
                </Card>
              ))}
              <Field label="Notes">
                <Textarea value={notes} onChange={(event) => setNotes(event.target.value)} />
              </Field>
              {submitMutation.isError ? <ErrorState description="Không submit được assessment." /> : null}
              <Button type="submit" disabled={submitMutation.isPending}>
                {submitMutation.isPending ? 'Đang gửi...' : 'Submit assessment'}
              </Button>
            </form>
          )}
        </Card>

        <Card>
          {resultsQuery.isLoading ? (
            <LoadingState label="Đang tải latest results..." />
          ) : resultsQuery.isError || !resultsQuery.data ? (
            <ErrorState description="Không tải được assessment results." onRetry={() => void resultsQuery.refetch()} />
          ) : (
            <RadarScoreCard
              data={{
                enterprise_id: resultsQuery.data.data.enterprise_id,
                has_data: resultsQuery.data.data.has_data,
                overall_score: resultsQuery.data.data.overall_score,
                scoring_version: resultsQuery.data.data.scoring_version,
                scored_at: resultsQuery.data.data.scored_at,
                pillars: resultsQuery.data.data.pillars,
              }}
              title="Latest assessment snapshot"
            />
          )}
        </Card>
      </div>

      <Card>
        <div className="section-header compact">
          <div>
            <h2>Submission history</h2>
          </div>
        </div>
        {historyQuery.isLoading ? (
          <LoadingState />
        ) : historyQuery.isError ? (
          <ErrorState description="Không tải được lịch sử assessment." onRetry={() => void historyQuery.refetch()} />
        ) : historyQuery.data?.data.length ? (
          <div className="history-list">
            {historyQuery.data.data.map((item) => (
              <div key={item.submission_id} className="history-item">
                <strong>Submission #{item.submission_id}</strong>
                <p className="muted">
                  {item.status} · {item.scoring_version} · {formatDate(item.submitted_at)}
                </p>
                <p className="small-note">{item.notes || 'Không có note.'}</p>
              </div>
            ))}
          </div>
        ) : (
          <EmptyState title="Chưa có lịch sử assessment" description="Enterprise hiện chưa có submission nào." />
        )}
      </Card>
    </div>
  )
}

function EnterpriseSelfRegistrationPanel() {
  const { reloadProfile } = useAuth()
  const [form, setForm] = useState<OrganizationSelfRegistrationPayload>(() => ({
    ...initialSelfRegistrationForm,
    general: {
      ...initialSelfRegistrationForm.general,
      contacts: {
        ...initialSelfRegistrationForm.general.contacts,
        email: 'admin@imap.local',
      },
    },
  }))
  const taxonomiesQuery = useQuery({
    queryKey: ['taxonomies', 'enterprise-self-registration'],
    queryFn: getTaxonomies,
  })
  const taxonomyGroups = taxonomiesQuery.data?.data.taxonomies
  const submitMutation = useMutation({
    mutationFn: () => selfRegisterEnterprise(cleanSelfRegistrationPayload(form)),
    onSuccess: async () => {
      await reloadProfile()
    },
  })

  function updateGeneral(next: Partial<OrganizationSelfRegistrationPayload['general']>) {
    setForm((current) => ({
      ...current,
      general: {
        ...current.general,
        ...next,
      },
    }))
  }

  function updateContacts(next: Partial<NonNullable<OrganizationSelfRegistrationPayload['general']['contacts']>>) {
    setForm((current) => ({
      ...current,
      general: {
        ...current.general,
        contacts: {
          ...current.general.contacts,
          ...next,
        },
      },
    }))
  }

  function updateLocation(next: Partial<NonNullable<OrganizationSelfRegistrationPayload['general']['location']>>) {
    setForm((current) => ({
      ...current,
      general: {
        ...current.general,
        location: {
          ...current.general.location,
          ...next,
        },
      },
    }))
  }

  function updateClassification(next: Partial<OrganizationSelfRegistrationPayload['classification']>) {
    setForm((current) => ({
      ...current,
      classification: {
        ...current.classification,
        ...next,
      },
    }))
  }

  function toggleEnvironmentalImpact(code: string) {
    const selected = form.classification.environmentalImpactAreas || []
    const isSelected = selected.includes(code)
    if (!isSelected && selected.length >= 4) {
      return
    }
    updateClassification({
      environmentalImpactAreas: isSelected
        ? selected.filter((value) => value !== code)
        : [...selected, code],
    })
  }

  return (
    <div className="page-stack">
      <section className="page-intro">
        <div>
          <p className="eyebrow">Enterprise profile</p>
          <h1>Đăng ký thông tin doanh nghiệp</h1>
          <p className="lead">Tài khoản của bạn chưa liên kết với hồ sơ doanh nghiệp. Gửi hồ sơ để bắt đầu assessment và certification flow.</p>
        </div>
      </section>

      <Card>
        {taxonomiesQuery.isLoading ? (
          <LoadingState label="Đang tải danh mục..." />
        ) : taxonomiesQuery.isError || !taxonomyGroups ? (
          <ErrorState description="Không tải được danh mục nhập liệu." onRetry={() => void taxonomiesQuery.refetch()} />
        ) : (
          <form
            className="form-grid"
            onSubmit={(event) => {
              event.preventDefault()
              submitMutation.mutate()
            }}
          >
            <div className="form-grid-span">
              <h2>Thông tin chung</h2>
            </div>
            <Field label="Tên thương mại">
              <Input
                value={form.general.tradeName || ''}
                onChange={(event) => updateGeneral({ tradeName: event.target.value })}
                required
              />
            </Field>
            <Field label="Tên đăng ký">
              <Input
                value={form.general.registeredName || ''}
                onChange={(event) => updateGeneral({ registeredName: event.target.value })}
              />
            </Field>
            <Field label="Mã số thuế">
              <Input
                value={form.general.taxCode || ''}
                onChange={(event) => updateGeneral({ taxCode: event.target.value })}
              />
            </Field>
            <Field label="Năm thành lập">
              <Input
                type="number"
                min={1800}
                max={2200}
                value={form.general.foundedYear || ''}
                onChange={(event) => updateGeneral({ foundedYear: event.target.value })}
              />
            </Field>
            <Field label="Trạng thái hoạt động">
              <Select
                value={form.general.operationalStatus || ''}
                onChange={(event) => updateGeneral({ operationalStatus: event.target.value })}
                required
              >
                <option value="">Chọn trạng thái</option>
                {taxonomyGroups.operational_statuses?.map((item) => (
                  <option key={item.code} value={item.code}>
                    {item.display_name}
                  </option>
                ))}
              </Select>
            </Field>
            <Field label="Tỉnh/thành">
              <Select
                value={form.general.location?.province || ''}
                onChange={(event) => updateLocation({ province: event.target.value })}
              >
                <option value="">Chọn tỉnh/thành</option>
                {taxonomyGroups.provinces?.map((item) => (
                  <option key={item.code} value={item.code}>
                    {item.display_name}
                  </option>
                ))}
              </Select>
            </Field>
            <Field label="Phường/xã">
              <Input
                value={form.general.location?.ward || ''}
                onChange={(event) => updateLocation({ ward: event.target.value })}
              />
            </Field>
            <Field label="Website">
              <Input
                type="url"
                value={form.general.contacts?.website || ''}
                onChange={(event) => updateContacts({ website: event.target.value })}
              />
            </Field>
            <Field label="Email liên hệ">
              <Input
                type="email"
                value={form.general.contacts?.email || ''}
                onChange={(event) => updateContacts({ email: event.target.value })}
              />
            </Field>
            <Field label="Số điện thoại">
              <Input
                value={form.general.contacts?.phone || ''}
                onChange={(event) => updateContacts({ phone: event.target.value })}
              />
            </Field>

            <div className="form-grid-span">
              <h2>Phân loại</h2>
            </div>
            <Field label="Loại hình tổ chức">
              <Select
                value={form.classification.organizationType || ''}
                onChange={(event) => updateClassification({ organizationType: event.target.value })}
                required
              >
                <option value="">Chọn loại hình</option>
                {taxonomyGroups.organization_types?.map((item) => (
                  <option key={item.code} value={item.code}>
                    {item.display_name}
                  </option>
                ))}
              </Select>
            </Field>
            <Field label="Ngành chính">
              <Select
                value={form.classification.primaryIndustrySector || ''}
                onChange={(event) => updateClassification({ primaryIndustrySector: event.target.value })}
                required
              >
                <option value="">Chọn ngành</option>
                {taxonomyGroups.industry_sectors?.map((item) => (
                  <option key={item.code} value={item.code}>
                    {item.display_name}
                  </option>
                ))}
              </Select>
            </Field>
            <Field label="Loại sản phẩm chính">
              <Select
                value={form.classification.primaryProductType || ''}
                onChange={(event) => updateClassification({ primaryProductType: event.target.value })}
                required
              >
                <option value="">Chọn loại sản phẩm</option>
                {taxonomyGroups.product_types?.map((item) => (
                  <option key={item.code} value={item.code}>
                    {item.display_name}
                  </option>
                ))}
              </Select>
            </Field>
            <Field label="Tác động xã hội tích cực">
              <Select
                value={
                  form.classification.hasPositiveSocialImpact === null ||
                  form.classification.hasPositiveSocialImpact === undefined
                    ? ''
                    : String(form.classification.hasPositiveSocialImpact)
                }
                onChange={(event) =>
                  updateClassification({
                    hasPositiveSocialImpact: event.target.value === '' ? null : event.target.value === 'true',
                  })
                }
              >
                <option value="">Chưa xác định</option>
                <option value="true">Có</option>
                <option value="false">Không</option>
              </Select>
            </Field>
            <div className="form-grid-span">
              <Field label="Lĩnh vực tác động môi trường" hint="Chọn tối đa 4 mục.">
                <div className="checkbox-grid">
                  {taxonomyGroups.environmental_impact_areas?.map((item) => {
                    const selected = form.classification.environmentalImpactAreas || []
                    const checked = selected.includes(item.code)
                    return (
                      <label key={item.code} className="radio-option">
                        <input
                          type="checkbox"
                          checked={checked}
                          disabled={!checked && selected.length >= 4}
                          onChange={() => toggleEnvironmentalImpact(item.code)}
                        />
                        {item.display_name}
                      </label>
                    )
                  })}
                </div>
              </Field>
            </div>

            {submitMutation.isError ? (
              <div className="form-grid-span">
                <ErrorState
                  description={
                    submitMutation.error instanceof Error
                      ? submitMutation.error.message
                      : 'Không gửi được hồ sơ doanh nghiệp.'
                  }
                />
              </div>
            ) : null}
            <div className="form-grid-span hero-actions">
              <Button type="submit" disabled={submitMutation.isPending}>
                {submitMutation.isPending ? 'Đang gửi hồ sơ...' : 'Gửi hồ sơ doanh nghiệp'}
              </Button>
            </div>
          </form>
        )}
      </Card>
    </div>
  )
}

function cleanSelfRegistrationPayload(
  payload: OrganizationSelfRegistrationPayload,
): OrganizationSelfRegistrationPayload {
  return {
    general: {
      tradeName: cleanOptionalText(payload.general.tradeName),
      registeredName: cleanOptionalText(payload.general.registeredName),
      taxCode: cleanOptionalText(payload.general.taxCode),
      foundedYear: cleanOptionalYear(payload.general.foundedYear),
      operationalStatus: cleanOptionalText(payload.general.operationalStatus),
      location: {
        province: cleanOptionalText(payload.general.location?.province),
        ward: cleanOptionalText(payload.general.location?.ward),
      },
      contacts: {
        website: cleanOptionalText(payload.general.contacts?.website),
        email: cleanOptionalText(payload.general.contacts?.email),
        phone: cleanOptionalText(payload.general.contacts?.phone),
      },
    },
    classification: {
      organizationType: cleanOptionalText(payload.classification.organizationType),
      primaryIndustrySector: cleanOptionalText(payload.classification.primaryIndustrySector),
      otherIndustrySectors: payload.classification.otherIndustrySectors || [],
      hasPositiveSocialImpact: payload.classification.hasPositiveSocialImpact ?? null,
      environmentalImpactAreas: payload.classification.environmentalImpactAreas || [],
      primaryProductType: cleanOptionalText(payload.classification.primaryProductType),
      otherProductType: cleanOptionalText(payload.classification.otherProductType),
    },
  }
}

function cleanOptionalText(value: string | null | undefined) {
  const cleaned = value?.trim()
  return cleaned ? cleaned : null
}

function cleanOptionalYear(value: string | number | null | undefined) {
  if (typeof value === 'number') {
    return value
  }
  const cleaned = value?.trim()
  return cleaned ? cleaned : null
}

function QuestionField({
  question,
  answer,
  onChange,
}: {
  question: AssessmentQuestionItem
  answer?: AssessmentAnswerInput
  onChange: (answer: AssessmentAnswerInput) => void
}) {
  if (question.question_type === 'boolean') {
    return (
      <Field label={question.prompt} hint={question.help_text || undefined}>
        <div className="stack-inline">
          <label className="radio-option">
            <input
              type="radio"
              checked={answer?.boolean_value === true}
              onChange={() => onChange({ question_id: question.id, boolean_value: true })}
            />
            Có
          </label>
          <label className="radio-option">
            <input
              type="radio"
              checked={answer?.boolean_value === false}
              onChange={() => onChange({ question_id: question.id, boolean_value: false })}
            />
            Không
          </label>
        </div>
      </Field>
    )
  }

  if (question.question_type === 'number' || question.question_type === 'scale') {
    return (
      <Field label={question.prompt} hint={question.help_text || undefined}>
        <Input
          type="number"
          value={answer?.number_value ?? ''}
          onChange={(event) =>
            onChange({
              question_id: question.id,
              number_value: event.target.value ? Number(event.target.value) : null,
            })
          }
        />
      </Field>
    )
  }

  if (question.question_type === 'single_choice') {
    return (
      <Field label={question.prompt} hint={question.help_text || undefined}>
        <div className="stack-sm">
          {question.options.map((option) => (
            <label key={option.id} className="radio-option">
              <input
                type="radio"
                checked={answer?.selected_option_ids?.[0] === option.id}
                onChange={() => onChange({ question_id: question.id, selected_option_ids: [option.id] })}
              />
              {option.label}
            </label>
          ))}
        </div>
      </Field>
    )
  }

  if (question.question_type === 'multi_choice') {
    return (
      <Field label={question.prompt} hint={question.help_text || undefined}>
        <div className="stack-sm">
          {question.options.map((option) => {
            const selected = answer?.selected_option_ids || []
            const checked = selected.includes(option.id)
            return (
              <label key={option.id} className="radio-option">
                <input
                  type="checkbox"
                  checked={checked}
                  onChange={() => {
                    const next = checked ? selected.filter((value) => value !== option.id) : [...selected, option.id]
                    onChange({ question_id: question.id, selected_option_ids: next })
                  }}
                />
                {option.label}
              </label>
            )
          })}
        </div>
      </Field>
    )
  }

  return (
    <Field label={question.prompt} hint={question.help_text || undefined}>
      <Textarea
        value={answer?.text_value ?? ''}
        onChange={(event) => onChange({ question_id: question.id, text_value: event.target.value })}
      />
    </Field>
  )
}
