CREATE UNIQUE INDEX IF NOT EXISTS users_google_sub_unique_idx
    ON users ((metadata->'google'->>'sub'))
    WHERE (metadata->'google'->>'sub') IS NOT NULL;
