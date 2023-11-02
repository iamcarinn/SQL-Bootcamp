begin;  -- Session 1
begin;  -- Session 2
update pizzeria SET rating = 3 where id = 1;  -- Session 1
update pizzeria SET rating = 5 where id = 2;  -- Session 2
update pizzeria SET rating = 4 where id = 2;  -- Session 1
update pizzeria SET rating = 2.3 where id = 1;  -- Session 2, deadlock happened here!
commit;  -- Session 1
commit;  -- Session 2