from __future__ import annotations

import json
import logging
from typing import Any

logger = logging.getLogger(__name__)


def write_audit_log(
    cursor: Any,
    *,
    event_type: str,
    actor_id: int,
    actor_role: str,
    actor_email: str,
    org_id: int | None = None,
    entity_type: str | None = None,
    entity_id: int | None = None,
    old_value: dict[str, Any] | None = None,
    new_value: dict[str, Any] | None = None,
    reason: str | None = None,
    ip_address: str | None = None,
    session_id: str | None = None,
) -> int:
    """INSERT một dòng vào audit_log trong cùng transaction với caller.

    Phải gọi trong khối `with db.cursor() as cursor:` để đảm bảo atomicity.
    audit_log có RLS FORCE — không UPDATE/DELETE được, append-only (migration 0009).

    Returns: id của audit_log row vừa tạo.
    """
    try:
        cursor.execute(
            """
            SELECT write_audit_log(
                %(event_type)s,
                %(actor_id)s,
                %(actor_role)s,
                %(actor_email)s,
                %(org_id)s,
                %(entity_type)s,
                %(entity_id)s,
                %(old_value)s::jsonb,
                %(new_value)s::jsonb,
                %(reason)s,
                %(ip_address)s::inet,
                %(session_id)s
            ) AS audit_id
            """,
            {
                "event_type": event_type,
                "actor_id": actor_id,
                "actor_role": actor_role,
                "actor_email": actor_email,
                "org_id": org_id,
                "entity_type": entity_type,
                "entity_id": entity_id,
                "old_value": json.dumps(old_value or {}, ensure_ascii=False),
                "new_value": json.dumps(new_value or {}, ensure_ascii=False),
                "reason": reason,
                "ip_address": ip_address,
                "session_id": session_id,
            },
        )
        row = cursor.fetchone()
        return int(row["audit_id"]) if row else 0
    except Exception as exc:
        logger.error(
            "audit_log write failed: event_type=%s actor=%s error=%s",
            event_type,
            actor_id,
            exc,
        )
        raise
