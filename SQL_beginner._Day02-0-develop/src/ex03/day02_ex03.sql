WITH visits AS (SELECT pv.visit_date
                FROM person_visits AS pv
                WHERE pv.person_id = 1
                   OR pv.person_id = 2),
     dates AS (SELECT day::date AS missing_date
               FROM GENERATE_SERIES(timestamp '2022-01-01', '2022-01-10', '1 day') AS day)
SELECT dates.missing_date
FROM dates
         LEFT JOIN visits ON dates.missing_date = visits.visit_date
WHERE visit_date IS NULL
ORDER BY 1;

