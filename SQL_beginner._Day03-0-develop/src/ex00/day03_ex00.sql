WITH visits AS (SELECT pv.person_id, pv.pizzeria_id, pv.visit_date
                FROM person_visits pv
                         JOIN (SELECT * FROM person WHERE person.name = 'Kate') q1
                              ON pv.person_id = q1.id),
     pizzerias AS (SELECT pi.id, pi.name, visits.visit_date
                   FROM pizzeria pi
                            JOIN visits ON
                       pi.id = visits.pizzeria_id),
     prices AS (SELECT *
                FROM menu m
                         JOIN pizzerias ON m.pizzeria_id = pizzerias.id)
SELECT pr.pizza_name,
       pr.price,
       pr.name AS pizzeria_name,
       pr.visit_date
FROM prices pr
WHERE pr.price BETWEEN 800 AND 1000
ORDER BY 1, 2, 3, 4;