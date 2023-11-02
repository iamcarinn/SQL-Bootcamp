INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
WITH pizzeria_orders AS (
	SELECT po.person_id, m.pizzeria_id pizzeria_id, COUNT(po.*) visits
	FROM person_order po
	JOIN menu m ON m.id = po.menu_id
	GROUP BY po.person_id, m.pizzeria_id
)
SELECT
	ROW_NUMBER() OVER (),
	person_id, pizzeria_id,
	(CASE
		WHEN visits = 1 THEN 10.5
		WHEN visits = 2 THEN 22
		ELSE 30
	END)
FROM pizzeria_orders;