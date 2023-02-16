select customer_id,
case
  when (customer_id <= 100) then 'Premium'
  when (customer_id between 100 and 200) then 'Plus'
  else 'Normal'
end as customer_class
from customer;

select customer_id,
case
  customer_id
  when 2 then 'Winner'
  when 5 then 'Second Place'
  else 'Normal'
end as raffle_results
from customer;


select
sum(case rental_rate when 0.99 then 1 else 0 end) as bargains,
sum(case rental_rate when 2.99 then 1 else 0 end) as regular,
sum(case rental_rate when 4.99 then 1 else 0 end) as premium
from film;
