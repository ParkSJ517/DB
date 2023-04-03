/*������ȣ�� 1�� ������ �̸�*/
select bookname
from book
where bookid=1;

/*������ 20000�� �̻��� ������ �̸�*/
select bookname
from book
where price>=20000;

/*�������� �� ���ž�*/
select sum(saleprice)
from orders
where custid=1;

/*�������� �� ���ž�*/
select sum(saleprice)
from orders, customer
where customer.custid=orders.custid AND customer.name like '������'; 

/*�������� ������ ������ ��*/
select count(*)
from orders
where custid=1;

/*�������� ������ ������ ��*/
select count(*)
from orders, customer
where customer.custid=orders.custid AND customer.name like '������';

/*�������� ������ ������ ���ǻ� ��*/
select count(publisher)
from book, customer, orders
where book.bookid=orders.bookid AND customer.custid=orders.custid AND customer.name like '������'