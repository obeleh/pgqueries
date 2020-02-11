-- https://tableplus.com/blog/2018/10/how-to-create-superuser-in-postgresql.html

-- CREATE USER is equivalent to CREATE ROLE except that CREATE USER assumes LOGIN by default, while CREATE ROLE does not.
CREATE ROLE rolename LOGIN SUPERUSER PASSWORD 'passwordstring';