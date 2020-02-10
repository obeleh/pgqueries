SELECT
    c.relname AS object_name,
    CASE
        when c.relkind='r' then 'table'
        when c.relkind='i' then 'index'
        when c.relkind='S' then 'sequence'
        else 'others'
    END AS type,pg_relation_size(c.relname::text) AS size,
    pg_size_pretty(pg_relation_size(c.relname::text)) AS pretty_size
FROM
    pg_class c
    JOIN pg_roles r ON r.oid = c.relowner
    LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
WHERE
    (c.relkind = ANY (ARRAY['r'::"char", 'i'::"char", 'S'::"char",''::"char"])) AND
    n.nspname = 'public'
ORDER BY
    pg_relation_size(c.relname::text) DESC;
