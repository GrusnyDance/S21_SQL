INSERT INTO person_order(id, person_id, menu_id, order_date)
SELECT (GENERATE_SERIES(((SELECT MAX(id) FROM person_order) + 1),
                        ((SELECT MAX(id) FROM person_order) + (SELECT COUNT(*) FROM person)))),
       (GENERATE_SERIES((SELECT MIN(id) FROM person), (SELECT COUNT(*) FROM person))),
       (SELECT m.id FROM menu m WHERE m.pizza_name = 'greek pizza'),
       timestamp '2022-02-25';
