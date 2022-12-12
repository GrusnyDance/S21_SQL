SELECT pizza.name, pizza.rating
FROM pizzeria AS pizza
WHERE pizza.rating >= 3.5
  AND pizza.rating <= 5
ORDER BY pizza.rating;

SELECT pizza.name, pizza.rating
FROM pizzeria AS pizza
WHERE pizza.rating BETWEEN 3.5 AND 5
ORDER BY pizza.rating;