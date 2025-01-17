#날짜: 2025/01/17
#이름: 김효경
#이름: SQL 연습문제5

#실습 5-1
CREATE DATABASE `BookStore`;
CREATE USER 'bookstore'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `BookStore`.* TO 'bookstore'@'%';
FLUSH PRIVILEGES;

use bookstore;

#실습 5-2
create table `Customer` (
	`custId` int auto_increment primary key,
    `name` varchar(10) not null,
    `address` varchar(20) default null,
	`phone` varchar(13) default null
);

drop table `Customer`;

create table `Book` (
	`bookId` int primary key,
    `bookname` varchar(20) not null,
    `publisher` varchar(20) not null,
	`price` int default null
);

drop table `Book`;

create table `Order` (
	`orderId` int auto_increment primary key,
    `custId` int not null,
    `bookId` int not null,
	`salePrice` int not null,
    `orderDate` date not null
);

drop table `Order`;

#실습 5-3
insert into `Customer` (`name`, `address`, `phone`) values 
('박지성', '영국 맨체스타', '000-5000-0001'),
('김연아', '대한민국 서울', '000-6000-0001'),
('장미란', '대한민국 강원도', '000-7000-0001'),
('추신수', '미국 클리블랜드', '000-8000-0001'),
('박세리', '대한민국 대전', null);

insert into `Book` values
(1, '축구의 역사', '굿스포츠', 7000),
(2, '축구하는 여자', '나무수', 13000),
(3, '축구의 이해', '대한미디어', 22000),
(4, '골프 바이블', '대한미디어', 35000),
(5, '피겨 교본', '굿스포츠', 8000),
(6, '역도 단계별 기술', '굿스포츠', 6000),
(7, '야구의 추억', '이상미디어', 20000),
(8, '야구를 부탁해', '이상미디어', 13000),
(9, '올림픽 이야기', '삼성당', 7500),
(10, 'Olympic Champions', 'Pearson', 13000);

insert into `Order` (custId, bookId, salePrice, orderDate) values
(1, 1, 6000, '2014-07-01'),
(1, 3, 21000, '2014-07-03'),
(2, 5, 8000, '2014-07-03'),
(3, 6, 6000, '2014-07-04'),
(4, 7, 20000, '2014-07-05'),
(1, 2, 12000, '2014-07-07'),
(4, 8, 13000, '2014-07-07'),
(3, 10, 12000, '2014-07-08'),
(2, 10, 7000, '2014-07-09'),
(3, 3, 13000, '2014-07-10');

#실습 5-4. 모든 회원의 회원번호, 이름, 주소를 조회
select custId, name, address from `Customer`;

#실습 5-5. 모든 도서의 이름과 가격을 조회
select bookname, price from `Book`;

#실습 5-7. 모든 도서의 도서번호,  도서이름, 출판사, 가격을 조회
select bookId, bookname, publisher, price from Book;

#실습 5-8. 도서 테이블에 있는 모든 출판사를 조회
select publisher from book;

#실습 5-9. 도서 테이블에 있는 모든 출판사를 조회하시오. 단 조회 결과에서 중복을 제거
select distinct publisher from book;
select `publisher` from `book` group by `publisher`;

#실습 5-10. 가격이 20,000원 이상인 도서
select * from book where price >= 20000;

#실습 5-11. 가격이 20,000원 미만인 도서를 조회
select * from book where price < 20000;

#실습 5-12. 가격이 10,000원 이상 20,000 이하인 도서를 조회
select * from book where price between 10000 and 20000;

#실습 5-13. 가격이 15,000원 이상 30,000 이하인 도서의 도서번호, 도서명, 도서가격을 조회
select bookId, bookname, price from `Book` where price between 15000 and 30000;

#실습 5-14. 도서번호가 2, 3, 5인 도서를 조회
select * from `Book` where bookId in (2, 3, 5);

#실습 5-15. 도서번호가 짝수번호인 도서를 조회
select * from `Book` where bookId % 2 = 0;
select * from `Book` where mod(`bookId`, 2) = 0;

#실습 5-16. 박씨 성 고객을 조회
select * from `Customer` where name like '박%';

#실습 5-17. 대한민국에 거주하는 고객을 조회
select * from `Customer` where address like '대한민국%';

#실습 5-18. 휴대폰 번호가 유효한 고객만 조회
select * from `Customer` where phone is not null;

#실습 5-19. 출판사가 ‘굿스포츠’ 혹은 ‘대한미디어’인 도서를 조회
select * from `book` where publisher in ('굿스포츠', '대한미디어');

#실습 5-20. ‘축구의 역사’를 출간한 출판사를 조회
select publisher from `book` where bookname = '축구의 역사';

#실습 5-21. 도서이름에 ‘축구’가 포함된 출판사를 조회
select publisher from `book` where bookname like '%축구%';

