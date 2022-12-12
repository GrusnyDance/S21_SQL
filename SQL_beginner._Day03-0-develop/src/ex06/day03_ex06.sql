WITH main AS (SELECT m.pizza_name,
                     pi.name,
                     m.price,
                     pi.id
              FROM menu m
                       JOIN pizzeria pi
                            ON m.pizzeria_id = pi.id)
SELECT q1.pizza_name,
       q1.name   AS pizzeria_name_1,
       main.name AS pizzeria_name_2,
       q1.price
FROM (SELECT * FROM main) q1
         JOIN main ON q1.price = main.price AND q1.pizza_name = main.pizza_name AND q1.id > main.id
ORDER BY 1;
