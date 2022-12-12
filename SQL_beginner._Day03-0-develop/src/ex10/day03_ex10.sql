INSERT INTO person_order
VALUES ((SELECT MAX(id) FROM person_order) + 1,
        (SELECT p.id FROM person p WHERE p.name = 'Denis'),
        (SELECT m.id FROM menu m WHERE m.pizza_name = 'sicilian pizza'),
        TIMESTAMP '2022-02-24'),

       ((SELECT MAX(id) FROM person_order) + 2,
        (SELECT p.id FROM person p WHERE p.name = 'Irina'),
        (SELECT m.id FROM menu m WHERE m.pizza_name = 'sicilian pizza'),
        TIMESTAMP '2022-02-24');