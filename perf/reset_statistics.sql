-- Find table oid by name
SELECT oid FROM pg_class c WHERE relname = 'table_name';
-- Reset counts for all indexes of table
SELECT pg_stat_reset_single_table_counters(14662536);