SET enable_seqscan = off;
EXPLAIN ANALYZE SELECT m.pizza_name, piz.name pizzeria_name
FROM menu m
JOIN pizzeria piz ON m.pizzeria_id = piz.id;