CREATE VIEW v_generated_dates
AS
SELECT day::date AS generated_date
FROM GENERATE_SERIES(TIMESTAMP '2022-01-01', '2022-01-31', '1 day') day
ORDER BY 1;