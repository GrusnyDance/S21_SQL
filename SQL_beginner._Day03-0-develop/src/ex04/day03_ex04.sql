WITH people AS (SELECT p.gender, pi.name
                FROM person_order po
                         JOIN
                     person p ON po.person_id = p.id
                         JOIN menu m ON po.menu_id = m.id
                         JOIN pizzeria pi ON m.pizzeria_id = pi.id),
     women AS (SELECT p1.name AS pizzeria_name
               FROM people p1
               WHERE p1.gender = 'female'),
     men AS (SELECT p2.name AS pizzeria_name
             FROM people p2
             WHERE p2.gender = 'male'),
     only_women AS (SELECT *
                    FROM women
                    EXCEPT
                    SELECT *
                    FROM men),
     only_men AS (SELECT *
                  FROM men
                  EXCEPT
                  SELECT *
                  FROM women)
SELECT *
FROM only_women
UNION
SELECT *
FROM only_men
ORDER BY 1;
