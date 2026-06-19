from __future__ import annotations

from backend.domain.auth.schemas import AuthenticatedUser
from backend.libs.http.errors import AppError, ConflictError

from .claim_repository import OrgClaimRepository
from .schemas import OrgClaimData, OrgClaimEnvelope, OrgClaimInput


class OrgClaimService:
    def __init__(self, repository: OrgClaimRepository) -> None:
        self._repository = repository

    def submit_claim(
        self,
        org_id: int,
        payload: OrgClaimInput,
        *,
        current_user: AuthenticatedUser,
    ) -> OrgClaimEnvelope:
        existing = self._repository.get_existing_active_claim(org_id, current_user.id)
        if existing is not None and existing["status"] in ("pending_verification", "pending_review"):
            raise ConflictError("claim already in progress for this organization")
        if existing is not None and existing["status"] == "approved":
            raise ConflictError("organization already claimed by this account")

        row = self._repository.create_claim(org_id, current_user.id)
        # Email verification step: ở đây sẽ gửi email token khi có email service
        # Hiện tại chuyển thẳng sang pending_review cho đến khi email service được implement
        return OrgClaimEnvelope(
            data=OrgClaimData.model_validate(row),
            meta={"next_step": "email_verification_pending"},
        )
