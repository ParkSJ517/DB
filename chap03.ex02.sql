/*주문하지 않은 고객의 이름(부속질의 사용)*/
select name
from customer
where custid not in (select custid
                    from orders);

/*주문하지 않은 고객의 이름(부속질의 사용)*/
select name
from customer
where name not in (select name
            from customer, orders
            where customer.custid=orders.custid);
                    
/*주문 금액의 총액과 주문의 평균 금액*/
select sum(saleprice), avg(saleprice)
from orders;

/*고객의 이름과 고객별 구매액*/
select name, sum(saleprice)
from customer, orders
where customer.custid=orders.custid group by name;

/*고객의 이름과 고객이 구매한 도서 목록*/
select name, bookname
from book, customer, orders
where book.bookid=orders.bookid AND customer.custid=orders.custid;

/*도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문*/
select *
from book, orders
where book.bookid=orders.bookid AND
book.price-orders.saleprice=(select max(book.price-orders.saleprice)
                            from book, orders
                            where book.bookid=orders.bookid);

/*도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름*/
select name, avg(saleprice)
from customer, orders
where customer.custid=orders.custid group by
name having avg(saleprice) > (select avg(orders.saleprice)
                            from orders);