#실습 5-22. 도서이름의 왼쪽 두 번째 위치에 ‘구’라는 문자열을 갖는 도서를 조회
select * from `Book` where bookname like '_구%';

#실습 5-23. 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 조회
select * from `Book` where  bookname like '%축구%' and price >= 20000;

#실습 5-24. 도서를 이름순으로 조회
select * from `Book` order by bookname asc;

#실습 5-25. 도서를 가격순으로 조회하고, 가격이 같으면 이름순으로 조회
select * from `Book` order by price , bookname;

#실습 5-26. 도서를 가격의 내림차순으로 조회하시오. 단 가격이 같다면 출판사를 오름차순으로 조회
select * from `Book` order by price desc, publisher asc;

#실습 5-27. 도서가격이 큰 1, 2, 3위 도서를 조회
select * from `Book` order by price desc limit 3;

#실습 5-28. 도서가격이 작은 1, 2, 3위 도서를 조회
select * from `Book` order by price asc limit 3;

#실습 5-29. 고객이 주문한 도서의 총 판매액을 조회
select sum(salePrice) as `총판매액` from `Order`;

#실습 5-30. 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가를 조회
select sum(salePrice) as `총판매액`, avg(salePrice) as `평균값`, min(salePrice) as `최저가`, max(salePrice) as `최고가` from `Order`;

#실습 5-31. 도서 판매 건수를 조회
select count(*) as `판매건수` from `Order`;

#실습 5-32. 도서제목에 야구가 포함된 도서를 농구로 변경한 후 도서 목록을 조회
update `Book` set bookname = replace(bookname,'야구','농구') where bookname like '야구%';
select * from `Book`;

select `bookId`, replace(bookname,'야구','농구') as `bookName`, `publisher`, `price` from `Book`;

#실습 5-33. 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문도서의 총 수량을 조회. 단, 두 권 이상 구매한 고객만 조회
select custId, count(*) as `수량` from `Order` where salePrice >= 8000 group by custId having `수량` >= 2;

#실습 5-34. 고객과 고객의 주문에 관한 데이터를 모두 조회
select * from `Customer` as cu join `Order` as ord on cu.custId = ord.custId;

#실습 5-35. 고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬하여 조회
select * from `Customer` as cu join `Order` as ord on cu.custId = ord.custId order by cu.custId;

#실습 5-36. 고객의 이름과 고객이 주문한 도서의 판매가격을 조회
select cu.name, ord.salePrice from `Customer` as cu join `Order` as ord on ord.custId = cu.custId order by cu.custId;

#실습 5-37. 고객별로 주문한 모든 도서의 총 판매액을 조회하고, 고객별로 정렬
select name, sum(salePrice) 
	from `Customer` as cu join `Order` as ord on ord.custId = cu.custId
    group by name
	order by name;

#실습 5-38. 고객의 이름과 고객이 주문한 도서의 이름을 조회
select name, bookname 
	from `Customer` as cu 
    join `Order` as ord on ord.custId = cu.custId
    join `Book` as bo on ord.bookId = bo.bookId;
    
#실습 5-39. 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 조회
select name, bookname
	from `Customer` as cu 
    join `Order` as ord on ord.custId = cu.custId
    join `Book` as bo on ord.bookId = bo.bookId
    where price = 20000;
    
#실습 5-40. 도서를 구매하지 않은 고객을 포함해서 고객명과 주문한 도서의 판매가격을 조회
select cu.name, ord.salePrice from `Customer` as cu 
	left join `Order` as ord on ord.custId = cu.custId;
    
#실습 5-41. 김연아 고객이 주문한 도서의 총 판매액을 조회
select sum(salePrice) as `총매출` from `Customer` as cu 
	join `Order` as ord on ord.custId = cu.custId
    group by name
    having name = '김연아';
    
#실습 5-42. 가장 비싼 도서의 이름을 조회
select bookname from `Book` order by price desc limit 1;
select bookname from `Book` where `price` = (select max(`price`) from `Book`);

#실습 5-43. 도서를 주문하지 않은 고객의 이름을 조회
select name from `Customer` as cu 
	left join `Order` as ord on ord.custId = cu.custId
    where salePrice is null;

#실습 5-44. Book 테이블에 새로운 도서 ‘스포츠 의학’을 삽입. 스포츠 의학은 한솔의학서적 에서 출간 했으며 가격은 미정이다
insert into `Book` set 
	`bookId` = 11, `bookName` = '스포츠과학', `publisher` = '한솔의학서적', `price` = null;

#실습 5-45. Customer 테이블에서 고객번호가 5인 고객의 주소를 ‘대한민국 부산’으로 변경
update `Customer` set address = '대한민국 부산' where custId = 5;

#실습 5-46. Customer 테이블에서 고객번호가 5인 고객을 삭제
delete from `Customer` where custId = 5;