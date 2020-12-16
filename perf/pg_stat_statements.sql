CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

SELECT
    query,
    calls, total_time, rows,
    100.0 * shared_blks_hit / nullif(shared_blks_hit + shared_blks_read, 0) AS hit_percent
FROM
    pg_stat_statements
ORDER BY
    total_time DESC
LIMIT 1;