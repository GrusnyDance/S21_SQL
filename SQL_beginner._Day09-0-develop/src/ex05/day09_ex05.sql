drop function fnc_persons_female(), fnc_persons_male();

CREATE FUNCTION fnc_persons(in pgender varchar default 'female')
    RETURNS TABLE
            (
                id      bigint,
                name    varchar,
                age     integer,
                gender  varchar,
                address varchar
            )
AS
$$
SELECT *
FROM person
WHERE pgender = person.gender
$$
    LANGUAGE SQL;

select *
from fnc_persons(pgender := 'male');
select *
from fnc_persons();