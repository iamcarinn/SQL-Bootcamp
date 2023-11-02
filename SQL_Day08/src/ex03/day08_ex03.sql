set session characteristics AS transaction isolation level read committed; -- Session 1
show transaction isolation level; -- Session 1
set session characteristics AS transaction isolation level read committed; -- Session 2
show transaction isolation level;  -- Session 2
begin;  -- Session 1
begin;  -- Session 2
select * from pizzeria where name = 'Pizza Hut';  -- Session 1
update pizzeria set rating = 3.6  where name = 'Pizza Hut';  -- Session 2
commit;  -- Session 2
select * from pizzeria where name = 'Pizza Hut';  -- Session 1, non-repeatable read anomaly cause updated in session 2
commit;  -- Session 1
select * from pizzeria where name = 'Pizza Hut';  -- Session 1, same result as before commit in session 1
select * from pizzeria where name = 'Pizza Hut';  -- Session 2, expected result that happened in session 2