--- What is the email for the customer with the name Nancy Thomas
select email from customer
where first_name = 'Nancy' and last_name = 'Thomas';
--- or
select email from customer
where first_name ilike 'nancy' and last_name ilike 'thomas';

--- Get the description of the movie 'Outlaw Hanky'
select description from film
where title = 'Outlaw Hanky';

--- Get the phone number for the customer who lives at '259 Ipoh Drive'
select phone from address where address = '259 Ipoh Drive';
