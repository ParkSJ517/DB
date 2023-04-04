/*���� �̸��� ���� �ֹ��� ������ �ǸŰ���*/
select name, saleprice
from customer left outer join orders
on customer.custid=orders.custid;

/*���� �̸��� ���� �ֹ��� ������ �ǸŰ���*/
select name, saleprice
from customer, orders
where customer.custid=orders.custid(+);

/*���� ��� ������ ���� ǥ��*/
select max(price)
from book;

/*���� ��� ������ �̸�*/
select bookname
from book
where price=35000;

/*���� ��� ������ �̸�*/
select bookname
from book
where price=(select max(price)
            from book);
            
/*������ ������ ���� �ִ� ��*/
select custid
from orders;

/*�� ���̵� �ش��ϴ� �� �̸�*/
select name
from customer
where custid in (1,2,3,4);

/*�� ���̵� �ش��ϴ� �� �̸�*/
select name
from customer
where custid in (select custid
                from orders);
                
/*���ǻ纰 ���ǻ��� ��պ��� ��� ����*/
select b1.bookname
from book b1
where b1.price > (select avg(b2.price)
                    from book b2
                    where b2.publisher=b1.publisher);