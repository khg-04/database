#날짜: 2025/01/13
#이름: 김효경
#내용: SQL 연습문제1

#실습 1-1: 실습 데이터베이스와 사용자 생성(root에서 할 것)
create database `Shop`;
create user 'shop'@'%' identified by '1234'; # %: 원격으로 접속하는 외부사용자라는 뜻
grant all privileges on Shop.* to 'shop'@'%';
flush privileges;

use shop;

create table `Customer` (
	`custId` VARCHAR(10) primary key,
	`name` VARCHAR(10) NOT NULL,
	`hp` CHAR(13) default null,
    `addr` VARCHAR(10) default null,
    `rdate` DATE NOT NULL
);

create table `Product` (
	`prodNo` int primary key,
	`prodName` VARCHAR(10) NOT NULL,
	`stock` int default 0,
    `price` int default null,
    `company` VARCHAR(20) NOT NULL
);

create table `Order` (
	`orderNo` int auto_increment primary key,
    `orderId` varchar(10) not null,
    `orderProduct` int not null,
    `orderCount` int default 1,
    `orderDate` datetime not null
    );
drop table `Customer`;
alter table `product` modify `prodNo` int auto_increment;

#실습 1-3: 데이터 입력
insert into `Customer` values ('c101', '김유신' , '010-1234-1001', '김해시 봉황동', '2022-01-01');
insert into `Customer` values ('c102', '김춘추' , '010-1234-1002', '경주시 보문동', '2022-01-02');
insert into `Customer` values ('c103', '장보고' , '010-1234-1003', '완도군 정산면', '2022-01-03');
insert into `Customer` values ('c104', '강감찬' , '010-1234-1004', '서울시 마포구', '2022-01-04');
insert into `Customer` values ('c105', '이성계' , null , null, '2022-01-05');
insert into `Customer` values ('c106', '정철' , '010-1234-1006', '경기도 용인시', '2022-01-06');
insert into `Customer` values ('c107', '허준' , null , null, '2022-01-07');
insert into `Customer` values ('c108', '이순신' , '010-1234-1008', '서울시 영등포구', '2022-01-08');
insert into `Customer` values ('c109', '송상현' , '010-1234-1009', '부산시 동래구', '2022-01-09');
insert into `Customer` values ('c110', '정약용' , '010-1234-1010', '경기도 광주시', '2022-01-10');

insert into `Product` values (1, '새우깡', 5000, 1500, '농심');
insert into `Product` values (2, '초코파이', 2500, 2500, '오리온');
insert into `Product` values (3, '포카칩', 3600, 1700, '오리온');
insert into `Product` values (4, '양파링', 1250, 1800, '농심');
insert into `Product` values (5, '죠리퐁', 2200, null, '크라운');
insert into `Product` values (6, '마카렛트', 3500, 3500, '롯데');
insert into `Product` values (7, '뿌셔뿌셔', 1650, 1200, '오뚜기');

#실습 3-10
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', 3, 2, '2022-07-01 13:15:10');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c101', 4, 1, '2022-07-01 14:16:11');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c108', 1, 1, '2022-07-01 17:23:18');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c109', 6, 5, '2022-07-02 10:46:36');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', 2, 1, '2022-07-03 09:15:37');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c101', 7, 3, '2022-07-03 12:35:12');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c110', 1, 2, '2022-07-03 16:55:36');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c104', 2, 4, '2022-07-04 14:23:23');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', 1, 3, '2022-07-04 21:54:34');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c107', 6, 1, '2022-07-05 14:21:03');

#실습 1-4: 고객 테이블에 존재하는 모든 속성을 조회
select * from `Customer`;

#실습 1-5: 고객 테이블에서 고객 아이디, 이름, 휴대폰 번호를 조회
select `custId`, `name`, `hp` from `Customer`;

#실습 1-6: 제품 테이블에 존재하는 모든 속성을 조회
select * from `Product`;

#실습 1-7: 제품 테이블에서 제조업체를 조회
select `company` from `Product`;

#실습 1-8: 제품 테이블에서 제조업체를 중복 없이 조회
select distinct `company` from `Product`;

#실습 1-9: 제품 테이블에서 제품명과 단가를 조회
select `prodName`, `price` from `Product`;

#실습 1-10: 제품 테이블에서 제품명과 단가를 조회하되, 단가에 500원을 더해 '조정단가'로 출력
select `prodName`, `price` + 500 as '조정단가' from `Product`;

