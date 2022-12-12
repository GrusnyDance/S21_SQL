SELECT *
FROM person_order
WHERE MOD(person_order.id, 2) = 0
ORDER BY id;