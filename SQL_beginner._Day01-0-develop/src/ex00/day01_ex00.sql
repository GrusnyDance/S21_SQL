SELECT m.id AS object_id, m.pizza_name AS object_name
FROM menu AS m
UNION
SELECT p.id AS object_id, p.name AS object_name
FROM person AS p
ORDER BY object_id, object_name;