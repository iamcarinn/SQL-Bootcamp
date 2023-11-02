begin transaction isolation level repeatable read;  -- Session 1
begin transaction isolation level repeatable read;  -- Session 2
select sum(rating) from pizzeria;  -- Session 1, sum = 19.9
update pizzeria SET rating = 5 where name = 'Pizza Hut';  -- Session 2
commit;  -- Session 2
select sum(rating) from pizzeria;  -- Session 1, sum = 19.9. Phantom read anomaly while in transaction
commit;  -- Session 1
select sum(rating) from pizzeria;  -- Session 1, sum = 23.9 but it's expected now
select sum(rating) from pizzeria;  -- Session 2, sum = 23.9 as expected