#실습 1-11: 제품 테이블에서 오리온이 제조한 제품의 제품명, 재고량, 단가를 조회
select `prodName`, `stock`, `price` from `Product` where `company` = '오리온';

#실습 1-12: 주문 테이블에서 'c102' 고객이 주문한 주문제품, 수량, 주문일자를 조회
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderId` = 'c102';

#실습 1-13: 주문 테이블에서 'c102' 고객이 2개이상 주문한 주문제품, 수량, 주문일자를 조회
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderId` = 'c102' and `orderCount` >= 2;

#실습 1-14: 제품 테이블에서 단가가 1000원 이상 2000원 이하인 제품을 조회
select * from `Product` where `price` >= 1000 and `price` <= 2000;

#실습 1-15: 고객 테이블에서 성이 김씨인 고객의 아이디, 이름, 휴대폰, 주소를 조회
select `custId`, `name`, `hp`, `addr` from `Customer` where `name` like '김%';

#실습 1-16: 고객 테이블에서 고객 이름이 2자인 고객의 아이디, 이름, 휴대폰, 주소를 조회
select `custId`, `name`, `hp`, `addr` from `Customer` where `name` like '__';

#실습 1-17: 고객 테이블에서 휴대폰 번호가 입력되지 않은 고객 조회
select * from `Customer` where `hp` is null;

#실습 1-18: 고객 테이블에서 주소가 입력된 고객을 조회
select * from `Customer` where `addr` is not null;

#실습 1-19: 고객 테이블에서 가입일을 내림차순으로 정렬하여 고객 조회
select * from `Customer` order by `rdate` desc;

#실습 1-20: 주문 테이블에서 수량이 3개 이상인 주문내용 조회. 단 주문 수량을 내림차순 정렬하고, 수량이 같으면 제품번호를 기준으로 오름차순 정렬
select * from `Order` where `orderCount` >= 3 order by `orderCount` desc, `orderProduct` asc;

#실습 1-21: 제품 테이블에서 모든 제품의 단가 평균을 조회
select avg(price) from `Product`;

#실습 1-22: '농심'에서 제조한 제품의 제고량 합계를 조회
select sum(stock) as '재고량 합계' from `Product` where `company` = '농심';

#실습 1-23: 고객 테이블에서 고객이 몇 명 등록되어 있는지 조회
select count(*) as '고객수' from `Customer`;

#실습 1-24: 제품 테이블에서 제조업체의 수를 조회
select count(distinct `company`) as '제조업체 수' from `Product`;

#실습 1-25: 주문 테이블에서 주문제품별 수량의 합계 조회
select `orderProduct` as '주문 상품번호', sum(`orderCount`) as '총 주문수량' from `Order` group by `orderProduct`;

#실습 1-26: 제품 테이블에서 제조업체별 제조한 제품의 개수와 제품 중 가장 비싼 단가를 조회
select `company` as '제조업체', count(*) as '제품수', max(`price`) as '최고가' from `Product` group by `company` order by `company` asc;

#실습 1-27: 제품 테이블에서 제품을 2개 이상 제조한 제조업체별로 제품의 개수와 제품 중 가장 비싼 단가를 조회
select `company` as '제조업체', count(*) as '제품수', max(`price`) as '최고가' from `Product` group by `company` having `제품수` >= 2;

#실습 1-28: 주문테이블에서 각 주문고객이 주문한 제품의 총 주문수량을 주문 제품별로 조회
select `orderProduct`, `orderId`, sum(`orderCount`) as '총 주문수량' from `Order` group by `orderProduct`, `orderId` order by `orderProduct`;

#실습 1-29: 'c102' 고객이 주문한 제품의 이름을 조회
select a.orderId, b.prodName from `Order` as a
join `product` as b 
on a.orderProduct = b.prodNo
where `orderid` = 'c102';

#실습 1-30: 주문일지가 7월 3일인 고객의 아이디, 이름, 상품명 그리고 주문 날짜 시간을 조회
select `orderId`, `name`, `prodName`, `orderDate` from `Order` as a
join `Customer` as b
on a.orderId = b.custId
join `Product` as c
on a.orderProduct = c.prodNo
where `orderDate` like '2022-07-03%';
#where date(`orderDate`) = '2022-07-03';
#where month(orderDate) = '07' and day(orderDate) = '03'
#where substr(`orderDate`, 1, 10) = '2022-07-03';