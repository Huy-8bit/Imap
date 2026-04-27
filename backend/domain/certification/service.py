from __future__ import annotations

from backend.domain.auth.schemas import AuthenticatedUser
from backend.domain.auth.service import AuthService
from backend.domain.organizations.schemas import PaginationMeta
from backend.libs.http.errors import AppError, NotFoundError

from .repository import CertificationRepository
from .schemas import (
    CertificationApplicationSummary,
    CertificationApplyRequest,
    CertificationDetailData,
    CertificationDetailEnvelope,
    CertificationDirectoryEnvelope,
    CertificationDirectoryItem,
    CertificationDirectoryParams,
    CertificationDocument,
    CertificationMutationEnvelope,
    CertificationReviewRequest,
    CertificationUpgradeRequest,
)

REVIEW_ACTION_STATUS_MAP = {
    "approve": "approved",
    "reject": "rejected",
    "request_changes": "changes_requested",
    "comment": "in_review",
}


class CertificationService:
    def __init__(self, repository: CertificationRepository) -> None:
        self._repository = repository

    def list_directory(self, params: CertificationDirectoryParams) -> CertificationDirectoryEnvelope:
        rows, total = self._repository.list_directory(params)
        return CertificationDirectoryEnvelope(
            data=[CertificationDirectoryItem.model_validate(row) for row in rows],
            meta=PaginationMeta(
                total=total,
                page=params.page,
                page_size=params.page_size,
                total_pages=-(-total // params.page_size) if params.page_size else 0,
            ),
        )

    def get_detail(self, enterprise_id: int) -> CertificationDetailEnvelope:
        return CertificationDetailEnvelope(data=self._build_detail(enterprise_id))

    def apply(
        self,
        payload: CertificationApplyRequest,
        *,
        current_user: AuthenticatedUser,
    ) -> CertificationMutationEnvelope:
        organization_id = payload.enterprise_id or current_user.organization_id
        if organization_id is None:
            raise AppError("enterprise link is required for certification apply", status_code=422)

        AuthService.ensure_organization_access(current_user, organization_id)
        level_id = None
        if payload.requested_level_code:
            level = self._repository.get_certification_level_by_code(payload.requested_level_code)
            if level is None:
                raise AppError("certification level not found", status_code=422)
            level_id = int(level["id"])

        application_id = self._repository.create_application(
            organization_id=organization_id,
            applicant_user_id=current_user.id,
            requested_level_id=level_id,
            application_note=payload.application_note,
            metadata=payload.metadata,
        )
        self._repository.add_documents(
            application_id,
            [document.model_dump(mode="json") for document in payload.documents],
        )
        return CertificationMutationEnvelope(data=self._build_detail(organization_id))

    def review(
        self,
        application_id: int,
        payload: CertificationReviewRequest,
        *,
        current_user: AuthenticatedUser,
    ) -> CertificationMutationEnvelope:
        AuthService.ensure_roles(current_user, ["admin"])
        application = self._repository.get_application(application_id)
        if application is None:
            raise NotFoundError("certification application not found")

        status_after = REVIEW_ACTION_STATUS_MAP.get(payload.action)
        if status_after is None:
            raise AppError("unsupported review action", status_code=422)

        self._repository.review_application(
            application_id=application_id,
            action=payload.action,
            status_after=status_after,
            reviewer_user_id=current_user.id,
            comment=payload.comment,
            public_note=payload.public_note,
        )
        return CertificationMutationEnvelope(data=self._build_detail(int(application["organization_id"])))

    def upgrade(
        self,
        certification_id: int,
        payload: CertificationUpgradeRequest,
        *,
        current_user: AuthenticatedUser,
    ) -> CertificationMutationEnvelope:
        AuthService.ensure_roles(current_user, ["admin"])
        certification = self._repository.get_certification_by_id(certification_id)
        if certification is None:
            raise NotFoundError("certification not found")

        level = self._repository.get_certification_level_by_code(payload.level_code)
        if level is None:
            raise AppError("certification level not found", status_code=422)

        self._repository.upgrade_certification(
            certification_id=certification_id,
            level_id=int(level["id"]),
            status=payload.status,
            directory_visible=payload.directory_visible,
            public_note=payload.public_note,
            expires_at=payload.expires_at,
            changed_by_user_id=current_user.id,
            reason=payload.reason,
        )
        return CertificationMutationEnvelope(data=self._build_detail(int(certification["organization_id"])))

    def _build_detail(self, enterprise_id: int) -> CertificationDetailData:
        current = self._repository.get_current_certification(enterprise_id)
        applications = self._repository.list_applications(enterprise_id)
        documents = self._repository.list_documents_by_application_ids([int(item["id"]) for item in applications])
        docs_by_application_id: dict[int, list[dict]] = {}
        for document in documents:
            docs_by_application_id.setdefault(int(document["application_id"]), []).append(document)

        return CertificationDetailData(
            enterprise_id=enterprise_id,
            current=current,
            applications=[
                CertificationApplicationSummary(
                    id=int(application["id"]),
                    requested_level=application.get("requested_level"),
                    status=application["status"],
                    application_note=application.get("application_note"),
                    review_note=application.get("review_note"),
                    submitted_at=application["submitted_at"],
                    decided_at=application.get("decided_at"),
                    documents=[
                        CertificationDocument.model_validate(document)
                        for document in docs_by_application_id.get(int(application["id"]), [])
                    ],
                )
                for application in applications
            ],
        )
