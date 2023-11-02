SELECT p.name, m.pizza_name, m.price, ROUND(m.price - m.price * pd.discount / 100) discount_price, piz.name pizzeria_name
FROM person_order po
JOIN person p ON p.id = po.person_id
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria piz ON piz.id = m.pizzeria_id
JOIN person_discounts pd ON pd.person_id = p.id
ORDER BY name, pizza_name;