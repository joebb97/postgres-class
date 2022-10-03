--- We have two staff members, with Staff IDs 1 and 2. We want to give a bonus to the staff member that handled the most payments. (Most in terms of number of payments processed, not total dollar amount).How many payments did each staff member handle and who gets the bonus?

select count(*), staff_id from payment
group by staff_id;

--- What is the average replacement cost per MPAA rating?
select rating, avg(replacement_cost) from film
group by rating;
--- or
select rating, round(avg(replacement_cost), 2) from film
group by rating;


--- What are the customer ids of the top 5 customers by total spent?
select customer_id, sum(amount) from payment
group by customer_id
order by sum(amount) desc
limit 5;
