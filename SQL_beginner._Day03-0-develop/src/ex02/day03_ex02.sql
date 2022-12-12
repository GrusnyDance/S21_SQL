WITH orders AS (SELECT m.id AS menu_id
                FROM menu m
                EXCEPT
                SELECT po.menu_id
                FROM person_order po
                ORDER BY 1),
     pizzas AS (SELECT *
                FROM menu
                         RIGHT JOIN orders ON menu.id = orders.menu_id)
SELECT pizzas.pizza_name,
       pizzas.price,
       pi.name AS pizzeria_name
FROM pizzas
         JOIN pizzeria pi ON pizzas.pizzeria_id = pi.id
ORDER BY 1, 2;
