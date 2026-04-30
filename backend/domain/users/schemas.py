from __future__ import annotations

from datetime import datetime
from enum import Enum
from typing import Any, Optional

from pydantic import BaseModel, ConfigDict, EmailStr, Field

class UserRole(str, Enum):
    IID_ADMIN = "iid_admin"       
    BUSINESS_USER = "business"    
    VIEWER = "viewer"             


class UserBase(BaseModel):
    email: EmailStr
    full_name: str
    phone: str
    role: UserRole = UserRole.VIEWER
    organization_id: Optional[int] = None


class UserCreate(UserBase):
    password: str = Field(..., min_length=8)


class UserUpdate(BaseModel):
    full_name: Optional[str] = None
    role: Optional[UserRole] = None
    organization_id: Optional[int] = None
    is_active: Optional[bool] = None


class LoginRequest(BaseModel):
    email: EmailStr
    password: str


# --- Response Schemas (Dữ liệu trả về cho Client) ---

class UserResponse(UserBase):
    id: int
    is_active: bool
    created_at: datetime
    updated_at: datetime

    # Cho phép map trực tiếp từ Row của Database (tương thích Pydantic v2)
    model_config = ConfigDict(from_attributes=True)


class TokenData(BaseModel):
    access_token: str
    token_type: str = "bearer"


# --- Envelopes (Định dạng chuẩn của dự án) ---

class UserEnvelope(BaseModel):
    """Chuẩn trả về cho 1 User đơn lẻ"""
    success: bool = True
    message: str = "ok"
    data: UserResponse


class UserListEnvelope(BaseModel):
    """List of users"""
    success: bool = True
    message: str = "ok"
    data: list[UserResponse]
    # Dùng Any để tương thích với PaginationMeta trong project của bạn
    meta: Optional[dict[str, Any]] = None 


class AuthEnvelope(BaseModel):
    success: bool = True
    message: str = "Login successful"
    data: TokenData