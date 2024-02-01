use testdb;

# person 테이블 생성 
# CONSTRAINT  pk_person: 제약 조건의 이름 설정 
CREATE TABLE person
      (person_id SMALLINT UNSIGNED,
       fname VARCHAR(20),
       lname VARCHAR(20),
       eye_color ENUM('BR','BL','GR'),
       birth_date DATE,
       street VARCHAR(30),
       city VARCHAR(20),
       state VARCHAR(20),
       country VARCHAR(20),
       postal_code VARCHAR(20),
       CONSTRAINT pk_person PRIMARY KEY (person_id)
      );
      
# person 테이블 구성 확인 
desc person;    

# favorite_food 테이블 생성  
CREATE TABLE favorite_food 
	(person_id SMALLINT UNSIGNED,
	food VARCHAR(20),
	CONSTRAINT pk_favorite_food PRIMARY KEY (person_id, food),
	CONSTRAINT fk_fav_food_person_id FOREIGN KEY (person_id) REFERENCES person(person_id)
	);
	
# favorite_food 테이블 구성 확인 
desc favorite_food;    


/*
 *  2.5 테이블 수정 
 */

# 숫자 키 자동 증가 기능 추가 
set foreign_key_checks=0; # 제약 조건 비활성화 
alter table person modify person_id smallint unsigned auto_increment;
set foreign_key_checks=1; # 제약 조건 활성화 

# person 테이블에 데이터 추가
insert into person 
	(person_id, fname, lname, eye_color, birth_date)
	values (null, 'William', 'Turner', 'BR', '1972-05-27');

select * from person;

select person_id, fname, lname, birth_date from person;

select * from person where person_id=1;

select person_id, fname, lname, birth_date 
from person where lname = 'Turner'; 

# favorite_food 테이블에 데이터 추가 
insert into favorite_food (person_id, food)
values (1, 'pizza');

insert into favorite_food (person_id, food)
values(1, 'cookies');

insert into favorite_food (person_id, food)
values (1, 'nachos');

select * from favorite_food;

select food from favorite_food
where person_id = 1 order by food;

# person 테이블에 다른 데이터 추가 
insert into person 
(person_id, fname, lname, eye_color, birth_date,
street, city, state, country, postal_code)
values (null, 'Susan', 'Smith', 'BL', '1975-11-02', 
'23 Maple St.', 'Arlington', 'VA', 'USA', '20220');


select person_id, fname, lname, birth_date from person;

/*
 * 2.5.2 데이터 수정 (추가): UPDATE문 
 */

update person 
set street = '1225 Tremon St.',
	city = 'Boston',
	state = 'MA',
	country = 'USA',
	postal_code = '02138'
where person_id=1;

select * from person;

# 데이터 삭제: DELETE 문 
delete from person where person_id=2;

select * from person;

#drop table person;

select * from person;
#insert into favorite_food(person_id, food) values(3, 'lasagna'); 에러; person_id=3 값이 person 데이터에 없음

insert into person(person_id, fname, lname) values(3,'kevin', 'Kern');
select*from person;