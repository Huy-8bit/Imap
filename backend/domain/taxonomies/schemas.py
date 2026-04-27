from __future__ import annotations

from typing import Any

from pydantic import BaseModel, Field

from .constants import TaxonomyName


class TaxonomyItemResponse(BaseModel):
    id: int
    code: str
    display_name: str
    display_name_en: str | None = None
    display_name_vi: str | None = None
    sort_order: int
    metadata: dict[str, Any] = Field(default_factory=dict)


class TaxonomyCatalogResponse(BaseModel):
    taxonomies: dict[str, list[TaxonomyItemResponse]]


class TaxonomyGroupResponse(BaseModel):
    name: TaxonomyName
    items: list[TaxonomyItemResponse]


class TaxonomyCatalogEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: TaxonomyCatalogResponse
    meta: dict[str, Any] | None = None


class TaxonomyGroupEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: TaxonomyGroupResponse
    meta: dict[str, Any] | None = None
