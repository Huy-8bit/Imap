from __future__ import annotations

from typing import Any
from backend.libs.database import PostgreSQLClient
from .schemas import UserCreate, UserUpdate, UserRole

class UserRepository:
    def __init__(self, client: PostgreSQLClient) -> None:
        self._client = client

    def create_user(self, payload: UserCreate, hashed_password: str) -> dict[str, Any]:
        """Tạo user mới với dữ liệu đã được validate và hash password"""
        query = """
            INSERT INTO users (
                email, 
                full_name, 
                phone, 
                password_hash, 
                role, 
                organization_id,
                is_active
            )
            VALUES (%(email)s, %(full_name)s, %(phone)s, %(password_hash)s, %(role)s, %(organization_id)s, True)
            RETURNING id, email, full_name, phone, role, organization_id, is_active, created_at, updated_at
        """
        params = {
            "email": payload.email,
            "full_name": payload.full_name,
            "phone": getattr(payload, "phone", None), # An toàn nếu schema chưa có phone
            "password_hash": hashed_password,
            "role": payload.role.value,
            "organization_id": payload.organization_id
        }
        return self._client.fetch_one(query, params)

    def get_user_by_email(self, email: str) -> dict[str, Any] | None:
        query = """
            SELECT id, email, full_name, password_hash, role, organization_id, is_active 
            FROM users 
            WHERE email = %(email)s
        """
        return self._client.fetch_one(query, {"email": email})

    def get_user_by_id(self, user_id: int) -> dict[str, Any] | None:
        query = """
            SELECT id, email, full_name, phone, role, organization_id, is_active, created_at, updated_at
            FROM users 
            WHERE id = %(user_id)s
        """
        return self._client.fetch_one(query, {"user_id": user_id})

    def list_users(self, role: UserRole | None = None) -> list[dict[str, Any]]:
        query = """
            SELECT id, email, full_name, phone, role, organization_id, is_active, created_at, updated_at
            FROM users
        """
        params = {}
        if role:
            query += " WHERE role = %(role)s"
            params["role"] = role.value
            
        query += " ORDER BY created_at DESC"
        return self._client.fetch_all(query, params)

    def update_user(self, user_id: int, update_dict: dict[str, Any]) -> dict[str, Any] | None:
        """
        Cập nhật thông tin user. 
        Lưu ý: Nhận vào một dict đã lọc/xử lý thay vì nhận trực tiếp Schema object 
        để linh hoạt hơn trong việc xử lý password.
        """
        if not update_dict:
            return self.get_user_by_id(user_id)

        set_clauses = []
        for key in update_dict.keys():
            set_clauses.append(f"{key} = %({key})s")
        
        query = f"""
            UPDATE users 
            SET {", ".join(set_clauses)}, updated_at = NOW()
            WHERE id = %(user_id)s
            RETURNING id, email, full_name, phone, role, organization_id, is_active, created_at, updated_at
        """
        params = {**update_dict, "user_id": user_id}
        return self._client.fetch_one(query, params)