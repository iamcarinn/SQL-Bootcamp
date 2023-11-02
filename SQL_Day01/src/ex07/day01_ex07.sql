SELECT order_date AS order_date,
	(SELECT CONCAT(name, ' (age:', age, ')') AS person_information FROM person WHERE id = person_order.person_id)
FROM person_order
ORDER BY order_date, person_information