WITH pizza AS (SELECT *
               FROM menu
               WHERE menu.pizza_name IN ('mushroom pizza', 'pepperoni pizza'))
SELECT pizza.pizza_name,
       pi.name AS pizzeria_name,
       pizza.price
FROM pizza
         JOIN pizzeria AS pi
              ON pizza.pizzeria_id = pi.id
ORDER BY 1, 2;