SELECT
    relname,
    seq_scan-idx_scan AS too_much_seq,
    CASE WHEN seq_scan-idx_scan>0 THEN 'Missing Index?' ELSE 'OK' END, pg_relation_size(relname::regclass) AS rel_size,
    seq_scan,
    idx_scan
FROM
    pg_stat_all_tables
WHERE
    schemaname='public' AND
    pg_relation_size(relname::regclass)>80000
ORDER BY too_much_seq DESC;


---


SELECT
    t.tablename,
    indexname,
    c.reltuples AS num_rows,
    pg_size_pretty(pg_relation_size(quote_ident(t.tablename)::text)) AS table_size,
    pg_size_pretty(pg_relation_size(quote_ident(indexrelname)::text)) AS index_size,
    CASE WHEN indisunique THEN 'Y'
       ELSE 'N'
    END AS UNIQUE,
    seq_scan,
    i.idx_scan AS idx_scans,
    i.idx_tup_read AS tuples_read,
    i.idx_tup_fetch AS tuples_fetched,
    100 * i.idx_scan/(i.idx_scan + ts.seq_scan) AS percent_index_use
FROM pg_tables t
LEFT OUTER JOIN pg_class c ON t.tablename=c.relname
LEFT OUTER JOIN
    ( SELECT c.relname AS ctablename, ipg.relname AS indexname, x.indnatts AS number_of_columns, idx_scan, idx_tup_read, idx_tup_fetch, indexrelname, indisunique FROM pg_index x
           JOIN pg_class c ON c.oid = x.indrelid
           JOIN pg_class ipg ON ipg.oid = x.indexrelid
           JOIN pg_stat_all_indexes psai ON x.indexrelid = psai.indexrelid )
    AS i
    ON t.tablename = i.ctablename
LEFT JOIN pg_stat_all_tables ts ON t.tablename = ts.relname
WHERE t.schemaname NOT IN ('pg_catalog', 'information_schema')
ORDER BY seq_scan * c.reltuples DESC, 1 ASC,2 ASC;