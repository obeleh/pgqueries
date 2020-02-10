REVOKE ALL ON DATABASE mydb FROM public;  -- shut out the general public
GRANT CONNECT ON DATABASE mydb TO mygrp;  -- since we revoked from public

GRANT USAGE ON SCHEMA public TO mygrp;
-- To assign a user all privileges to all tables like you wrote (I might be more restrictive):

GRANT ALL ON ALL TABLES IN SCHEMA public TO mygrp;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO mygrp; -- don't forget those

--To set default privileges for future objects, run for every role that creates objects in this schema:

ALTER DEFAULT PRIVILEGES FOR ROLE myusr IN SCHEMA public
GRANT ALL ON TABLES TO mygrp;

ALTER DEFAULT PRIVILEGES FOR ROLE myusr IN SCHEMA public
GRANT ALL ON SEQUENCES TO mygrp;