SELECT DISTINCT visit.person_id
FROM person_visits AS visit
WHERE (visit.visit_date BETWEEN '2022-01-06' AND '2022-01-09')
   OR visit.pizzeria_id = 2
ORDER BY visit.person_id DESC;