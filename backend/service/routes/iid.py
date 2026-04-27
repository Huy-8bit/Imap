from __future__ import annotations

from fastapi import APIRouter, Depends

from backend.domain.auth.schemas import AuthenticatedUser
from backend.domain.iid import IidRepository, IidService
from backend.domain.iid.schemas import (
    IidAboutEnvelope,
    IidAboutPayload,
    IidPartnersEnvelope,
    IidTeamEnvelope,
)
from backend.libs.database import PostgreSQLClient
from backend.service.dependencies import get_postgresql_client, require_roles

router = APIRouter(prefix="/iid", tags=["iid"])


@router.get("/about", response_model=IidAboutEnvelope)
async def get_iid_about(
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> IidAboutEnvelope:
    return IidService(IidRepository(db)).get_about()


@router.get("/team", response_model=IidTeamEnvelope)
async def get_iid_team(
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> IidTeamEnvelope:
    return IidService(IidRepository(db)).list_team()


@router.get("/partners", response_model=IidPartnersEnvelope)
async def get_iid_partners(
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> IidPartnersEnvelope:
    return IidService(IidRepository(db)).list_partners()


@router.put("/about", response_model=IidAboutEnvelope)
async def update_iid_about(
    payload: IidAboutPayload,
    user: AuthenticatedUser = Depends(require_roles("admin")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> IidAboutEnvelope:
    return IidService(IidRepository(db)).update_about(payload, user_id=user.id)
