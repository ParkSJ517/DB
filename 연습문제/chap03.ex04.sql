/*���ο� ���� ('������ ����', '���ѹ̵��', 10000��)�� ���缭���� �԰�Ǿ���. ������ �� �� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ��ÿ�.*/
insert into book(bookname, publisher, price)
values('������ ����', '���ѹ̵��', 10000);   /*primary key�� bookid�� null���̱� ������ ������ �Ұ���*/

/*'�Ｚ��'���� ������ ������ �����Ͻÿ�.*/
delete from book
where publisher='�Ｚ��';

select * from book;

/*'�̻�̵��'���� ������ ������ �����Ͻÿ�. ������ �� �Ǹ� ������ ������ ���ÿ�.*/
delete from book
where publisher='�̻�̵��';    /*�ܷ�Ű ���࿡ �����*/

/*���ǻ� '���ѹ̵��'�� '�������ǻ�'�� �̸��� �ٲٽÿ�.*/
update book
set publisher='�������ǻ�'
where publisher='���ѹ̵��';

/*(���̺� ����) ���ǻ翡 ���� ������ �����ϴ� ���̺� �����*/
create table Bookcompany(
name varchar(20) primary key, 
address varchar(20),
begin date);

select * from Bookcompany;
/*(���̺� ����) Bookcompany ���̺� ���ͳ� �ּҸ� �����ϴ� �Ӽ� �߰��ϱ�*/
alter table Bookcompany add webaddress varchar(30);

/*Bookcompany ���̺� ������ ���� �����ϱ�*/
insert into Bookcompany(name, address, begin, webaddress)
values('�Ѻ���ī����', '����� ������', '1993-01-01', 'http://hanbit.co.kr');