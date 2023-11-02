begin transaction isolation level repeatable read; -- Session 1
begin transaction isolation level repeatable read; -- Session 2
select * from pizzeria where name = 'Pizza Hut';  -- Session 1
select * from pizzeria where name = 'Pizza Hut';  -- Session 2
update pizzeria set rating = 4 where name = 'Pizza Hut';  -- Session 1
update pizzeria set rating = 3.6 where name = 'Pizza Hut';  -- Session 2
commit;  -- Session 1, Ok
commit;  -- Session 2, ERROR:  could not serialize access due to concurrent update, Rollback
select * from pizzeria where name = 'Pizza Hut';  -- Session 1, update from session 1
select * from pizzeria where name = 'Pizza Hut';  -- Session 2, update from session 1