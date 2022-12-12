WITH people AS (SELECT *
                FROM person p
                WHERE p.gender = 'male'
                  AND p.address IN ('Moscow', 'Samara')),
     orders AS (SELECT people.name,
                       po.*,
                       m.pizza_name
                FROM person_order po
                         JOIN people ON po.person_id = people.id
                         JOIN menu m ON po.menu_id = m.id)
SELECT DISTINCT orders.name
FROM orders
WHERE orders.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY name DESC;
