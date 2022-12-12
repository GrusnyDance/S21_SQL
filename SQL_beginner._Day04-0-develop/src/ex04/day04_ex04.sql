CREATE VIEW v_symmetric_union
AS
WITH R AS (SELECT *
           FROM person_visits pv
           WHERE pv.visit_date = '2022-01-02'),
     S AS (SELECT *
           FROM person_visits pv
           WHERE pv.visit_date = '2022-01-06'),
     R_diff AS (SELECT R.person_id
                FROM R
                EXCEPT
                SELECT S.person_id
                FROM S),
     S_diff AS (SELECT S.person_id
                FROM S
                EXCEPT
                SELECT R.person_id
                FROM R)
SELECT *
FROM R_diff
UNION
SELECT *
FROM S_diff
ORDER BY 1;