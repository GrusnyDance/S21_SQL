-- Session 1
BEGIN;

-- Session 2
BEGIN;

-- Session 1
UPDATE pizzeria SET rating = 2 WHERE name = 'Pizza Hut';

-- Session 2
UPDATE pizzeria SET rating = 3 WHERE name = 'Dominos';

-- Session 1
UPDATE pizzeria SET rating = 1 WHERE name = 'Dominos';

-- Session 2
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';

-- Session 1
COMMIT;

-- Session 1
COMMIT;

