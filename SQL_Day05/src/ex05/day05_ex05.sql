CREATE UNIQUE INDEX IF NOT EXISTS idx_person_order_order_date
ON person_order (person_id, menu_id)
WHERE order_date = '2022-01-01';

SET enable_seqscan = OFF;

-- Индекс idx_person_order_order_date используется
EXPLAIN ANALYZE
SELECT person_id,
       menu_id
FROM person_order
WHERE order_date = '2022-01-01' AND person_id = 2;

-- Индекс idx_person_order_order_date не используется
EXPLAIN ANALYZE
SELECT person_id,
       menu_id
FROM person_order
WHERE order_date = '2022-01-07' AND person_id = 2;

-- DROP INDEX IF EXISTS idx_person_order_order_date;