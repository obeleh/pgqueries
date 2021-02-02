SELECT
    relname,
    indexrelname,
    idx_scan,
    idx_tup_read,
    idx_tup_fetch,
    pg_size_pretty(pg_relation_size(indexrelname::regclass)) as size
FROM
    pg_stat_all_indexes
WHERE
    schemaname = 'public'
    AND indexrelname NOT LIKE 'pg_toast_%'
    AND idx_scan = 0
    AND idx_tup_read = 0
    AND idx_tup_fetch = 0
ORDER BY
    size DESC;