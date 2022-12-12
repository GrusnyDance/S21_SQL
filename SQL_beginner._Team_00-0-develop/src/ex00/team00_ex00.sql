CREATE TABLE IF NOT EXISTS nodes_name (
    point1 char NOT NULL,
    point2 char NOT NULL,
    cost   int  NOT NULL
);

INSERT INTO nodes_name (point1, point2, cost)
VALUES ('A', 'B', 10),
       ('B', 'A', 10),
       ('A', 'C', 15),
       ('C', 'A', 15),
       ('C', 'B', 35),
       ('B', 'C', 35),
       ('A', 'D', 20),
       ('D', 'A', 20),
       ('C', 'D', 30),
       ('D', 'C', 30),
       ('D', 'B', 25),
       ('B', 'D', 25);

CREATE VIEW v_tmp_way AS (
WITH RECURSIVE tour_way AS (
    SELECT
        point1::bpchar as tour,
        point1,
        point2,
        cost,
        cost as sum
    FROM
        nodes_name
    WHERE
        point1 = 'A'
    UNION ALL
    SELECT
        parent.tour|| ',' || parent.point2 as tour,
        child.point1,
        child.point2,
        parent.cost,
        parent.sum + child.cost AS sum
    FROM
        nodes_name as child
    INNER JOIN tour_way as parent ON child.point1 = parent.point2
    WHERE tour NOT LIKE '%' || parent.point2 || '%'
)
SELECT * FROM tour_way
);

SELECT sum as total_cost,
       '{' || tour || ',' || point2 || '}' as tour
FROM v_tmp_way
WHERE length(tour) = 7 AND
      point2 = 'A' AND
      sum = (SELECT min(sum) FROM v_tmp_way WHERE length(tour) = 7 AND point2 = 'A')
ORDER BY 1,2;


