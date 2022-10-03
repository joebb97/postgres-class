--- During which months did payments occur?
select distinct to_char(payment_date, 'Month') from payment;

--- How many payments occurred on a monday?
select count(*) from payment where extract(dow from payment_date) = 1;
