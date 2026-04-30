import { useMemo, useState } from 'react'
import { useMutation, useQuery } from '@tanstack/react-query'

import { RadarScoreCard } from '../components/charts/RadarScoreCard'
import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { Field, Input, Textarea } from '../components/ui/Field'
import { EmptyState, ErrorState, LoadingState } from '../components/ui/States'
import {
  getAssessmentHistory,
  getAssessmentQuestions,
  getAssessmentResults,
  submitAssessment,
} from '../features/assessment/api'
import { useAuth } from '../lib/auth/auth'
import type { AssessmentAnswerInput, AssessmentQuestionItem } from '../lib/api/types'
import { formatDate } from '../lib/utils/format'

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
    return <EmptyState title="Chưa có enterprise link" description="Account hiện tại chưa link vào organization profile nên không thể submit assessment." />
  }

  return (
    <div className="page-stack">
      <section className="page-intro">
        <div>
          <p className="eyebrow">Self-assessment</p>
          <h1>Assessment flow cho enterprise account</h1>
          <p className="lead">
            Page này dùng đúng protected endpoints hiện có. Nếu question bank chưa có câu hỏi thật, FE sẽ giữ trạng thái “đang cập nhật”.
          </p>
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
              title="Question bank chưa có câu hỏi"
              description="Backend hiện mới có placeholder 5 pillars nhưng chưa có questions/options thật."
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
