CREATE DATABASE yourdbname;
CREATE USER youruser WITH ENCRYPTED PASSWORD 'yourpass';
GRANT ALL PRIVILEGES ON DATABASE yourdbname TO youruser;

/*
pg_restore \
  --dbname=yourdbname \
  --single-transaction \
  --no-owner \
  --username youruser \
  --no-acl \
  -n public \
  /tmp/my.dump
  --password

If you get psql: FATAL:  Peer authentication failed for user "youruser"
You need to edit pg_hba.conf to allow clients to connect over TCP
 */