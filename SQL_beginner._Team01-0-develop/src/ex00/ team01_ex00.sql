WITH u_volume
         AS (SELECT COALESCE(u.name, 'not defined')     AS name,
                    COALESCE(u.lastname, 'not defined') AS lastname,
                    b.type                              AS type,
                    SUM(b.money)                        AS volume,
                    b.currency_id
             FROM "user" AS u
                      FULL JOIN balance b ON u.id = b.user_id
             GROUP BY b.type, COALESCE(u.lastname, 'not defined'), COALESCE(u.name, 'not defined'), currency_id),
     b_cur_name
         AS (SELECT uv.name
                  , uv.lastname
                  , uv.type
                  , uv.volume
                  , COALESCE(c.name
             , 'not defined') AS currency_name
                  , uv.currency_id
             FROM u_volume AS uv
                      LEFT JOIN currency AS c ON c.id = uv.currency_id
             GROUP BY uv.name
                    , uv.lastname
                    , uv.type
                    , uv.volume
                    , COALESCE(c.name
                 , 'not defined')
                    , uv.currency_id),
     rtu
         AS (SELECT currency.id,
                    name,
                    rate_to_usd,
                    lastdate
             FROM (SELECT id,
                          MAX(updated) AS lastdate
                   FROM currency
                   GROUP BY 1) q1
                      LEFT JOIN currency ON q1.lastdate = currency.updated AND q1.id = currency.id)

SELECT b_cur_name.name                        AS name,
       lastname                               AS lastname,
       type,
       volume,
       currency_name,
       COALESCE(rate_to_usd, 1)               AS last_rate_to_usd,
       COALESCE(volume * rate_to_usd, volume) AS total_volume_in_usd
FROM b_cur_name
         LEFT JOIN rtu ON rtu.id = b_cur_name.currency_id
ORDER BY 1 DESC, 2 ASC, 3 ASC;