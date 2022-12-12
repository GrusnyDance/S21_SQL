UPDATE menu
SET price = price * 0.9
WHERE id = (SELECT menu.id FROM menu WHERE menu.pizza_name = 'greek pizza');