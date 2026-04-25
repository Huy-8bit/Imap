from __future__ import annotations

from fastapi import APIRouter, Depends, Query

from backend.domain.taxonomies import TaxonomyName, TaxonomyRepository, TaxonomyService
from backend.domain.taxonomies.schemas import TaxonomyCatalogEnvelope, TaxonomyGroupEnvelope
from backend.libs.database import PostgreSQLClient
from backend.service.dependencies import get_postgresql_client

router = APIRouter(prefix="/taxonomies", tags=["taxonomies"])


@router.get("", response_model=TaxonomyCatalogEnvelope)
async def list_taxonomies(
    include_inactive: bool = Query(default=False),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> TaxonomyCatalogEnvelope:
    service = TaxonomyService(TaxonomyRepository(db))
    data = service.list_all(include_inactive=include_inactive)
    return TaxonomyCatalogEnvelope(data=data)


@router.get("/{taxonomy_name}", response_model=TaxonomyGroupEnvelope)
async def get_taxonomy(
    taxonomy_name: TaxonomyName,
    include_inactive: bool = Query(default=False),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> TaxonomyGroupEnvelope:
    service = TaxonomyService(TaxonomyRepository(db))
    data = service.list_one(taxonomy_name, include_inactive=include_inactive)
    return TaxonomyGroupEnvelope(data=data)
