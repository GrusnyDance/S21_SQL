WITH orders AS (SELECT *
                FROM person_order po
                         RIGHT JOIN (SELECT * FROM person WHERE person.name IN ('Denis', 'Anna')) AS p
                                    ON po.person_id = p.id)
SELECT m.pizza_name,
       pi.name AS pizzeria_name
FROM menu m
         JOIN orders ON m.id = orders.menu_id
         JOIN pizzeria pi ON m.pizzeria_id = pi.id
ORDER BY 1, 2;