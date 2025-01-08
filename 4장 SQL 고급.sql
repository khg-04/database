#날짜: 2025/01/08
#이름: 김철학
#내용: 4장 SQL 고급

#실습 4-1
create table `Member` (
	`uid` VARCHAR(10) primary key,
	`name` VARCHAR(10) NOT NULL,
	`hp` CHAR(13) unique not null,
    `pos` VARCHAR(10) default '사원',
    `dep` INT,
    `rdate` DATETIME NOT NULL
);
create table `Department` (
	`depNo` INT primary key,
    `name` VARCHAR(10) NOT NULL,
    `tel` char(12) not null
);
create table `Sales` ( 
	`seq` int auto_increment primary key,
    `uid` VARCHAR(10) not null,
    `year` year not null,
    `month` tinyint not null,
    `sale` int
);

#실습 4-2
insert into `Member` values ('a101', '박혁거세' , '010-1234-1001', '부장', 101, now());
insert into `Member` values ('a102', '김유신' , '010-1234-1002', '차장', 101, now());
insert into `Member` values ('a103', '김춘추' , '010-1234-1003', '사장', 101, now());
insert into `Member` values ('a104', '장보고' , '010-1234-1004', '대리', 102, now());
insert into `Member` values ('a105', '강감찬' , '010-1234-1005', '과장', 103, now());
insert into `Member` values ('a106', '이성계' , '010-1234-1006', '차장', 103, now());
insert into `Member` values ('a107', '정철' , '010-1234-1007', '차장', 103, now());
insert into `Member` values ('a108', '이순신' , '010-1234-1008', '부장', 104, now());
insert into `Member` values ('a109', '허균' , '010-1234-1009', '부장', 104, now());
insert into `Member` values ('a110', '정약용' , '010-1234-1010', '사원', 105, now());
insert into `Member` values ('a111', '박지원' , '010-1234-1011', '사원', 105, now());

insert into `Department` values (101, '영업1부', '051-512-1001');
insert into `Department` values (102, '영업2부', '051-512-1002');
insert into `Department` values (103, '영업3부', '051-512-1003');
insert into `Department` values (104, '영업4부', '051-512-1004');
insert into `Department` values (105, '영업5부', '051-512-1005');
insert into `Department` values (106, '영업지원부', '051-512-1006');
insert into `Department` values (107, '인사부', '051-512-1007');

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 1, 98100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 1, 136000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 1, 80000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2018, 1, 78000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 1, 93000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 2, 23500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 2, 126000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 2, 18500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 2, 19000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2018, 2, 53000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2019, 1, 24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 1, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 1, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 1, 53500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2019, 1, 160000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 2, 43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2019, 2, 24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2019, 2, 109000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 1, 63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 1, 74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2020, 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2020, 1, 111000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2020, 2, 93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 2, 84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 2, 76000);

#실습 4-3
SELECT * FROM `Member` WHERE `name`='김유신';
SELECT * FROM `Member` WHERE `pos`='차장' AND dep=101;
SELECT * FROM `Member` WHERE `pos`='차장' OR dep=101;
SELECT * FROM `Member` WHERE `name` != '김춘추';
SELECT * FROM `Member` WHERE `name` <> '김춘추';
SELECT * FROM `Member` WHERE `pos`='사원' OR `pos`='대리';
SELECT * FROM `Member` WHERE `pos` IN('사원', '대리');
SELECT * FROM `Member` WHERE `dep` IN(101, 102, 103);
SELECT * FROM `Member` WHERE `name` LIKE '%신';
SELECT * FROM `Member` WHERE `name` LIKE '김%';
SELECT * FROM `Member` WHERE `name` LIKE '김__';
SELECT * FROM `Member` WHERE `name` LIKE '_성_';
SELECT * FROM `Member` WHERE `name` LIKE '정_';
SELECT * FROM `Sales` WHERE `sale` > 50000;
SELECT * FROM `Sales` WHERE `sale` >= 50000 AND `sale` < 100000 AND `month`=1;
SELECT * FROM `Sales` WHERE `sale` BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `sale` NOT BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `year` IN(2020);
SELECT * FROM `Sales` WHERE `month` IN(1, 2);

#실습 4-4
select * from `Sales` order by `sale`;
select * from `Sales` order by `sale` ASC;
select * from `Sales` order by `sale` desc;
select * from `member` order by `name`;
select * from `member` order by `name` asc;
select * from `member` order by `name` desc;
select * from `member` order by `rdate` ASC;
SELECT * FROM `Sales` WHERE `sale` > 50000 ORDER BY `sale` DESC;
select * from `Sales`
	where `sale` > 50000
    order by `year`, `month`, `sale` desc;

#실습 4-5
select * from sales limit 3;
SELECT * FROM Sales LIMIT 0, 3;
SELECT * FROM Sales LIMIT 1, 2;
SELECT * FROM Sales LIMIT 5, 3;
SELECT * FROM Sales ORDER BY `sale` DESC LIMIT 3, 5;
SELECT * FROM Sales WHERE `sale` < 50000 ORDER BY `sale` DESC LIMIT 3;
SELECT * FROM Sales
	WHERE `sale` > 50000
	ORDER BY `year` DESC, `month`, `sale` DESC
	LIMIT 5;
    
#실습 4-6
select sum(sale) as `합계` from `Sales`;
select ceiling(1.2);
select ceiling(1.8);
select round(1.2);
select round(1.8);
select rand();
SELECT CEILING(RAND() * 10);
SELECT COUNT(*) AS `갯수` FROM `Sales`;

SELECT LEFT('HelloWorld', 5);
SELECT RIGHT('HelloWorld', 5);
SELECT SUBSTRING('HelloWorld', 6, 5);
SELECT CONCAT('Hello', 'World');
SELECT CONCAT(`uid`, `name`, `hp`) FROM `member` WHERE `uid`='a108';

select curdate();
select curtime();
select now();

#실습 4-7. 2018년 1월 매출의 총합을 구하시오
select sum(sale) as `총합` from `Sales`
	where `year` = 2018 and `month` = 1;

#실습 4-8. 2019년 2월에 5만원 이상 매출에 대한 총합과 평균을 구하시오
select sum(sale) as `총합`, avg(sale) as `평균` from `Sales` 
	where `sale` >= 50000 and `year` = 2019 and `month` = 2; 
    
#실습 4-9. 2020년 전체 매출 가운데 최저, 최고, 매출을 구하시오
select max(sale) as `최고 매출`, min(sale) as `최저 매출` from `Sales`
	where `year` = 2020;