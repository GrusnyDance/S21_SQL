SELECT pr.name, pr.age
FROM person AS pr
WHERE pr.address = 'Kazan'
  AND pr.gender = 'female'
ORDER BY pr.name;