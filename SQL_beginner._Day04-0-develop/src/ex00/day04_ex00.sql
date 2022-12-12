CREATE VIEW v_persons_female
AS
SELECT *
FROM person p
WHERE p.gender = 'female';

CREATE VIEW v_persons_male
AS
SELECT *
FROM person p
WHERE p.gender = 'male';