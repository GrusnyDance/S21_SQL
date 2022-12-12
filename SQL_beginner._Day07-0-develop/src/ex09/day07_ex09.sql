SELECT DISTINCT p.address,
                ROUND(MAX(p.age::numeric) - (MIN(p.age::numeric) / MAX(p.age::numeric)), 2) AS formula,
                ROUND(AVG(p.age::numeric), 2)                                               AS average,
                (MAX(p.age::numeric) - (MIN(p.age::numeric) / MAX(p.age::numeric))) >
                AVG(p.age::numeric)                                                         AS comparison
FROM person p
GROUP BY 1
ORDER BY 1;
