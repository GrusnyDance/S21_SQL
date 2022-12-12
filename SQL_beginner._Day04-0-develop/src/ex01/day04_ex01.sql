SELECT vpf.name
FROM v_persons_female vpf
UNION ALL
SELECT vpm.name
FROM v_persons_male vpm
ORDER BY 1;