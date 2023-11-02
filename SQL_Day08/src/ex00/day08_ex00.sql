BEGIN; -- Session 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';  -- Session 1
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut'; -- Session 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';  -- Session 1 - result Ok
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';  -- Session 2 - no update
COMMIT;  -- Session 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';  -- Session 1 - update here
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';  -- Session 2 - update here