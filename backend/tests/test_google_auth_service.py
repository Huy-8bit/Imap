from __future__ import annotations

import unittest
from datetime import UTC, datetime, timedelta
from typing import Any

from backend.domain.auth.schemas import GoogleLoginRequest
from backend.domain.auth.service import AuthService, GoogleIdentity
from backend.libs.http.errors import UnauthorizedError
from backend.service.config import config


class FakeAuthRepository:
    def __init__(self) -> None:
        self.next_user_id = 1
        self.users: dict[int, dict[str, Any]] = {}
        self.sessions: list[dict[str, Any]] = []
        self.touched_user_ids: list[int] = []

    def get_role_by_code(self, code: str) -> dict[str, Any] | None:
        if code == "enterprise":
            return {"id": 4, "code": "enterprise", "display_name": "Enterprise"}
        return None

    def get_user_auth_row_by_email(self, email: str) -> dict[str, Any] | None:
        for user in self.users.values():
            if user["email"].lower() == email.lower():
                return self._auth_row(user)
        return None

    def get_user_auth_row_by_google_sub(self, google_sub: str) -> dict[str, Any] | None:
        for user in self.users.values():
            google_metadata = user["metadata"].get("google")
            if isinstance(google_metadata, dict) and google_metadata.get("sub") == google_sub:
                return self._auth_row(user)
        return None

    def create_user(
        self,
        *,
        email: str,
        password_hash: str,
        full_name: str | None,
        role_id: int,
        metadata: dict[str, Any] | None = None,
    ) -> int:
        user_id = self.next_user_id
        self.next_user_id += 1
        self.users[user_id] = {
            "id": user_id,
            "email": email,
            "password_hash": password_hash,
            "full_name": full_name,
            "role_id": role_id,
            "role_code": "enterprise",
            "status": "active",
            "metadata": metadata or {},
            "created_at": datetime.now(UTC),
        }
        return user_id

    def update_google_identity(
        self,
        *,
        user_id: int,
        google_metadata: dict[str, Any],
        full_name: str | None,
    ) -> None:
        user = self.users[user_id]
        user["metadata"]["google"] = google_metadata
        if not user["full_name"] and full_name:
            user["full_name"] = full_name

    def touch_last_login(self, user_id: int) -> None:
        self.touched_user_ids.append(user_id)

    def get_user_context_by_id(self, user_id: int) -> dict[str, Any] | None:
        user = self.users.get(user_id)
        if user is None:
            return None
        return {
            "id": user["id"],
            "email": user["email"],
            "full_name": user["full_name"],
            "role_code": user["role_code"],
            "status": user["status"],
            "organization": None,
            "last_login_at": None,
            "created_at": user["created_at"],
        }

    def create_session(
        self,
        *,
        session_id: str,
        user_id: int,
        refresh_token_hash: str,
        expires_at: datetime,
        user_agent: str | None,
        ip_address: str | None,
    ) -> None:
        self.sessions.append(
            {
                "session_id": session_id,
                "user_id": user_id,
                "refresh_token_hash": refresh_token_hash,
                "expires_at": expires_at,
                "user_agent": user_agent,
                "ip_address": ip_address,
            }
        )

    @staticmethod
    def _auth_row(user: dict[str, Any]) -> dict[str, Any]:
        return {
            "id": user["id"],
            "email": user["email"],
            "password_hash": user["password_hash"],
            "status": user["status"],
            "metadata": user["metadata"],
        }


def build_google_identity(email: str = "person@example.com", sub: str = "google-sub-123") -> GoogleIdentity:
    return GoogleIdentity(
        sub=sub,
        email=email,
        email_verified=True,
        full_name="Person Example",
        picture="https://example.com/avatar.png",
        hosted_domain=None,
    )


class GoogleAuthServiceTests(unittest.TestCase):
    def test_google_login_creates_enterprise_user_and_session(self) -> None:
        repository = FakeAuthRepository()
        service = AuthService(repository)  # type: ignore[arg-type]
        service._verify_google_credential = lambda credential: build_google_identity()  # type: ignore[method-assign]

        envelope = service.login_with_google(
            GoogleLoginRequest(credential="google-id-token"),
            user_agent="unit-test",
            ip_address="127.0.0.1",
        )

        self.assertTrue(envelope.data.access_token)
        self.assertEqual(len(repository.users), 1)
        self.assertEqual(repository.users[1]["email"], "person@example.com")
        self.assertEqual(repository.users[1]["metadata"]["google"]["sub"], "google-sub-123")
        self.assertEqual(repository.touched_user_ids, [1])
        self.assertEqual(len(repository.sessions), 1)
        self.assertEqual(repository.sessions[0]["user_agent"], "unit-test")

    def test_google_login_links_existing_verified_email_user(self) -> None:
        repository = FakeAuthRepository()
        existing_user_id = repository.create_user(
            email="person@example.com",
            password_hash="pbkdf2_sha256$1$salt$digest",
            full_name=None,
            role_id=4,
            metadata={},
        )
        service = AuthService(repository)  # type: ignore[arg-type]
        service._verify_google_credential = lambda credential: build_google_identity()  # type: ignore[method-assign]

        service.login_with_google(GoogleLoginRequest(credential="google-id-token"))

        self.assertEqual(len(repository.users), 1)
        self.assertEqual(repository.users[existing_user_id]["metadata"]["google"]["sub"], "google-sub-123")
        self.assertEqual(repository.users[existing_user_id]["full_name"], "Person Example")

    def test_google_identity_requires_verified_email(self) -> None:
        previous_client_id = config.google_client_id
        config.google_client_id = "client-id.apps.googleusercontent.com"
        service = AuthService(FakeAuthRepository())  # type: ignore[arg-type]
        claims = {
            "aud": config.google_client_id,
            "iss": "https://accounts.google.com",
            "exp": str(int((datetime.now(UTC) + timedelta(minutes=5)).timestamp())),
            "sub": "google-sub-123",
            "email": "person@example.com",
            "email_verified": "false",
        }

        try:
            with self.assertRaises(UnauthorizedError):
                service._build_google_identity(claims)
        finally:
            config.google_client_id = previous_client_id


if __name__ == "__main__":
    unittest.main(verbosity=2)
