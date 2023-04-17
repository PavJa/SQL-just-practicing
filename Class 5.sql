# get rid of null: WHERE column_name IS NOT NULL


# 1.) How much is spent on movie rentals in each country?

select * from rental;
select * from customer;
select * from address;
select * from city;
select * from country;
select * from payment;

select count(*) from rental;
select count(*) from customer;
select count(*) from address;
select count(*) from city;
select count(*) from country;


select 
	t5.country as Country,
	sum(amount) as "Total Paid for Rental"

from payment t1 
left join customer t2 on t1.customer_id = t2.customer_id
left join address t3 on t2.address_id = t3.address_id
left join city t4 on t3.city_id = t4.city_id
left join country t5 on t4.country_id = t5.country_id
group by Country;



# Write an SQL query giving the names of the clients, their total amount rented

select * from customer;
select * from payment;


select 
	concat(first_name, " ", last_name) as Name,
	sum(amount) as "Total Paid for Rental"

from payment t1 
left join customer t2 on t1.customer_id = t2.customer_id
group by name;


# Provide the customer name and city they live in, who live in Greece.

select * from customer;
select * from address;
select * from city;
select * from country;

select 
concat(first_name, " ", last_name) as Name,
t2.city


from address t1 
left join city t2 on t1.city_id = t2.city_id
left join customer t3 on t1.address_id = t3.address_id
left join country t4 on t2.country_id = t4.country_id
where t4.country = "Greece";



# 4. Get customer name, then create a new variable called location which will be ‘City-Country’


select 
concat(first_name, " ", last_name) as Name,
concat(t2.city,"-",t4.country) as Location
#t2.city,
#t4.country

from address t1 
left join city t2 on t1.city_id = t2.city_id
left join customer t3 on t1.address_id = t3.address_id
left join country t4 on t2.country_id = t4.country_id;
