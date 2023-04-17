select * from film;

#  Pull the length of the shortest film from table  film.
select title, min(length) from film group by title order by min(length) asc limit 1; 

# Extract all the information about the films with a rental period of 5, 
# order the results by the price of the film (rental_rate) in ascending order from table film.

select * from film where rental_duration = 5 order by rental_rate asc;

 # Write a query where you would sum rental_rate grouped by film rating.  
 # Show only when the rental_rate amount is greater than 600  hint: “having”.
 
 select rating, sum(rental_rate) from film group by rating having sum(rental_rate)>600;
 
 
 # Pull the films ACE GOLDFINGER, ADAPTATION HOLES, AFFAIR PREJUDICE and their length
 
 select title, length from film where title in ("ACE GOLDFINGER","ADAPTATION HOLES","AFFAIR PREJUDICE");
 
 # Calculate the number of films that have trailers in the special 
 # features and the price (rental_rate) is 2.99
 
 select count(film_id) as "Total Number" from film where special_features like "%trailer%" 
 and rental_rate = 2.99;

 
 #select rental_rate, count(film_id) as "Count" from film where special_features like "%trailer%" 
 #group by rental_rate having rental_rate = 2.99;

