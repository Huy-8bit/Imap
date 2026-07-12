from __future__ import annotations

import argparse
import sys

from backend.domain.auth.security import hash_password
from backend.libs.database import get_postgresql, setup_postgresql
from backend.service.config import config


def main() -> None:
    parser = argparse.ArgumentParser(description="Create or promote an Admin user.")
    parser.add_argument("--email", default="admin@imap.prod", help="Admin email address")
    parser.add_argument("--password", default="Admin1234!", help="Admin password")
    parser.add_argument("--full-name", default="System Administrator", help="Admin full name")
    args = parser.parse_args()

    db = setup_postgresql(
        host=config.pg_host,
        port=config.pg_port,
        database=config.pg_database,
        user=config.pg_user,
        password=config.pg_password,
        min_connections=config.pg_min_conn,
        max_connections=config.pg_max_conn,
    )

    try:
        # Check if user_roles are seeded, get admin role ID
        role = db.fetch_one("SELECT id FROM user_roles WHERE code = 'admin'")
        if role is None:
            print("Error: 'admin' role not found in user_roles table. Please run migrations and seed taxonomies first.", file=sys.stderr)
            sys.exit(1)
        admin_role_id = int(role["id"])

        password_hash = hash_password(args.password)

        # Check if user already exists
        user = db.fetch_one("SELECT id FROM users WHERE email = %s", (args.email,))
        if user is None:
            # Insert new user
            db.execute(
                """
                INSERT INTO users (email, hashed_password, full_name, role_id, is_active, is_verified)
                VALUES (%s, %s, %s, %s, TRUE, TRUE)
                """,
                (args.email, password_hash, args.full_name, admin_role_id)
            )
            print(f"Successfully created new Admin user: {args.email}")
        else:
            # Update existing user role and password
            user_id = int(user["id"])
            db.execute(
                """
                UPDATE users
                SET role_id = %s, hashed_password = %s, full_name = %s, is_active = TRUE, is_verified = TRUE, updated_at = NOW()
                WHERE id = %s
                """,
                (admin_role_id, password_hash, args.full_name, user_id)
            )
            print(f"Successfully promoted existing user to Admin and updated password: {args.email}")

    finally:
        get_postgresql().close()


if __name__ == "__main__":
    main()