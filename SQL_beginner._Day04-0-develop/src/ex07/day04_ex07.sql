INSERT INTO person_visits
VALUES ((SELECT MAX(id) FROM person_visits) + 1,
        (SELECT p.id FROM person p WHERE p.name = 'Dmitriy'),
        (SELECT q1.id
         FROM (SELECT *
               FROM pizzeria pi) q1
                  JOIN (SELECT * FROM menu m WHERE m.price < 800) q2
                       ON q1.id = q2.pizzeria_id
         EXCEPT
          (SELECT pi.id
          from pizzeria pi
          join mv_dmitriy_visits_and_eats mdvae
          on pi.name = mdvae.name)
         ORDER BY 1
         LIMIT 1),
        TIMESTAMP '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;