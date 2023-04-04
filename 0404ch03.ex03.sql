/*�������� ������ ������ ���ǻ� ��*/
select count(distinct publisher)
from book, customer, orders
where customer.custid=orders.custid AND book.bookid=orders.bookid AND customer.name like '������';

/*�������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����*/
select bookname, price, price-saleprice 
from book, orders, customer
where customer.custid=orders.custid AND book.bookid=orders.bookid AND customer.name like '������'; 

/*�������� �������� ���� ������ �̸�*/
select distinct bookname
from book, orders, customer
where customer.custid=orders.custid AND book.bookid=orders.bookid AND not customer.name like '������';

/*�ֹ����� ���� ���� �̸�(�μ����� ���)*/
select name
from customer
where custid not in (select custid
                    from orders);
                    
/*�ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�*/
select sum(saleprice), avg(saleprice)
from orders;

/*���� �̸��� ���� ���ž�*/
select name, sum(saleprice)
from customer, orders
where customer.custid=orders.custid group by customer.name;

/*���� �̸��� ���� ������ ���� ���*/
select name, bookname
from book, customer, orders
where book.bookid=orders.bookid AND customer.custid=orders.custid;

/*������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�*/
select orders.*
from book, orders
where book.bookid=orders.bookid AND
book.price-orders.saleprice=(select max(book.price-orders.saleprice)
                            from book, orders
                            where book.bookid=orders.bookid);

/*������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�*/
select name
from customer, orders
where customer.custid=orders.custid group by
name having avg(saleprice) > (select avg(orders.saleprice)
                            from orders);