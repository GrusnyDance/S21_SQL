SELECT m.pizza_name
FROM menu AS m
UNION
SELECT m.pizza_name
FROM menu AS m
ORDER BY pizza_name DESC;