WITH main AS (SELECT p1.name    AS person_name1,
                     p2.name    AS person_name2,
                     p1.address AS common_address,
                     p1.id      AS id1,
                     p2.id      AS id2
              FROM person p1
                       JOIN person p2 ON p1.address = p2.address
              ORDER BY 1, 2, 3)
SELECT person_name1, person_name2, common_address
FROM main
WHERE id1 > id2;