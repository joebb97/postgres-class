
--- List the highest paying customers
select customer_id, sum(amount) as total_spent from payment
group by customer_id
having sum(amount) > 100
order by total_spent desc;

--- List all films in stock at any store
select film.film_id,title,inventory_id,store_id from film
left join inventory
on film.film_id = inventory.film_id
where inventory.film_id is not null;

--- What are the emails of the customers who live in California?
select district, email from address
inner join customer on
address.address_id = customer.address_id
where district = 'California'


--- Get a list of all the movies "Nick Wahlberg" has been in
select film.title, first_name, last_name from actor
inner join film_actor
on film_actor.actor_id = actor.actor_id
inner join film on film_actor.film_id = film.film_id
where first_name ilike 'Nick' and last_name ilike 'Wahlberg';
