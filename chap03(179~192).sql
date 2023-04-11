/*newbook table 생성*/
create table newbook (
bookid       number     primary key,
bookname     varchar2(20)    not null,
publisher    varchar2(20)    unique,
price        number     default 10000    check(price>1000));

select * from newbook;

/*newcustomer table 생성*/
create table newcustomer(
custid   number   primary key,
name   varchar2(20),
address    varchar2(20),
phone   varchar(30));

/*neworders table 생성*/
create table neworders (
orderid number,
custid  number  not null,
bookid  number  not null,
saleprice   number,
orderdate   date,
primary key(orderid),
foreign key(custid) references newcustomer(custid) on delete cascade);

/*속성추가*/
alter table newbook add isbn varchar2(13);

select * from newbook;

/*제약사항 변경*/
alter table newbook modify isbn number;

/*테이블 삭제*/
drop table newbook;

select * from book;

/*투플 추가*/
insert into book(bookid, bookname, publisher, price)
values(11, '스포츠 의학', '한솔의학서적', 90000);

insert into book(bookid, bookname, publisher)
values(14, '스포츠 의학', '한솔의학서적');

select * from imported_book;

/*대량 삽입*/
insert into book(bookid, bookname, publisher, price)
select bookid, bookname, publisher, price
from imported_book;

select * from customer;

/*업데이트*/
update customer
set address='대한민국 부산'
where custid=5;

update customer
set address=(select address
             from customer
             where name='김연아')
where name='박세리';

/*투플 삭제*/
delete from customer
where custid=5;

rollback;