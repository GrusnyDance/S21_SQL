CREATE FUNCTION func_minimum(VARIADIC arr numeric[]) RETURNS numeric AS
$$
SELECT MIN($1[i])
FROM GENERATE_SUBSCRIPTS($1, 1) g(i);
$$ LANGUAGE SQL;

SELECT func_minimum(VARIADIC arr => ARRAY [10.0, -1.0, 5.0, 4.4]);
