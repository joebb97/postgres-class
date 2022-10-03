-- How many films begin with the letter J?
select count(*) from film where title like 'J%'

-- What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?
select first_name, last_name from customer
where first_name like 'E%' and address_id < 500
order by customer_id desc limit 1;
