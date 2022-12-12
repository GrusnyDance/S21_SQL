-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH cur_cte AS (SELECT b.user_id     AS bui,
                        b.money,
                        b.updated,
                        c.name        AS cur_name,
                        c.rate_to_usd AS cur_rate,
                        c.updated     AS cur_updated
                 FROM balance b
                          JOIN currency c
                               ON b.currency_id = c.id),

     all_join AS (SELECT q2.id, q2.cur_name, q2.money, q2.updated, COALESCE(q1.diff, q2.diff) new_diff
                  FROM (SELECT cur_cte.bui AS id, cur_name, money, updated, MIN(updated - cur_updated) AS diff
                        FROM cur_cte
                        WHERE updated - cur_updated > INTERVAL '0 days'
                        GROUP BY 1, 2, 3, 4) q1
                           FULL JOIN (SELECT cur_cte.bui                AS id,
                                             cur_name,
                                             money,
                                             updated,
                                             MAX(updated - cur_updated) AS diff
                                      FROM cur_cte
                                      WHERE updated - cur_updated < INTERVAL '0 days'
                                      GROUP BY 1, 2, 3, 4) q2
                                     ON q1.id = q2.id AND q1.cur_name = q2.cur_name AND q1.money = q2.money AND
                                        q1.updated = q2.updated)

SELECT COALESCE(u.name, 'not defined'),
       COALESCE(u.lastname, 'not defined'),
       aj.cur_name,
       aj.money * cu.rate_to_usd AS currency_in_usd
FROM all_join aj
         LEFT JOIN "user" u ON aj.id = u.id
         LEFT JOIN currency cu ON aj.new_diff = (aj.updated - cu.updated) AND aj.cur_name = cu.name
ORDER BY 1 DESC, 2 ASC, 3 ASC;


