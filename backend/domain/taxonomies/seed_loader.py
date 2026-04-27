from __future__ import annotations

import json
import re
import unicodedata
import zipfile
from dataclasses import dataclass
from pathlib import Path
from typing import Any
from xml.etree import ElementTree

from .constants import TaxonomyName

XLSX_MAIN_NS = {"main": "http://schemas.openxmlformats.org/spreadsheetml/2006/main"}


@dataclass(slots=True)
class TaxonomySeedRow:
    code: str
    display_name: str
    display_name_en: str | None
    display_name_vi: str | None
    sort_order: int
    metadata: dict[str, Any]


@dataclass(frozen=True, slots=True)
class SpreadsheetColumnSpec:
    column: str
    header_rows: int = 1


CATALOG_COLUMN_SPECS: dict[TaxonomyName, SpreadsheetColumnSpec] = {
    TaxonomyName.OPERATIONAL_STATUSES: SpreadsheetColumnSpec(column="A"),
    TaxonomyName.ORGANIZATION_TYPES: SpreadsheetColumnSpec(column="C"),
    TaxonomyName.INDUSTRY_SECTORS: SpreadsheetColumnSpec(column="E"),
    TaxonomyName.ENVIRONMENTAL_IMPACT_AREAS: SpreadsheetColumnSpec(column="G"),
    TaxonomyName.PRODUCT_TYPES: SpreadsheetColumnSpec(column="K"),
    TaxonomyName.PROVINCES: SpreadsheetColumnSpec(column="M"),
}


def build_seed_bundle(sample_data_dir: Path, workbook_path: Path) -> dict[TaxonomyName, list[TaxonomySeedRow]]:
    enum_payload = _load_enum_payload(sample_data_dir / "dataEng.json")
    catalog_labels = _load_catalog_labels(workbook_path)

    bundle: dict[TaxonomyName, list[TaxonomySeedRow]] = {
        TaxonomyName.OPERATIONAL_STATUSES: _build_rows(
            taxonomy_name=TaxonomyName.OPERATIONAL_STATUSES,
            source_values=enum_payload["operationalStatus"],
            source_labels_vi=catalog_labels[TaxonomyName.OPERATIONAL_STATUSES],
        ),
        TaxonomyName.ORGANIZATION_TYPES: _build_rows(
            taxonomy_name=TaxonomyName.ORGANIZATION_TYPES,
            source_values=enum_payload["organizationType"],
            source_labels_vi=catalog_labels[TaxonomyName.ORGANIZATION_TYPES],
        ),
        TaxonomyName.INDUSTRY_SECTORS: _build_rows(
            taxonomy_name=TaxonomyName.INDUSTRY_SECTORS,
            source_values=enum_payload["industrySector"],
            source_labels_vi=catalog_labels[TaxonomyName.INDUSTRY_SECTORS],
        ),
        TaxonomyName.ENVIRONMENTAL_IMPACT_AREAS: _build_rows(
            taxonomy_name=TaxonomyName.ENVIRONMENTAL_IMPACT_AREAS,
            source_values=enum_payload["environmentalImpactArea"],
            source_labels_vi=catalog_labels[TaxonomyName.ENVIRONMENTAL_IMPACT_AREAS],
        ),
        TaxonomyName.PRODUCT_TYPES: _build_rows(
            taxonomy_name=TaxonomyName.PRODUCT_TYPES,
            source_values=enum_payload["productType"],
            source_labels_vi=catalog_labels[TaxonomyName.PRODUCT_TYPES],
        ),
        TaxonomyName.PROVINCES: _build_rows(
            taxonomy_name=TaxonomyName.PROVINCES,
            source_values=enum_payload["province"],
            source_labels_vi=catalog_labels[TaxonomyName.PROVINCES],
        ),
        TaxonomyName.IMPACT_ENTITY_TYPES: _build_manual_rows(
            [
                ("se", "SE"),
                ("sib", "SIB"),
                ("ib", "IB"),
            ],
            note="Nullable taxonomy only. Classification logic is not auto-derived from dataset.",
        ),
        TaxonomyName.SDGS: _build_sdg_rows(),
        TaxonomyName.CERTIFICATION_LEVELS: _build_manual_rows(
            [
                ("basic", "Basic"),
                ("verified", "Verified"),
                ("gold", "Gold"),
            ],
            note="Seeded as directory taxonomy. Certification workflow uses admin-driven review and upgrade states until IID publishes a detailed rubric.",
        ),
        TaxonomyName.USER_ROLES: _build_manual_rows(
            [
                ("public", "Public"),
                ("premium", "Premium"),
                ("admin", "Admin"),
                ("enterprise", "Enterprise"),
            ],
            note="Seeded from backend requirements roles for auth and report access policies.",
        ),
    }
    return bundle


def _load_enum_payload(data_eng_path: Path) -> dict[str, list[str]]:
    raw = json.loads(data_eng_path.read_text(encoding="utf-8"))
    enums = raw.get("enums")
    if not isinstance(enums, dict):
        raise ValueError(f"Missing enums in dataset: {data_eng_path}")
    return enums


def _load_catalog_labels(workbook_path: Path) -> dict[TaxonomyName, list[str]]:
    shared_strings = _read_shared_strings(workbook_path)
    sheet_root = _read_worksheet_root(workbook_path, worksheet_name="xl/worksheets/sheet2.xml")

    labels: dict[TaxonomyName, list[str]] = {}
    for taxonomy_name, spec in CATALOG_COLUMN_SPECS.items():
        column_values = _read_column_values(sheet_root, shared_strings, spec.column)
        labels[taxonomy_name] = column_values[spec.header_rows:]
    return labels


