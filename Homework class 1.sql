Select* from actor;

# 1.) select all names of actores 
select first_name, last_name from actor; 

# 2.) Write an SQL query that extracts all columns from the actor table, sorted by first_name in descending order
Select* from actor order by first_name desc;

# 3.) Provide the FIRST NAMES AND LAST NAMES of the actors in one column (HINT: CONCAT())
select concat(first_name, " ", last_name) as "Full name" from actor;

# 4.) Select all unique store numbers (store_id); from the  table customer
select distinct store_id from customer;
# select store_id from customer;

# 5.) Provide the customer's name (first_name) and email in one column; table customer
select concat(first_name, ",   ", email)  as "First name and email" from customer;
# select* from customer;

# 6.) In one column, give the names of the actors in lower case and name the column "Names of the actors" (HINT: LOWER())
select concat(lower(first_name), " ", lower(last_name)) as "Names of the actors" from actor;

# 7.) Which actors' first names are repeated most often and how many times? (Count(), Group by())
select count(actor_id), first_name 
from actor
group by first_name
order by count(actor_id) desc;

# 8.) Which is the longest film in the table: film?
select title, length from film
order by length desc;
#select title, max(length) from film
#group by title
#order by max(length) desc;