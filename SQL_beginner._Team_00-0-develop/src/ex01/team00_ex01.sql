(SELECT sum as total_cost,
       '{' || tour || ',' || point2 || '}' as tour
FROM v_tmp_way
WHERE length(tour) = 7 AND
      point2 = 'A' AND
      sum = (SELECT min(sum) FROM v_tmp_way WHERE length(tour) = 7 AND point2 = 'A')
ORDER BY 1,2)
UNION ALL
(SELECT sum as total_cost,
       '{' || tour || ',' || point2 || '}' as tour
FROM v_tmp_way
WHERE length(tour) = 7 AND
      point2 = 'A' AND
      sum = (SELECT max(sum) FROM v_tmp_way WHERE length(tour) = 7 AND point2 = 'A')
ORDER BY 1,2);