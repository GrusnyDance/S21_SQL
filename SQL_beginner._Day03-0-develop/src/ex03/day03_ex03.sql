WITH people AS (SELECT p.gender, pi.name
                FROM person_visits pv
                         JOIN
                     person p ON pv.person_id = p.id
                         JOIN pizzeria pi ON pv.pizzeria_id = pi.id),
     women AS (SELECT p1.name AS pizzeria_name
               FROM people p1
               WHERE p1.gender = 'female'),
     men AS (SELECT p2.name AS pizzeria_name
             FROM people p2
             WHERE p2.gender = 'male'),
     only_women AS (SELECT *
                    FROM women
                    EXCEPT ALL
                    SELECT *
                    FROM men),
     only_men AS (SELECT *
                  FROM men
                  EXCEPT ALL
                  SELECT *
                  FROM women)
SELECT *
FROM only_women
UNION ALL
SELECT *
FROM only_men
ORDER BY 1;

