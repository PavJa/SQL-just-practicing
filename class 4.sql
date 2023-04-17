select * from film_actor;
select count(*) from actor;

select count(*) from (
select customer_id from payment 
union
select customer_id  from rental
) x;

select count(*) from (
select customer_id from payment 
union all
select customer_id  from rental
) x;











# You were called by client Helen Harris and asked what films she has rented, give their names.

select rental_id,
t1.customer_id,
t2.first_name,
t2.last_name,
t4.title 

FROM rental t1
LEFT JOIN customer t2 ON t1.customer_id = t2.customer_id
LEFT JOIN inventory t3 ON t1.inventory_id = t3.inventory_id
LEFT JOIN film t4 on t3.film_id = t4.film_id
where t2.first_name = 'Helen';





# In what films did actress Uma Wood star in?

select * from film_actor;
select * from film;
select * from actor;

select count(*) from film_actor;
select count(*) from film;
select count(*) from actor;

select t1.film_id,
t2.actor_id,
first_name,
last_name,
t3.title

FROM film_actor t1
LEFT JOIN  actor t2 ON t2.actor_id = t1.actor_id
LEFT JOIN film t3 ON t1.film_id = t3.film_id
where t2.last_name = 'Wood';


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
first_name,
last_name,
t6.title,
t1.customer_id,
sum(amount)

FROM payment t1
LEFT JOIN customer t4 ON t4.customer_id = t1.customer_id
LEFT JOIN rental t2 ON t1.customer_id = t2.customer_id
LEFT JOIN inventory t5 ON t2.inventory_id = t5.inventory_id
LEFT JOIN film t6 ON t5.film_id = t6.film_id
where t4.last_name = 'Lopez' and t6.title = "Rocky War"
group by t1.customer_id;







