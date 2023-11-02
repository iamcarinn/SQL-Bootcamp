SELECT order_date AS action_date,
	(SELECT name AS person_name FROM person WHERE id = person_order.person_id)
FROM person_order
INTERSECT
SELECT visit_date,
	(SELECT name AS person_name FROM person WHERE id = person_visits.person_id)
FROM person_visits
ORDER BY action_date ASC, person_name DESC