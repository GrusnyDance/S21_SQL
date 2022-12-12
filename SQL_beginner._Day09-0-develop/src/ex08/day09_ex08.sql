CREATE OR REPLACE FUNCTION fnc_fibonacci(IN FNum integer DEFAULT 10)
    RETURNS SETOF INTEGER
    LANGUAGE SQL
AS
$dbrnd$
WITH RECURSIVE cte(Num1, Num2) AS
                   (VALUES (0, 1)
                    UNION ALL
                    SELECT GREATEST(Num1, Num2),
                           Num1 + Num2 AS FibonacciSeries
                    FROM cte
                    WHERE Num2 < FNum)
SELECT Num1
FROM cte;
$dbrnd$;

SELECT *
FROM fnc_fibonacci(100);
SELECT *
FROM fnc_fibonacci();