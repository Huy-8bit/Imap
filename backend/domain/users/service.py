from __future__ import annotations

import logging
from passlib.context import CryptContext
from backend.libs.http.errors import AppError, NotFoundError

from .repository import UserRepository
from .validators import validate_password_strength 
from .schemas import (
    UserCreate, 
    UserUpdate, 
    UserResponse, 
    UserEnvelope, 
    UserListEnvelope,
    LoginRequest,
    AuthEnvelope,
    TokenData,
    UserRole
)

logger = logging.getLogger(__name__)
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

class UserService:
    def __init__(self, repository: UserRepository) -> None:
        self._repository = repository

    def _hash_password(self, password: str) -> str:
        return pwd_context.hash(password)

    def _verify_password(self, plain_password: str, hashed_password: str) -> bool:
        return pwd_context.verify(plain_password, hashed_password)

    def register_user(self, payload: UserCreate) -> UserEnvelope:
        existing_user = self._repository.get_user_by_email(payload.email)
        if existing_user:
            raise AppError("Email already registered", status_code=400)

        hashed_password = self._hash_password(payload.password)

        row = self._repository.create_user(payload, hashed_password)
        
        user_data = UserResponse.model_validate(row)
        return UserEnvelope(data=user_data)

    def login(self, payload: LoginRequest) -> AuthEnvelope:
        user_row = self._repository.get_user_by_email(payload.email)
        if not user_row:
            raise AppError("Invalid email or password", status_code=401)

        if not self._verify_password(payload.password, user_row["password_hash"]):
            raise AppError("Invalid email or password", status_code=401)

        if not user_row["is_active"]:
            raise AppError("Account is disabled", status_code=403)

        token_data = TokenData(access_token="mock-jwt-token", token_type="bearer")
        
        return AuthEnvelope(data=token_data)

    def get_profile(self, user_id: int) -> UserEnvelope:
        row = self._repository.get_user_by_id(user_id)
        if not row:
            raise NotFoundError("User not found")
        
        return UserEnvelope(data=UserResponse.model_validate(row))

    def update_user_profile(self, user_id: int, payload: UserUpdate) -> UserEnvelope:
        update_dict = payload.model_dump(exclude_unset=True)
        
        if "password" in update_dict:
            update_dict["password_hash"] = self._hash_password(update_dict.pop("password"))

        row = self._repository.update_user(user_id, update_dict)
        if not row:
            raise NotFoundError("User not found")

        return UserEnvelope(data=UserResponse.model_validate(row))

    def list_all_users(self, current_user_role: UserRole) -> UserListEnvelope:
        if current_user_role != UserRole.IID_ADMIN:
            raise AppError("Permission denied", status_code=403)

        rows = self._repository.list_users()
        items = [UserResponse.model_validate(row) for row in rows]
        return UserListEnvelope(data=items)