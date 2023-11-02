SELECT pizza_name, price, pizzeria.name AS pizzeria_name
FROM
(SELECT id FROM menu
EXCEPT
SELECT menu_id FROM person_order) AS m
JOIN menu ON menu.id = m.id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY 1, 2;