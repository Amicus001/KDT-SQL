use sakila;

select * from language; #language열 전체를 출력해줘


select language_id,
		'common' language_usage,
		language_id * 3.14 lang_pi_value,
		upper(name) language_name
from language;

#중복 제거하기
select distint actor_id from film_actor order by actor_id;
#film_actor에서 actor_id값이 고유한 것만 골라서 actor_id 기준으로 정렬해줘 

select concat (cust.last_name, ',', cust.first_name) full_name
from (select first_name, last_name, email
	  from customer 
	  where first_name = 'JESSIE') as cust;
	  
create temporary table actors_j #임시테이블 actors_j 생성하기
					(actor_id smallint(5),#화면 출력시 다섯자리 공백 맞춤
					 first_name varchar(45),
					 last_name varchar(45));
desc actors_j;

insert into actors_j #actor 테이블에서 'J'로 시작하는 데이터를 찾아서 actors_j 임시테이블에 저장하기
		select actor_id, first_name,last_name
		from actor where last_name like 'J%';
									# ↑like: 조건 %J: J로 끝나는 데이터
									#  like J%: J로 시작하는 데이터
select * from actors_j; #actors_j 테이블 출력하기

create view cust_vw as 
		select customer_id, first_name, last_name, active
		from customer;
		
select * from cust_vw;

#select customer.first_name, customer.last_name,
#	time(rental.rental_date)as rental_time
#from customer inner join rental 
#	on customer.customer_id = rental.customer_id 
#where date(rental.rental_date)='2005-06-14';

select c.first_name, c.last_name,
	time(r.rental_date)as rental_time
from customer as c inner join rental as r
	on c.customer_id =r.rental_id 
where date(r.rental_date) = '2005-06-14';

select title
from film 
where rating='G' and rental_duration >=7
	  or (rating='PG-13' and rental_duration < 4);
	 
select c.first_name, c.last_name, count(*)
from customer as c inner join rental as r	
	on c.customer_id =r.customer_id
group by c.first_name,c.last_name 
having count(*)>=40;

select c.first_name, c.last_name,
time(r.rental_date) as rental_time
from customer as c inner join rental as r
on c.customer_id = r.customer_id 
where date(r.rental_date) = '2005-06-14'
order by c.last_name ,c.first_name asc;

select c.first_name,c.last_name,
	time(r.rental_date)as rental_time
from customer as c
	inner join rental as r
	on c.customer_id =r.customer_id 
	where date(r.rental_date) = '2005-06-14'
order by time(r.rental_date) desc;

# 실습: actor 테이블에서 모든 배우의 actor_id, first_name, last_name을 검색하고 last_name, first_name 기준으로 오름차순 정렬
select a.first_name, a.last_name, a.actor_id
from actor as a
order by a.last_name, a.first_name asc;

#실습 2: 성이 williams 또는  davis인 모든 배우의 actor_id, first_name, last_name 검색
select a.actor_id, a.first_name, a.last_name
from actor as a
where last_name='WILLIAMS' or last_name='DAVIS';

#실습 3: rental 테이블에서 2005년 7월 5일 영화를 대여한 고객 ID를 반환하는 쿼리를 작성하고, date()함수로 시간 요소를 무시
select distinct customer_id
from rental r 
where date(rental_date) = '2005-07-05';

#실습 4:쿼리 채우기

select c.store_id, c.email, r.rental_date, r.return_date
from customer as c inner join rental as r
	on c.customer_id = r.customer_id 
where date(r.rental_date) = '2005-06-14'
order by return_date desc;