SELECT name
FROM person
	JOIN person_order ON person_order.person_id = person.id
	JOIN menu ON menu.id = person_order.menu_id
WHERE gender = 'male'
	AND address IN ('Moscow', 'Samara')
	AND menu.pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY name DESC;