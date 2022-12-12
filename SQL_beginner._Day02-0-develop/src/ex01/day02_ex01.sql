SELECT day::date AS missing_date
FROM GENERATE_SERIES(timestamp '2022-01-01', '2022-01-10', '1 day') AS day
         LEFT JOIN (SELECT pv.visit_date
                    FROM person_visits AS pv
                    WHERE pv.person_id = 1
                       OR pv.person_id = 2) q2
                   ON day = q2.visit_date
WHERE visit_date IS NULL
ORDER BY 1;

