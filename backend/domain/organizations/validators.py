from __future__ import annotations

import re
import unicodedata
from typing import Any


class RecordValidationError(ValueError):
    def __init__(self, *, field_name: str, error_code: str, message: str) -> None:
        super().__init__(message)
        self.field_name = field_name
        self.error_code = error_code
        self.message = message


def clean_text(value: Any) -> str | None:
    if value is None:
        return None
    text = str(value)
    collapsed = re.sub(r"\s+", " ", text).strip()
    return collapsed or None

def validate_password_strength(password: str) -> str:
    cleaned = clean_text(password) # Tận dụng hàm clean_text có sẵn
    if not cleaned or len(cleaned) < 8:
        raise RecordValidationError(
            field_name="password",
            error_code="weak_password",
            message="Password must be at least 8 characters long."
        )
    return cleaned


def normalize_lookup_key(value: str | None) -> str | None:
    cleaned = clean_text(value)
    if cleaned is None:
        return None

    normalized = unicodedata.normalize("NFKD", cleaned)
    without_marks = "".join(char for char in normalized if not unicodedata.combining(char))
    lowered = without_marks.lower()
    compact = re.sub(r"[^a-z0-9]+", "_", lowered).strip("_")
    return compact or None


def normalize_tax_code(value: Any) -> str | None:
    cleaned = clean_text(value)
    if cleaned is None:
        return None

    compact = re.sub(r"\s+", "", cleaned)
    if re.fullmatch(r"[0-9A-Za-z-]+", compact) is None:
        raise RecordValidationError(
            field_name="general.taxCode",
            error_code="invalid_tax_code",
            message="Tax code must be a compact string without spaces and only contain letters, digits, or hyphens.",
        )
    return compact


def normalize_phone(value: Any) -> str | None:
    cleaned = clean_text(value)
    if cleaned is None:
        return None

    compact = re.sub(r"\s+", "", cleaned)
    if re.fullmatch(r"\+?[0-9().-]+", compact) is None:
        raise RecordValidationError(
            field_name="general.contacts.phone",
            error_code="invalid_phone",
            message="Phone must be a compact string without spaces and only contain digits or common phone separators.",
        )
    return compact


def normalize_email(value: Any) -> str | None:
    cleaned = clean_text(value)
    if cleaned is None:
        return None

    lowered = cleaned.lower()
    if re.fullmatch(r"[^@\s]+@[^@\s]+\.[^@\s]+", lowered) is None:
        raise RecordValidationError(
            field_name="general.contacts.email",
            error_code="invalid_email",
            message="Email is not in a valid format.",
        )
    return lowered


def parse_year(value: Any, *, field_name: str) -> int | None:
    cleaned = clean_text(value)
    if cleaned is None:
        return None

    try:
        year = int(cleaned)
    except ValueError as exc:
        raise RecordValidationError(
            field_name=field_name,
            error_code="invalid_year",
            message=f"{field_name} must be a four-digit year.",
        ) from exc

    if year < 1800 or year > 2200:
        raise RecordValidationError(
            field_name=field_name,
            error_code="invalid_year",
            message=f"{field_name} must be between 1800 and 2200.",
        )
    return year


def parse_bool(value: Any, *, field_name: str) -> bool | None:
    if value is None:
        return None
    if isinstance(value, bool):
        return value

    cleaned = clean_text(value)
    if cleaned is None:
        return None

    normalized = normalize_lookup_key(cleaned)
    truthy = {"1", "true", "yes", "co", "có"}
    falsy = {"0", "false", "no", "khong", "không"}
    if normalized in truthy:
        return True
    if normalized in falsy:
        return False

    raise RecordValidationError(
        field_name=field_name,
        error_code="invalid_boolean",
        message=f"{field_name} must be a boolean or a supported yes/no string.",
    )
