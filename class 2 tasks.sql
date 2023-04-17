# 1.)  Provide the title and length of the longest (use Length) movie.

select title, length from film order by length desc limit 1;

# 2.) Write an SQL query that provides all the information about movies with a rental period of 6.

select * from film where rental_duration = 6;

# 3.) Write an SQL query that provides the movie title, description, release year, rating when the rating is PG

select title, description, release_year, rating from film where rating = "PG";

# 4.) Write an SQL query that would extract the movie title, rental duration, rental price when the rental price is 4.99 or less, and the rental duration is 5 and 6.

select title, rental_duration, rental_rate from film where rental_rate <= 4.99 and rental_duration = 5 or rental_duration = 6;

# 5.) Write an SQL query that extracts the movie title, movie duration, rental price, genre type where the description says 'drama' and sort by length of the movie highest to lowest

select title, length, rental_rate, description from film where description like "%drama%"
order by length desc;

# 6.) Write a query that extracts all movie titles that begin with the letter "z".

select title from film where title like "z%";

# 7.) Write an SQL query that would extract all movies that do not have the word "Trailers" in their special features.

select * from film where special_features not like "%Trailers%";

# 8.) Write an SQL query that would extract all movies whose special features begins with the word “Trailers”.

select * from film where special_features like "Trailers%";

# 9.) Write an SQL query that would extract all movies whose genre description consists of at least two words, one of which is Commentaries.

select * from film where length(special_features) not in (0,1) and special_features like "%Commentaries%";
