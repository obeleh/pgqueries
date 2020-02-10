SELECT
    now() - query_start as "runtime",
    usename,
    datname,
    waiting,
    state,
    query
FROM
    pg_stat_activity
WHERE
    now() - query_start > '10 seconds'::interval
ORDER BY runtime DESC;
