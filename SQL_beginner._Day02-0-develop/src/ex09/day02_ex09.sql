WITH women AS (SELECT *
               FROM person p
               WHERE p.gender = 'female'),
     orders AS (SELECT women.name,
                       po.*,
                       m.pizza_name
                FROM person_order po
                         JOIN women ON po.person_id = women.id
                         JOIN menu m ON po.menu_id = m.id)
SELECT ord.name
FROM orders AS ord
WHERE ord.pizza_name = 'cheese pizza'
  AND EXISTS(SELECT orders.name
             FROM orders
             WHERE orders.pizza_name = 'pepperoni pizza'
               AND orders.name = ord.name);
