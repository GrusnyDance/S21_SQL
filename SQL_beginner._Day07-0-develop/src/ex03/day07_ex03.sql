SELECT q.name, SUM(q.total_count) AS total_count
FROM ((SELECT pi.name,
              COUNT(pizzeria_id) AS total_count
       FROM person_visits AS pv
                JOIN pizzeria pi ON pv.pizzeria_id = pi.id
       GROUP BY 1
       ORDER BY 2 DESC)
      UNION ALL
      (SELECT pi.name,
              COUNT(pi.name) AS total_count
       FROM person_order po
                JOIN menu m ON po.menu_id = m.id
                JOIN pizzeria pi ON m.pizzeria_id = pi.id
       GROUP BY 1
       ORDER BY 2 DESC)) q
GROUP BY q.name
ORDER BY 2 DESC, 1 ASC;
