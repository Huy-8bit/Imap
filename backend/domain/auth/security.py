from __future__ import annotations

import base64
import hashlib
import hmac
import json
import secrets
from datetime import UTC, datetime, timedelta
from typing import Any

from backend.libs.http.errors import UnauthorizedError


def hash_password(password: str, *, iterations: int = 600_000) -> str:
    salt = secrets.token_hex(16)
    digest = hashlib.pbkdf2_hmac(
        "sha256",
        password.encode("utf-8"),
        salt.encode("utf-8"),
        iterations,
    )
    return f"pbkdf2_sha256${iterations}${salt}${digest.hex()}"


def verify_password(password: str, password_hash: str) -> bool:
    try:
        algorithm, iterations_raw, salt, digest_hex = password_hash.split("$", 3)
    except ValueError:
        return False

    if algorithm != "pbkdf2_sha256":
        return False

    try:
        iterations = int(iterations_raw)
    except ValueError:
        return False

    candidate = hashlib.pbkdf2_hmac(
        "sha256",
        password.encode("utf-8"),
        salt.encode("utf-8"),
        iterations,
    ).hex()
    return hmac.compare_digest(candidate, digest_hex)


def issue_signed_token(
    claims: dict[str, Any],
    *,
    secret: str,
    expires_delta: timedelta,
) -> tuple[str, datetime]:
    expires_at = datetime.now(UTC) + expires_delta
    payload = {
        **claims,
        "exp": int(expires_at.timestamp()),
        "iat": int(datetime.now(UTC).timestamp()),
    }
    header_segment = _b64url_encode(json.dumps({"alg": "HS256", "typ": "JWT"}).encode("utf-8"))
    payload_segment = _b64url_encode(
        json.dumps(payload, ensure_ascii=False, separators=(",", ":"), sort_keys=True).encode("utf-8")
    )
    signing_input = f"{header_segment}.{payload_segment}"
    signature = hmac.new(secret.encode("utf-8"), signing_input.encode("utf-8"), hashlib.sha256).digest()
    token = f"{signing_input}.{_b64url_encode(signature)}"
    return token, expires_at


def decode_signed_token(token: str, *, secret: str) -> dict[str, Any]:
    try:
        header_segment, payload_segment, signature_segment = token.split(".", 2)
    except ValueError as exc:
        raise UnauthorizedError("invalid token") from exc

    signing_input = f"{header_segment}.{payload_segment}"
    expected_signature = hmac.new(
        secret.encode("utf-8"),
        signing_input.encode("utf-8"),
        hashlib.sha256,
    ).digest()
    actual_signature = _b64url_decode(signature_segment)
    if not hmac.compare_digest(expected_signature, actual_signature):
        raise UnauthorizedError("invalid token signature")

    try:
        payload = json.loads(_b64url_decode(payload_segment))
    except (json.JSONDecodeError, ValueError) as exc:
        raise UnauthorizedError("invalid token payload") from exc

    exp = payload.get("exp")
    if not isinstance(exp, int):
        raise UnauthorizedError("invalid token expiry")

    if datetime.now(UTC).timestamp() >= exp:
        raise UnauthorizedError("token expired")

    return payload


def hash_token(token: str) -> str:
    return hashlib.sha256(token.encode("utf-8")).hexdigest()


def new_session_id() -> str:
    return secrets.token_hex(24)


def _b64url_encode(data: bytes) -> str:
    return base64.urlsafe_b64encode(data).rstrip(b"=").decode("ascii")


def _b64url_decode(data: str) -> bytes:
    padding = "=" * (-len(data) % 4)
    return base64.urlsafe_b64decode(data + padding)
