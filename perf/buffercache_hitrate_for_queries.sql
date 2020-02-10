CREATE EXTENSION IF NOT EXISTS pg_buffercache;

SELECT
    queryid,
    calls,
    total_time/1000/60 total_minutes,
    (total_time/calls)/1000 avg_per_q,
    rows,
    coalesce((100.0 * shared_blks_hit / nullif(shared_blks_hit + shared_blks_read, 0))::TEXT, '0%%') AS hit_percent
FROM
    pg_stat_statements
ORDER BY total_time DESC LIMIT 10;