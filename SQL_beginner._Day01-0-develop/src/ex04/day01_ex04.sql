SELECT po.person_id AS person_id
FROM person_order AS po
WHERE po.order_date = '2022-01-07'
EXCEPT ALL
SELECT pv.person_id AS person_id
FROM person_visits AS pv
WHERE pv.visit_date = '2022-01-07';