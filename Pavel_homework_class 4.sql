
# HOMEWORK FOR CLASS 4

# 1.	Use JOIN to display the first and last names, as well as the address, 
#of each staff member. Use the tables staff and address:

select * from address;
select * from staff;

select count(*) from address;
select count(*) from staff;

select 
		t2.first_name,
        t2.last_name,
        t1.address_id,
        t1.address
        
from address t1 
join staff t2 on t1.address_id = t2.address_id;





# 2. Use JOIN to display the total amount processed by each staff member in August of 2005. 
#Use tables staff and payment.

select * from payment;
select * from staff;

select 
        concat(t2.first_name, " ", t2.last_name) as Staff_member,
        sum(amount) as "Total amount"

from payment t1 
left join staff t2 on t1.staff_id = t2.staff_id
where month(payment_date) = 8
group by staff_member;




# 3. List each film and the number of actors who are listed for that film. 
# Use tables film_actor and film. Use inner join.

select * from film;
select * from film_actor;

select
title as "Title",
count(actor_id) as "Number of actors"

from film t1 
join film_actor t2 on t1.film_id = t2.film_id
group by title;







# 4.) How many copies of the film Hunchback Impossible exist in the inventory system?

select * from film;
select * from inventory;


select 
title as "Film",
count(t1.film_id) as "Inventory count"

from inventory t1 
join film t2 on t1.film_id = t2.film_id
where title = "Hunchback Impossible"
group by title;






# 5.) Using the tables payment and customer and the JOIN command, list the total amount paid by each customer. 
# Sort the customers based on the payment in descending order:

select * from payment;
select * from customer;

select 
concat(first_name," ", last_name) as Customer_name,
#t1.amount
sum(amount) as Total_paid

from payment t1 
join customer t2 on t1.customer_id = t2.customer_id
group by Customer_name
order by Total_paid desc;





# 6.) The music of Queen and Kris Kristofferson have seen an unlikely resurgence. 
#As an unintended consequence, films starting with the letters K and Q have also soared in popularity. 
# Use Join to display the titles of movies starting with the letters K and Q whose language is English.

select * from film where title like "K%";
select * from language;

select 
title as Title

from film t1
join language t2 on t1.language_id = t2.language_id
where t1.language_id = 1 and title like "K%" or title like "Q%";






# 7.) You want to run an email marketing campaign in Canada, 
# for which you will need the names and email addresses of all Canadian customers. 
# Use joins to retrieve this information.

select * from customer;
select * from address;
select * from country;
select* from city;


select count(*)  from address;
select count(*)  from city;
select count(*) from customer;
select count(*)  from country;

select 
concat(first_name, " ", last_name) as Name,
email as "E-mail"

from address t1
join customer t2 on t1.address_id = t2.address_id
join city t3 on t1.city_id = t3.city_id
join country t4 on t3.country_id = t4.country_id
where t4.country_id = 20;






# 8.) Write a query to display for each store its store ID, city, and country.

select * from store;
select * from address;
select * from city;
select * from country;


select count(*)  from address;
select count(*)  from city;
select count(*)  from country;
select count(*) from store;

select
store_id as "Store ID",
t3.city as "City",
t4.country as "Country"

from address t1
join store t2 on t1.address_id = t2.address_id
join city t3 on t1.city_id = t3.city_id
join country t4 on t3.country_id = t4.country_id;









# Class tasks (excluding the first one, which you solved during the class)


# In what films did actress Uma Wood star in?

select * from film_actor;
select * from film;
select * from actor;

select count(*) from film_actor;
select count(*) from film;
select count(*) from actor;

select 
concat(first_name, " ", last_name) as Name,
t3.title as Title

FROM film_actor t1
LEFT JOIN  actor t2 ON t2.actor_id = t1.actor_id
LEFT JOIN film t3 ON t1.film_id = t3.film_id
where t2.last_name = 'Wood' and t2.first_name = 'Uma';








# How much did client Amy Lopez pay for renting the movie Rocky War?

select * from rental;
select * from payment;
select * from inventory;
select * from film;
select * from customer;


select count(*) from rental;
select count(*) from payment;
select count(*) from inventory;
select count(*) from film;
select count(*) from customer;


select
concat(first_name, " ", last_name) as Name,
t6.title as Title,
sum(amount) as Total_paid

FROM payment t1
LEFT JOIN customer t4 ON t4.customer_id = t1.customer_id
LEFT JOIN rental t2 ON t1.customer_id = t2.customer_id
LEFT JOIN inventory t5 ON t2.inventory_id = t5.inventory_id
LEFT JOIN film t6 ON t5.film_id = t6.film_id
where t4.last_name = 'Lopez' and t6.title = "Rocky War"
group by name;







# Calculate the average rental_duration (in the table film) for movies with a Documentary 
# category. (movie category is table category) 

select * from category;
select * from film;
select * from film_category;

select count(*) from film_category;
select count(*) from film;
select * from category;



select 
t3.name as Film_category,
avg(t1.rental_duration) as "Average rental duration"

from film t1
join film_category t2 on t1.film_id = t2.film_id
join category t3 on t2.category_id = t3.category_id
where name = "Documentary"
group by t3.name;



# Find 5 largest countries by number of customers. 

select * from address;
select * from city;
select * from customer;
select * from country;

select count(*) from address;
select count(*) from city;
select count(*) from customer;
select count(*) from country;

select
t4.country as Country,
count(t2.customer_id) as Number_of_customers

from address t1
left join customer t2 on t1.address_id = t2.address_id
left join city t3 on t1.city_id = t3.city_id
left join country t4 on t3.country_id = t4.country_id
group by t4.country
order by Number_of_customers desc limit 5;