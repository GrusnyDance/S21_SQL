WITH visits AS (SELECT DISTINCT pi.name AS pizzeria_name
                FROM person_visits pv
                         JOIN (SELECT * FROM person p WHERE p.name = 'Andrey') q1
                              ON pv.person_id = q1.id
                         JOIN pizzeria pi ON pv.pizzeria_id = pi.id),
     orders AS (SELECT DISTINCT pi.name AS pizzeria_name
                FROM person_order po
                         JOIN (SELECT * FROM person p WHERE p.name = 'Andrey') q2
                              ON po.person_id = q2.id
                         JOIN menu m ON po.menu_id = m.id
                         JOIN pizzeria pi ON m.pizzeria_id = pi.id)
SELECT *
FROM visits
EXCEPT
SELECT *
FROM orders;