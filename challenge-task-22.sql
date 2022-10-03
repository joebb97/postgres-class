--- What are the customer ids of the first 10 customers who created a payment?
select customer_id from payment
order by payment_date asc
limit 10;

--- What are the titles of the 5 shortest runtime movies
select title,length from film
order by length asc
limit 5;

--- How many movies run for 50 minutes or less?
select count(*) from film
where length <= 50;
