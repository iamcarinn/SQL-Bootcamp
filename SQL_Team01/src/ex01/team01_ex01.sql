insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

select coalesce(u.name, 'not defined') as name, 
    coalesce(u.lastname, 'not defined') as lastname, 
    cur_diff.name as currency_name, 
    cur_diff.money * coalesce(min, max) as currency_in_usd 
from (select distinct b.user_id, b.money, c.id, c.name,  
        (select cc.rate_to_usd from currency as cc 
        where cc.id = b.currency_id 
                and cc.updated < b.updated  
        order by cc.updated desc 
        limit 1) as min, 
        (select cc.rate_to_usd from currency as cc 
        where cc.id = b.currency_id  
                and cc.updated > b.updated  
        order by cc.updated 
        limit 1) as max
      from currency as c 
        join balance as b  on c.id = b.currency_id ) as cur_diff 
  left join "user" as u on cur_diff.user_id = u.id 
order by 1 desc, 2, 3;