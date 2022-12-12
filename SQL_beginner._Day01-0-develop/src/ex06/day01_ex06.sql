SELECT DISTINCT po.order_date AS action_date,
                person.name   AS person_name
FROM person_order AS po
         JOIN person_visits ON po.order_date = person_visits.visit_date
         JOIN person ON po.person_id = person.id
ORDER BY action_date ASC, person_name DESC;