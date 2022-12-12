CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats
AS
WITH visits AS (SELECT * --visited only by Dmitriy on Jan 8
                FROM person_visits pv
                         RIGHT JOIN (SELECT *
                                     FROM person p
                                     WHERE p.name = 'Dmitriy') AS people
                                    ON pv.person_id = people.id
                WHERE pv.visit_date = '2022-01-08'),
     pizzerias AS (SELECT pi.id AS pi_id, pi.name --names of pizzerias visited by Dmitriy on Jan 8
                   FROM pizzeria pi
                            JOIN visits ON pi.id = visits.pizzeria_id),
     prices AS (SELECT pizzerias.name, --set of prices of pizzerias visited by Dmitriy on Jan 8
                       menu.price
                FROM pizzerias
                         JOIN menu ON pizzerias.pi_id = menu.pizzeria_id)
SELECT DISTINCT pr.name
FROM prices pr
WHERE pr.price < 800;


