-- Session 1
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session 2
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session 1
BEGIN;

-- Session 2
BEGIN;

-- Session 1
SELECT SUM(rating) FROM pizzeria;

-- Session 2
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
COMMIT;

-- Session 1
SELECT SUM(rating) FROM pizzeria;
COMMIT;

-- Session 1
SELECT SUM(rating) FROM pizzeria;

-- Session 2
SELECT SUM(rating) FROM pizzeria;
