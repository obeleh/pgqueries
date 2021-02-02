-- normal example
REINDEX INDEX index_name;

-- The previous methods will obtain a lock on the table and prevent it from being changed while the operation is in progress,
-- which is usually unacceptable. To rebuild the index without locking it for updates, you can rebuilt the index concurrently:
REINDEX INDEX CONCURRENTLY index_name;

-- Identify invalid indexes that were created during index rebuild
SELECT
    c.relname as index_name,
    pg_size_pretty(pg_relation_size(c.oid))
FROM
    pg_index i
    JOIN pg_class c ON i.indexrelid = c.oid
WHERE
    -- New index built using REINDEX CONCURRENTLY
    c.relname LIKE  '%_ccnew'
    -- In INVALID state
    AND NOT indisvalid
LIMIT 10;