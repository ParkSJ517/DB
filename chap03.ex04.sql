/*새로운 도서 ('스포츠 세계', '대한미디어', 10000원)이 마당서점에 입고되었다. 삽입이 안 될 경우 필요한 데이터가 더 있는지 찾아보시오.*/
insert into book(bookname, publisher, price)
values('스포츠 세계', '대한미디어', 10000);   /*primary key인 bookid가 null값이기 때문에 삽입이 불가능*/

/*'삼성당'에서 출판한 도서를 삭제하시오.*/
delete from book
where publisher='삼성당';

select * from book;

/*'이상미디어'에서 출판한 도서를 삭제하시오. 삭제가 안 되면 원인을 생각해 보시오.*/
delete from book
where publisher='이상미디어';    /*외래키 제약에 위배됨*/

/*출판사 '대한미디어'를 '대한출판사'로 이름을 바꾸시오.*/
update book
set publisher='대한출판사'
where publisher='대한미디어';

/*(테이블 생성) 출판사에 대한 정보를 저장하는 테이블 만들기*/
create table Bookcompany(
name varchar(20) primary key, 
address varchar(20),
begin date);

select * from Bookcompany;
/*(테이블 수정) Bookcompany 테이블에 인터넷 주소를 저장하는 속성 추가하기*/
alter table Bookcompany add webaddress varchar(30);

/*Bookcompany 테이블에 임의의 투플 삽입하기*/
insert into Bookcompany(name, address, begin, webaddress)
values('한빛아카데미', '서울시 마포구', '1993-01-01', 'http://hanbit.co.kr');