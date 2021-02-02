-- https://github.com/bucardo/check_postgres/blob/master/check_postgres.pl
-- default_warning  => 100,
-- default_critical => 150,

SELECT granted, mode, datname
FROM pg_locks l RIGHT JOIN pg_database d ON (d.oid=l.database)
WHERE d.datallowconn;