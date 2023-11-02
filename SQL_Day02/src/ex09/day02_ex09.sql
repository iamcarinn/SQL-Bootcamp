WITH data AS (SELECT menu.pizza_name, person.name
			 FROM person_order
			 JOIN menu ON menu.id = person_order.menu_id
			 JOIN person ON person.id = person_order.person_id
			 WHERE person.gender = 'female'
			 	AND menu.pizza_name IN ('pepperoni pizza', 'cheese pizza'))
SELECT name FROM data
WHERE pizza_name = 'pepperoni pizza'
INTERSECT
SELECT name FROM data
WHERE pizza_name = 'cheese pizza'
ORDER BY name;