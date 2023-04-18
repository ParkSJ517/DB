/*department table ����*/
create table department(
deptno int not null, primary key,
deptname varchar2(20),
manager varchar2(20));


/*employee table  ����*/
create table employee(
empno int not null, primary key,
name varchar2(20),
phoneno int,
address varchar2(20),
sex varchar2(20),
position varchar2(20),
deptno int, foreign key(deptno) references department(deptno) on delete cascade);

/*project table ����*/ 
create table project(
projno int not null, primary key,
projname varchar2(20),
deptno int, foreign key(deptno) references department(deptno) on delete cascade);


/*works table ����*/
create table work(
projno int not null, primary key, foreign key(projno) references project(projno) on delete cascade,
empno int not null, primary key, foreign key(empno) references employee(empno) on delete cascade,
hoursworked int);

/*department table ������*/
insert into department values (1,'IT', '����');
insert into department values (2,'Marketing', 'ȫ�浿');

/*employee table ������*/
insert into employee values (1, '�����', 01012341232, '����','��','Programmer',1);
insert into employee values (2, '�̼���', 01012323122, '����','��','Programmer',1);
insert into employee values (3, '�ڿ���', 01076851231, '����','��','Salesperson',2);
insert into employee values (4, 'ȫ�浿', 01012341546, '����','��','Manager',2);
insert into employee values (5, '����', 01012311112, '����','��','Manager',1);

/*project table ������*/
insert into project values(1,'�����ͺ��̽�',1);
insert into project values(2,'��������',2);

/*works table ������*/
insert into work values(1, 1, 3);
insert into work values(1, 2, 1);
insert into work values(2, 3, 1);
insert into work values(2, 4, 5);
insert into work values(1, 5, 1);  