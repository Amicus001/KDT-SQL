use sakila;

#범위조건
#해당 식이 특정 범위 내애 있는지 확인하기
select customer_id, rental_date
from rental r where rental_date < '2005_05_25'

#해당 날짜만 검색하기
select customer_id, rental_date
from rental r where rental_date<='2005-06-16' and rental_date>='2005-06-14';

#정확한 날짜만 추출
select customer_id, rental_date
from rental r where date(rental_date)<='2005-06-16'
				and date(rental_date)>='2005-06-14';
#between
select customer_id, rental_date
from rental as r where date(rental_date)between '2005-06-14'and '2005-06-16';

select customer_id, payment_date, amount
from payment 
where amount between 10.0 and 11.99;

#문자열 between
select last_name, first_name
from customer 
where last_name between 'FA' and 'FRB';

#Membership
select title,rating
from film f where rating='G' or rating='PG';

select title,rating
from film f where rating in('G','PG');

select title, rating
from film f 
where rating in (select rating from film where title like '%pet%');

select title,rating
from film f
where rating not in ('PG-13', 'R','NC-17');

#wildcard
select last_name, first_name
from customer c 
where last_name like '_A_T%S';

select last_name, first_name
from customer c where last_name like 'Q%' or last_name like 'Y%';


select last_name, first_name
from customer c where last_name regexp '^[QY]';

select rental_id, customer_id, return_date
from rental r 
#is not null
where return_date is not null;

select rental_id, customer_id, return_date
from rental r where return_date is null 
or return_date not between '2005-05-01' and '2005-09-01';


#실슴 4
select payment_id, customer_id, amount, date(payment_date) as payment_date
from payment p 
where (payment_id between 101 and 120);

#실습 4-1
select payment_id, customer_id, amount, date(payment_date) payment_date
from payment p 
where (payment_id between 101 and 120)
and customer_id !=5 and (amount>8 or date(payment_date) = '2005-08-23');

#실습 4-2
select payment_id, customer_id, amount, date(payment_date)
from payment p 
where (payment_id between 101 and 120)
and customer_id = 5 and not(amount>6 or date(payment_date) = '2005-06-19');