SELECT pe.id,
       pe.name,

       CASE
           WHEN (pe.age BETWEEN 10 AND 20) THEN 'interval #1'
           WHEN (pe.age > 20 AND pe.age < 24) THEN 'interval #2'
           ELSE 'interval #3' END AS interval_info

FROM person AS pe
ORDER BY interval_info;