SELECT pi.name,
       COUNT(pi.name)         AS count_of_orders,
       ROUND(AVG(m.price), 2) AS average_price,
       MAX(m.price)           AS max_price,
       MIN(m.price)           AS min_price
FROM person_order po
         JOIN menu m ON po.menu_id = m.id
         JOIN pizzeria pi ON m.pizzeria_id = pi.id
GROUP BY 1
ORDER BY 1;