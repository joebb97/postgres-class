--- How many payment transactions were greater than $5.00?
select count(*) from payment
where amount > 5;

--- How many actors have a first name that starts with the letter P?
select count(*) from actor
where first_name like 'P%';

--- How many unique districts are our customers from?
select count(distinct(district)) from address;

--- Get list of names of unique districts
select distinct(district) from address;
--- or
select distinct district from address;

--- How many films have a rating of R and a replacement cost between $5 and %15 dollars
select count(*) from film
where rating = 'R' and replacement_cost BETWEEN 5 and 15;

--- How many films have the word Truman somewhere in the title
select count(*) from film
where title like '%Truman%';
