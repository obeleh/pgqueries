pg_dump \
  --format=custom \
  --compress=9 \
  --file=<file_name> \
  --no-owner \
  --no-acl \
  --host=$PGHOST \
  --user=$PGUSER \
  --port=$PGPORT \
  <database_name>
