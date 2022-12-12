SELECT DISTINCT pi.name, pi.rating
FROM pizzeria pi
         LEFT JOIN person_visits pv ON
    pi.id = pv.pizzeria_id
WHERE pv.pizzeria_id IS NULL;