create table theater(
theaterid number primary key,
theatername varchar2(20),
place varchar2(10));

create table showroom(
theaterid number,
showroomid number check(0 < showroomid AND showroomid < 11) primary key,
moviename varchar2(20),
price number check(price<20000),
seat number,
foreign key(theaterid) references theater(theaterid) on delete cascade);

create table cust(
custid number primary key,
name varchar2(20),
address varchar2(20));

create table reserv(
theaterid number,
showroomid number,
custid number,
seatid number,
showdate date,
foreign key(theaterid) references theater(theaterid) on delete cascade,
foreign key(showroomid) references showroom(showroomid) on delete cascade,
foreign key(custid) references cust(custid) on delete cascade);

insert into theater(theaterid, theatername, place)
values(1, '롯데', '잠실');
insert into theater(theaterid, theatername, place)
values(2, '메가', '강남');
insert into theater(theaterid, theatername, place)
values(3, '대한', '잠실');

insert into showroom(theaterid, showroomid, moviename, price, seat)
values(1, 1, '어려운 영화', 15000, 48);
insert into showroom(theaterid, showroomid, moviename, price, seat)
values(3, 1, '멋진 영화', 7500, 120);
insert into showroom(theaterid, showroomid, moviename, price, seat)
values(3, 2, '재밌는 영화', 8000, 110);

insert into reserv(theaterid, showroomid, custid, seatid, showdate)
values(3, 2, 3, 15, '2020-09-01');
insert into reserv(theaterid, showroomid, custid, seatid, showdate)
values(3, 1, 4, 16, '2020-09-01');
insert into reserv(theaterid, showroomid, custid, seatid, showdate)
values(1, 1, 9, 48, '2020-09-01');

insert into cust(custid, name, address)
values(3, '홍길동', '강남');
insert into cust(custid, name, address)
values(4, '김철수', '잠실');
insert into cust(custid, name, address)
values(9, '박영희', '강남');

select *
from theater;

select *
from showroom;

select *
from cust;

select *
from reserv;

/*단순질의*/
/*모든 극장의 이름과 위치를 보이시오.*/
select theatername, place
from theater;

/*'잠실'에 있는 극장을 보이시오.*/
select *
from theater
where place='잠실';

/*'잠실'에 사는 고객의 이름을 오름차순으로 보이시오.*/
select name
from cust
where address='잠실' order by name;

/*가격이 8000원 이하인 영화의 극장번호, 상영관번호, 영화제목을 보이시오.*/
select theaterid, showroomid, moviename
from showroom
where price <= 8000;

/*극장 위치와 고객의 주소가 같은 고객을 보이시오.*/
select *
from cust, theater
where cust.address=theater.place;

/*집계질의*/
/*극장의 수는 몇 개인가?*/
select count(theaterid)
from theater;

/*상영되는 영화의 평균 가격은 얼마인가?*/
select avg(price)
from showroom;

/*2020년 9월 1일에 영화를 관람한 고객의 수는 얼마인가?*/
select count(custid)
from reserv
where showdate='2020-09-01';

/*부속질의와 조인*/
/*'대한'극장에서 상영된 영화제목을 보이시오.*/
select moviename
from theater, showroom
where theater.theaterid=showroom.theaterid AND theatername='대한';

/*'대한'극장에서 영화를 본 고객의 이름을 보이시오.*/
select cust.name
from theater, cust, reserv
where theater.theaterid=reserv.theaterid AND cust.custid=reserv.custid AND theatername='대한';

/*'대한'극장의 전체 수입을 보이시오.*/
select sum(price)
from theater, showroom
where theater.theaterid=showroom.theaterid AND theatername='대한';

/*그룹질의*/
/*극장별 상영관 수를 보이시오.*/
select theatername, count(showroomid)
from theater, showroom
where theater.theaterid=showroom.theaterid
group by theatername;

/*'잠실'에 있는 극장의 상영관을 보이시오.*/
select distinct theatername, showroomid
from theater, showroom
where theater.theaterid=showroom.theaterid AND place='잠실';

/*2020년 9월 1일의 극장별 평균 관람 고객 수를 보이시오.*/
select theatername, count(*)
from theater, reserv
where theater.theaterid=reserv.theaterid AND showdate='2020-09-01'
group by reserv.theaterid, theater.theatername;

/*2020년 9월 1일에 가장 많은 고객이 관람한 영화를 보이시오.*/
select max(count(custid))
from showroom, reserv
where showroom.theaterid=reserv.theaterid AND showroom.showroomid=reserv.showroomid AND showdate='2020-09-01'
group by moviename;