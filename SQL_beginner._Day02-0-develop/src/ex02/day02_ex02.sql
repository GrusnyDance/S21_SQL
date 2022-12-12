SELECT COALESCE(p.name, '-')  AS person_name,
       q1.visit_date          AS visit_date,
       COALESCE(pi.name, '-') AS pizzeria_name
FROM person AS p
         FULL JOIN (SELECT *
                    FROM person_visits AS pv
                    WHERE pv.visit_date BETWEEN '2022-01-01' AND '2022-01-03') q1
                   ON p.id = q1.person_id
         FULL JOIN pizzeria AS pi
                   ON q1.pizzeria_id = pi.id
ORDER BY 1, 2, 3;
