from fastapi import APIRouter, Depends, HTTPException
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from libs.auth.password import hash_password, verify_password
from libs.auth.jwt import create_access_token, decode_token

router = APIRouter(prefix="/auth", tags=["auth"])
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="/auth/login")

# Tạm dùng dict, sau thay bằng DB thật
fake_db = {}

@router.post("/register")
def register(form: OAuth2PasswordRequestForm = Depends()):
    if form.username in fake_db:
        raise HTTPException(status_code=400, detail="User is already existed")
    fake_db[form.username] = hash_password(form.password)
    return {"message": "Registed successfully"}

@router.post("/login")
def login(form: OAuth2PasswordRequestForm = Depends()):
    hashed = fake_db.get(form.username)
    if not hashed or not verify_password(form.password, hashed):
        raise HTTPException(status_code=401, detail="Wrong username or password")
    token = create_access_token({"sub": form.username})
    return {"access_token": token, "token_type": "bearer"}

@router.get("/me")
def me(token: str = Depends(oauth2_scheme)):
    payload = decode_token(token)
    return {"username": payload.get("sub")}