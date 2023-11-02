SELECT order_date, CONCAT(name, ' (age:', age, ')') AS person_information
FROM person
NATURAL JOIN
	(SELECT id as order_id, order_date, person_id AS id FROM person_order) person_order
ORDER BY order_date, person_information;