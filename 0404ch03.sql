/*고객의 이름과 고객이 주문한 도서의 판매가격*/
select name, saleprice
from customer left outer join orders
on customer.custid=orders.custid;

/*고객의 이름과 고객이 주문한 도서의 판매가격*/
select name, saleprice
from customer, orders
where customer.custid=orders.custid(+);

/*가장 비싼 도서의 가격 표시*/
select max(price)
from book;

/*가장 비싼 도서의 이름*/
select bookname
from book
where price=35000;

/*가장 비싼 도서의 이름*/
select bookname
from book
where price=(select max(price)
            from book);
            
/*도서를 구매한 적이 있는 고객*/
select custid
from orders;

/*고객 아이디에 해당하는 고객 이름*/
select name
from customer
where custid in (1,2,3,4);

/*고객 아이디에 해당하는 고객 이름*/
select name
from customer
where custid in (select custid
                from orders);
                
/*출판사별 출판사의 평균보다 비싼 도서*/
select b1.bookname
from book b1
where b1.price > (select avg(b2.price)
                    from book b2
                    where b2.publisher=b1.publisher);