def _read_shared_strings(workbook_path: Path) -> list[str]:
    with zipfile.ZipFile(workbook_path) as archive:
        root = ElementTree.fromstring(archive.read("xl/sharedStrings.xml"))

    values: list[str] = []
    for entry in root.findall("main:si", XLSX_MAIN_NS):
        parts = [node.text or "" for node in entry.findall(".//main:t", XLSX_MAIN_NS)]
        values.append("".join(parts))
    return values


def _read_worksheet_root(workbook_path: Path, *, worksheet_name: str) -> ElementTree.Element:
    with zipfile.ZipFile(workbook_path) as archive:
        return ElementTree.fromstring(archive.read(worksheet_name))


def _read_column_values(
    sheet_root: ElementTree.Element,
    shared_strings: list[str],
    column: str,
) -> list[str]:
    values: list[str] = []
    for cell in sheet_root.findall("main:sheetData/main:row/main:c", XLSX_MAIN_NS):
        reference = cell.attrib.get("r", "")
        if not reference.startswith(column):
            continue

        raw_value = cell.findtext("main:v", default="", namespaces=XLSX_MAIN_NS)
        if not raw_value:
            continue

        if cell.attrib.get("t") == "s":
            value = shared_strings[int(raw_value)]
        else:
            value = raw_value

        cleaned_value = _clean_label(value)
        if cleaned_value:
            values.append(cleaned_value)
    return values


def _build_rows(
    *,
    taxonomy_name: TaxonomyName,
    source_values: list[str],
    source_labels_vi: list[str],
) -> list[TaxonomySeedRow]:
    if len(source_values) != len(source_labels_vi):
        raise ValueError(
            f"Source mismatch for {taxonomy_name.value}: "
            f"{len(source_values)} enum values vs {len(source_labels_vi)} workbook labels"
        )

    rows: list[TaxonomySeedRow] = []
    for index, source_value in enumerate(source_values, start=1):
        display_name_en = _normalize_english_label(source_value)
        display_name_vi = source_labels_vi[index - 1]
        code = source_value if _looks_like_code(source_value) else _slugify(source_value)
        aliases = _build_aliases(
            code=code,
            source_value=source_value,
            display_name_en=display_name_en,
            display_name_vi=display_name_vi,
        )
        rows.append(
            TaxonomySeedRow(
                code=code,
                display_name=display_name_vi or display_name_en or code,
                display_name_en=display_name_en,
                display_name_vi=display_name_vi,
                sort_order=index,
                metadata={
                    "aliases": aliases,
                    "source_value": source_value,
                },
            )
        )
    return rows


def _build_manual_rows(
    values: list[tuple[str, str]],
    *,
    note: str,
) -> list[TaxonomySeedRow]:
    rows: list[TaxonomySeedRow] = []
    for index, (code, label) in enumerate(values, start=1):
        rows.append(
            TaxonomySeedRow(
                code=code,
                display_name=label,
                display_name_en=label,
                display_name_vi=None,
                sort_order=index,
                metadata={
                    "aliases": [code, label],
                    "note": note,
                },
            )
        )
    return rows


def _build_sdg_rows() -> list[TaxonomySeedRow]:
    rows: list[TaxonomySeedRow] = []
    for goal_number in range(1, 18):
        label = f"SDG {goal_number}"
        rows.append(
            TaxonomySeedRow(
                code=f"sdg_{goal_number:02d}",
                display_name=label,
                display_name_en=label,
                display_name_vi=label,
                sort_order=goal_number,
                metadata={
                    "aliases": [label, str(goal_number), f"SDG{goal_number}"],
                    "goal_number": goal_number,
                    "note": "Seeded as taxonomy only. No organization mapping logic has been inferred.",
                },
            )
        )
    return rows


def _build_aliases(
    *,
    code: str,
    source_value: str,
    display_name_en: str | None,
    display_name_vi: str | None,
) -> list[str]:
    candidates = [
        code,
        source_value,
        display_name_en,
        display_name_vi,
        _strip_city_prefix(display_name_vi),
    ]
    aliases: list[str] = []
    for candidate in candidates:
        cleaned = _clean_label(candidate)
        if cleaned and cleaned not in aliases:
            aliases.append(cleaned)
    return aliases


def _looks_like_code(value: str) -> bool:
    return re.fullmatch(r"[a-z0-9_]+", value) is not None


def _normalize_english_label(value: str) -> str:
    cleaned = _clean_label(value)
    if cleaned.isupper():
        return cleaned.title()
    if _looks_like_code(cleaned):
        return cleaned.replace("_", " ").replace("-", " ").title()
    return cleaned


def _strip_city_prefix(value: str | None) -> str | None:
    if value is None:
        return None
    return re.sub(r"^(TP\.|Tỉnh)\s*", "", value, flags=re.IGNORECASE).strip() or None


def _slugify(value: str) -> str:
    normalized = unicodedata.normalize("NFKD", value)
    without_marks = "".join(char for char in normalized if not unicodedata.combining(char))
    lowered = without_marks.lower()
    collapsed = re.sub(r"[^a-z0-9]+", "_", lowered).strip("_")
    return collapsed


def _clean_label(value: str | None) -> str | None:
    if value is None:
        return None
    without_prefix = re.sub(r"^\d+\.\s*", "", value)
    collapsed = re.sub(r"\s+", " ", without_prefix).strip()
    return collapsed or None
