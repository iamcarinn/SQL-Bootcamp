set session characteristics AS transaction isolation level serializable;  -- Session 1
show transaction isolation level;  -- Session 1
set session characteristics AS transaction isolation level serializable;  -- Session 2
show transaction isolation level;  -- Session 2
begin;  -- Session 1
begin;  -- Session 2
select * from pizzeria where name = 'Pizza Hut';  -- Session 1
update pizzeria set rating = 3.0  where name = 'Pizza Hut';  -- Session 2
commit;  -- Session 2, save update to DB happens here
select * from pizzeria where name = 'Pizza Hut';  -- Session 1, changes happened in session 2 not list here cause in serializable transaction
commit;  -- Session 1
select * from pizzeria where name = 'Pizza Hut';  -- Session 1, changes visible cause transaction finished
select * from pizzeria where name = 'Pizza Hut';  -- Session 2, changes happened in 2 here