-- normal example
VACUUM FULL table_name;


-- pg_repack example
CREATE EXTENSION pg_repack;

--bash: pg_repack -k --table table_name db_name

--rds docs: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Appendix.PostgreSQL.CommonDBATasks.html#Appendix.PostgreSQL.CommonDBATasks.pg_repack