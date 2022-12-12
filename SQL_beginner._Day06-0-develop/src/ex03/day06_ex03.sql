CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);

SET ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYZE
SELECT *
FROM person_discounts
WHERE person_id = 3
  AND pizzeria_id = 5;

-- INSERT INTO person_discounts
-- VALUES (1, 1, 1, 22);