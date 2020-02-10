SELECT
  sum(heap_blks_read) as heap_read,
  sum(heap_blks_hit)  as heap_hit,
  (sum(heap_blks_hit)*100 / (sum(heap_blks_hit) + sum(heap_blks_read))) as ratio
FROM
  pg_statio_user_tables;

--


SELECT
  relname,
  heap_blks_read as heap_read,
  heap_blks_hit as heap_hit,
  ( (heap_blks_hit*100) / (heap_blks_hit + heap_blks_read)) as ratio
FROM
  pg_statio_user_tables
WHERE heap_blks_hit + heap_blks_read > 0
ORDER BY heap_blks_read DESC;