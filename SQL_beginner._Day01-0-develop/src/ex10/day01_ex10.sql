SELECT p.name          AS person_name,
       menu.pizza_name AS pizza_name,
       pi.name         AS pizzeria_name
FROM person AS p
         JOIN person_order AS po ON p.id = po.person_id
         JOIN menu ON po.menu_id = menu.id
         JOIN pizzeria pi ON menu.pizzeria_id = pi.id
ORDER BY 1, 2, 3;

