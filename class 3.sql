select title, length, 
case 
	when length < 50 then "the length is less than 50"
	when length = 50 then "the length is 50"
	else "the length is more than 50"
end as Length_igroup
from film;