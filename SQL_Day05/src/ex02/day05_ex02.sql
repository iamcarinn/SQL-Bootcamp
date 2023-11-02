CREATE INDEX IF NOT EXISTS idx_person_name ON person USING btree (UPPER(name));

SET enable_seqscan = off;
EXPLAIN ANALYZE SELECT name
FROM person
WHERE UPPER(name) = 'Anna';

-- DROP INDEX IF EXISTS idx_person_name;