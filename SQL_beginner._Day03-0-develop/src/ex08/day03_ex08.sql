INSERT INTO menu
VALUES ((SELECT MAX(id) FROM menu) + 1,
        (SELECT pi.id FROM pizzeria pi WHERE pi.name = 'Dominos'),
        'sicilian pizza',
        900);