
# 1.) When was the last time inventory id = 367 was rented? (rental table)

# one way
select rental_date from rental where inventory_id = 367 order by rental_date desc limit 1;

# another way
select year(rental_date) as "year", monthname(rental_date) as "month", 
concat(dayname(rental_date)," ", day(rental_date)) as "day"
from rental where inventory_id = 367 order by rental_date desc limit 1;


# 2.) 

# Create a new column called rating_description

 select count(film_id) as total,
	case 
		when rating = "PG" then "PG -- Parental Guidance"
        when rating = "G" then "G  - Kids"
        when rating = "NC-17" then"NC-17 -- Adults Only"
        when rating = "PG-13" then "PG-13 -- Parental Guidance"
        else "R -- Restricted"
	end as rating_description
 from film
 group by rating_description;
 
# Calculate how many movies are restricted? How many need parental guidance?


select total, rating_description from 
(select count(film_id) as total,
	case 
		when rating = "PG" then "PG -- Parental Guidance"
        when rating = "G" then "G  - Kids"
        when rating = "NC-17" then"NC-17 -- Adults Only"
        when rating = "PG-13" then "PG-13 -- Parental Guidance"
        else "R -- Restricted"
	end as rating_description
from film
group by rating_description) as GP
where rating_description in ("R -- Restricted","PG-13 -- Parental Guidance");




 # max length movie from PG-13
 
# create table with length and categories 
 
select  length, 
	case 
		when rating = "PG" then "PG -- Parental Guidance"
        when rating = "G" then "G  - Kids"
        when rating = "NC-17" then"NC-17 -- Adults Only"
        when rating = "PG-13" then "PG-13 -- Parental Guidance"
        else "R -- Restricted"
	end as rating_description
from film;
 
 
  # find max length movie from PG-13
 
 select * from film;
 
select title from
(select title as title, length as length, 
	case 
		when rating = "PG" then "PG -- Parental Guidance"
        when rating = "G" then "G  - Kids"
        when rating = "NC-17" then"NC-17 -- Adults Only"
        when rating = "PG-13" then "PG-13 -- Parental Guidance"
        else "R -- Restricted"
	end as rating_description
from film) as PG
where rating_description = "PG-13 -- Parental Guidance"
order by length desc limit 1;

 
 
 
 
 
 
 
 
 
 
 
 
 # 3.) For Store ID = 2, find the address ID with maximum number of customers
 
 select * from store;
  select * from customer;
  
  # it seems that every customer has a unique address_id (as the following code shows), 
  # so I am not sure what "the address ID with maximum number of customers" means
  
 select address_id, count(customer_id) from customer
 group by address_id; 

# the closest to answering the question I got is

select address_id, store_id, count(customer_id) from customer where 
  store_id in (select store_id from store where store_id =2)
group by address_id
order by count(address_id) desc limit 1;

 

 
 
 
 
 
 
 
# 4.) From the Payment table, categorize the customers into three categories: 
# High paying, low paying, medium paying customers. 
# High paying customers are the ones who paid more than 100 dollars, 
# medium paying are between 50 to 100 and low paying are below 50 dollars. 
# Find the total amount paid by each category. 

select * from payment;

#a.) categorize the customers into three categories: 

select customer_id, sum(amount) as customer_pay,
case 
	when sum(amount)>100 then "High paying"
    when sum(amount) between 50 and 100 then "medium paying"
    else "low paying"
end as level_pay
from payment
group by customer_id;

# Find the total amount paid by each category. 


select level_pay, sum(customer_pay) from (
select customer_id, sum(amount) as customer_pay,
case 
	when sum(amount)>100 then "High paying"
    when sum(amount) between 50 and 100 then "medium paying"
    else "low paying"
end as level_pay
from payment
group by customer_id) as GF
group by level_pay;







# 5.) In what city is there a store with ID 2? (city, address, store). 

select * from store;
select * from city;
select * from address;

select city from city where city_id = (select city_id from address 
where address_id = (select address_id from address where 
address_id = (select address_id from store where store_id =2))); 
 