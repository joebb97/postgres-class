--- We are launching a platinum service for our most loyal customers. We will assign platinum status to customers that have had 40 or more transaction payments. What customer_ids are eligible for platinum status?
select count(*), customer_id from payment
group by customer_id
having count(*) >= 40;

--- What are the customer ids of customers who have spent more than $100 in payment transactions with our staff_id member 2?
select customer_id, sum(amount) from payment
where staff_id = 2
group by customer_id
having sum(amount) >= 100;
