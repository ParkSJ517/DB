/*��ø����(nested subquery)-where��- �񱳿�����*/
select orderid, custid, saleprice
from orders md
where saleprice>(select avg(saleprice)
                from orders so
                where md.custid=so.custid);

select avg(saleprice)
from orders
where custid=1;

/*��ø����(nested subquery)-in, not in ������*/
select sum(saleprice) "total"
from orders
where custid in (select custid
                from customer
                where address like '%���ѹα�%');
                
select custid
from customer
where address like '%���ѹα�%';

/*��ø����(nested subquery)-all, some(any)������*/
select orderid, saleprice
from orders
where saleprice > all(select saleprice
                    from orders
                    where custid=3);
                    
select saleprice
from orders
where custid=3;

/*��ø����(nested subquery)-exists, not exists SET������*/
select sum(saleprice) "total"
from orders od
where exists(select *
            from customer cs
            where address like '%���ѹα�%' and cs.custid=od.custid);