/*도서번호가 1인 도서의 이름*/
select bookname
from book
where bookid=1;

/*가격이 20000원 이상인 도서의 이름*/
select bookname
from book
where price>=20000;

/*박지성의 총 구매액*/
select sum(saleprice)
from orders
where custid=1;

/*박지성의 총 구매액*/
select sum(saleprice)
from orders, customer
where customer.custid=orders.custid AND customer.name like '박지성'; 

/*박지성이 구매한 도서의 수*/
select count(*)
from orders
where custid=1;

/*박지성이 구매한 도서의 수*/
select count(*)
from orders, customer
where customer.custid=orders.custid AND customer.name like '박지성';

/*박지성이 구매한 도서의 출판사 수*/
select count(publisher)
from book, customer, orders
where book.bookid=orders.bookid AND customer.custid=orders.custid AND customer.name like '박지성'