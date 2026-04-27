from __future__ import annotations

from .repository import ABOUT_PAGE_SLUG, IidRepository
from .schemas import (
    IidAboutEnvelope,
    IidAboutPage,
    IidAboutPayload,
    IidPartnersEnvelope,
    IidPartner,
    IidTeamEnvelope,
    IidTeamMember,
)


class IidService:
    def __init__(self, repository: IidRepository) -> None:
        self._repository = repository

    def get_about(self) -> IidAboutEnvelope:
        row = self._repository.get_about_page()
        if row is None:
            row = {
                "slug": ABOUT_PAGE_SLUG,
                "title": "About IID",
                "summary": None,
                "body": None,
                "status": "draft",
                "updated_at": None,
            }
        return IidAboutEnvelope(data=IidAboutPage.model_validate(row))

    def update_about(self, payload: IidAboutPayload, *, user_id: int) -> IidAboutEnvelope:
        row = self._repository.upsert_about_page(payload, user_id=user_id)
        return IidAboutEnvelope(data=IidAboutPage.model_validate(row))

    def list_team(self) -> IidTeamEnvelope:
        rows = self._repository.list_team_members()
        items = [IidTeamMember.model_validate(row) for row in rows]
        return IidTeamEnvelope(data=items, meta={"total": len(items)})

    def list_partners(self) -> IidPartnersEnvelope:
        rows = self._repository.list_partners()
        items = [IidPartner.model_validate(row) for row in rows]
        return IidPartnersEnvelope(data=items, meta={"total": len(items)})
