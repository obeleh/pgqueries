# Note: The env variable names chose here are actually picked up automatically
pg_restore \
  --host=$PGHOST \
  --user=$PGUSER \
  --port=$PGPORT \
  --dbname=<database_name> \
  --single-transaction \
  --no-owner \
  --no-acl \
  -n public \
  <file_name>
