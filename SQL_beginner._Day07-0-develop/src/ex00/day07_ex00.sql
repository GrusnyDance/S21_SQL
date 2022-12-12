SELECT pv.person_id,
       COUNT(pv.pizzeria_id) AS count_of_visits
FROM person_visits pv
GROUP BY 1
ORDER BY 2 DESC, 1 ASC;