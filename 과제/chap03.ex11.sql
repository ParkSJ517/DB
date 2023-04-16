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
values(1, '�Ե�', '���');
insert into theater(theaterid, theatername, place)
values(2, '�ް�', '����');
insert into theater(theaterid, theatername, place)
values(3, '����', '���');

insert into showroom(theaterid, showroomid, moviename, price, seat)
values(1, 1, '����� ��ȭ', 15000, 48);
insert into showroom(theaterid, showroomid, moviename, price, seat)
values(3, 1, '���� ��ȭ', 7500, 120);
insert into showroom(theaterid, showroomid, moviename, price, seat)
values(3, 2, '��մ� ��ȭ', 8000, 110);

insert into reserv(theaterid, showroomid, custid, seatid, showdate)
values(3, 2, 3, 15, '2020-09-01');
insert into reserv(theaterid, showroomid, custid, seatid, showdate)
values(3, 1, 4, 16, '2020-09-01');
insert into reserv(theaterid, showroomid, custid, seatid, showdate)
values(1, 1, 9, 48, '2020-09-01');

insert into cust(custid, name, address)
values(3, 'ȫ�浿', '����');
insert into cust(custid, name, address)
values(4, '��ö��', '���');
insert into cust(custid, name, address)
values(9, '�ڿ���', '����');

select *
from theater;

select *
from showroom;

select *
from cust;

select *
from reserv;

/*�ܼ�����*/
/*��� ������ �̸��� ��ġ�� ���̽ÿ�.*/
select theatername, place
from theater;

/*'���'�� �ִ� ������ ���̽ÿ�.*/
select *
from theater
where place='���';

/*'���'�� ��� ���� �̸��� ������������ ���̽ÿ�.*/
select name
from cust
where address='���' order by name;

/*������ 8000�� ������ ��ȭ�� �����ȣ, �󿵰���ȣ, ��ȭ������ ���̽ÿ�.*/
select theaterid, showroomid, moviename
from showroom
where price <= 8000;

/*���� ��ġ�� ���� �ּҰ� ���� ���� ���̽ÿ�.*/
select *
from cust, theater
where cust.address=theater.place;

/*��������*/
/*������ ���� �� ���ΰ�?*/
select count(theaterid)
from theater;

/*�󿵵Ǵ� ��ȭ�� ��� ������ ���ΰ�?*/
select avg(price)
from showroom;

/*2020�� 9�� 1�Ͽ� ��ȭ�� ������ ���� ���� ���ΰ�?*/
select count(custid)
from reserv
where showdate='2020-09-01';

/*�μ����ǿ� ����*/
/*'����'���忡�� �󿵵� ��ȭ������ ���̽ÿ�.*/
select moviename
from theater, showroom
where theater.theaterid=showroom.theaterid AND theatername='����';

/*'����'���忡�� ��ȭ�� �� ���� �̸��� ���̽ÿ�.*/
select cust.name
from theater, cust, reserv
where theater.theaterid=reserv.theaterid AND cust.custid=reserv.custid AND theatername='����';

/*'����'������ ��ü ������ ���̽ÿ�.*/
select sum(price)
from theater, showroom
where theater.theaterid=showroom.theaterid AND theatername='����';

/*�׷�����*/
/*���庰 �󿵰� ���� ���̽ÿ�.*/
select theatername, count(showroomid)
from theater, showroom
where theater.theaterid=showroom.theaterid
group by theatername;

/*'���'�� �ִ� ������ �󿵰��� ���̽ÿ�.*/
select distinct theatername, showroomid
from theater, showroom
where theater.theaterid=showroom.theaterid AND place='���';

/*2020�� 9�� 1���� ���庰 ��� ���� �� ���� ���̽ÿ�.*/
select theatername, count(*)
from theater, reserv
where theater.theaterid=reserv.theaterid AND showdate='2020-09-01'
group by reserv.theaterid, theater.theatername;

/*2020�� 9�� 1�Ͽ� ���� ���� ���� ������ ��ȭ�� ���̽ÿ�.*/
select max(count(custid))
from showroom, reserv
where showroom.theaterid=reserv.theaterid AND showroom.showroomid=reserv.showroomid AND showdate='2020-09-01'
group by moviename;