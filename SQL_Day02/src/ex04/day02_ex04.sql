WITH pizza_list
	AS (SELECT * FROM menu WHERE pizza_name IN ('mushroom pizza', 'pepperoni pizza'))
SELECT pizza_name, pizzeria.name AS pizzeria_name, price
FROM pizza_list
JOIN pizzeria ON pizzeria.id = pizza_list.pizzeria_id
ORDER BY pizza_name, pizzeria_name;