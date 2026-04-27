from __future__ import annotations

from .constants import TaxonomyName
from .repository import TaxonomyRepository
from .schemas import TaxonomyCatalogResponse, TaxonomyGroupResponse, TaxonomyItemResponse


class TaxonomyService:
    def __init__(self, repository: TaxonomyRepository) -> None:
        self._repository = repository

    def list_all(self, *, include_inactive: bool = False) -> TaxonomyCatalogResponse:
        rows = self._repository.list_all(include_inactive=include_inactive)
        return TaxonomyCatalogResponse(
            taxonomies={
                name: [TaxonomyItemResponse.model_validate(row) for row in taxonomy_rows]
                for name, taxonomy_rows in rows.items()
            }
        )

    def list_one(self, name: TaxonomyName, *, include_inactive: bool = False) -> TaxonomyGroupResponse:
        rows = self._repository.list_taxonomy(name, include_inactive=include_inactive)
        return TaxonomyGroupResponse(
            name=name,
            items=[TaxonomyItemResponse.model_validate(row) for row in rows],
        )
