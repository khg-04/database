#실습2-1
create database `Bank`;
create user 'bank'@'%' identified by '1234';
grant all privileges on Bank.* to 'bank'@'%';
flush privileges;

use bank;

#실습2-2
create table `bank_customer` (
	`c_no` VARCHAR(14) primary key,
	`c_name` VARCHAR(20) NOT NULL,
	`c_dist` int default 0 not null,
    `c_phone` VARCHAR(20) NOT NULL,
    `c_addr` varchar(100) default null
);

create table `bank_account` (
	`a_no` VARCHAR(11) primary key,
	`a_item_dist` VARCHAR(2) NOT NULL,
	`a_item_name` varchar(20) not null,
    `a_c_no` varchar(14) not null,
    `a_balance` int default 0 not null,
    `a_open_date` date not null
);

create table `bank_transaction` (
	`t_no` int auto_increment primary key,
    `t_a_no` varchar(11) not null,
    `t_dist` int not null,
    `t_amount` int not null,
    `t_datetime` datetime not null
);

#실습2-3
INSERT INTO `bank_customer` VALUES ('730423-1000001', '김유신',     1, '010-1234-1001', '경기도 수원시');
INSERT INTO `bank_customer` VALUES ('750210-1000002', '김춘추',     1, '010-1234-1002', '경기도 광주시');
INSERT INTO `bank_customer` VALUES ('830513-2000003', '선덕여왕',   1, '010-1234-1003', '서울시 마포구');
INSERT INTO `bank_customer` VALUES ('870830-1000004', '강감찬',     1, '010-1234-1004', '서울시 영등포구');
INSERT INTO `bank_customer` VALUES ('910912-2000005', '신사임당',   1, '010-1234-1005', '강원도 강릉시');
INSERT INTO `bank_customer` VALUES ('941127-1000006', '이순신',     1, '010-1234-1006', '부산시 영도구');
INSERT INTO `bank_customer` VALUES ('220-82-52237', '(주)한국전산', 2, '02-134-1045',   '서울시 강서구');
INSERT INTO `bank_customer` VALUES ('361-22-42687', '(주)정보산업', 2, '031-563-1253',  '경기도 광명시');
INSERT INTO `bank_customer` VALUES ('102-22-51094', '부산의원',     2, '051-518-1010',  '부산시 남구');

INSERT INTO `bank_account` VALUES ('101-11-1001', 'S1', '자유저축예금', '730423-1000001',  420000, '2005-07-21');
INSERT INTO `bank_account` VALUES ('101-12-1002', 'S2', '정기적립예금', '830513-2000003', 1020000, '2011-05-13');
INSERT INTO `bank_account` VALUES ('101-11-1003', 'S1', '자유저축예금', '870830-1000004',  53000, '2007-02-17');
INSERT INTO `bank_account` VALUES ('101-21-1004', 'L1', '고객신용대출', '910912-2000005', 1200500, '2009-08-25');
INSERT INTO `bank_account` VALUES ('101-13-1005', 'S3', '주택청약예금', '941127-1000006', 720800, '2012-10-15');
INSERT INTO `bank_account` VALUES ('101-22-1006', 'L2', '예금담보대출', '730423-1000001', 25000, '2013-12-11');
INSERT INTO `bank_account` VALUES ('101-23-1007', 'L3', '주택담보대출', '750210-1000002', 2700000, '2020-09-23');
INSERT INTO `bank_account` VALUES ('101-11-2001', 'S1', '자유저축예금', '220-82-52237', 23000000, '2003-04-14');
INSERT INTO `bank_account` VALUES ('101-11-2002', 'S1', '자유저축예금', '361-22-42687',  4201000, '2008-12-30');
INSERT INTO `bank_account` VALUES ('101-11-2003', 'S1', '자유저축예금', '102-22-51094', 8325010, '2010-06-07');

INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-1001', 1, 50000, NOW());
INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-1003', 2, 120000, NOW());
INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-2001', 2, 300000, NOW());
INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-12-1002', 1, 1000000, NOW());
INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-1001', 3, 0, NOW());
INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-13-1005', 1, 200000, NOW());
INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-1001', 1, 450000, NOW());
INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-2002', 2, 32000, NOW());
INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-2003', 3, 0, NOW());
INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-1003', 1, 75000, NOW());

#실습2-7. 고객의 이름과 계좌번호를 조회
select `c_name`, `c_no` from `bank_customer`;

#실습2-8. 모든 계좌의 구분번호와 계좌상품 이름 조회
select `a_item_dist`, `a_item_name` from `bank_account`;

#실습 2-9. 모든 계좌의 구분번호와 계솨상품 이름 조회, 단 중복 제거
select distinct `a_item_dist`, `a_item_name` from `bank_account`;

#실습 2-10. 자유저축예금 계좌 중 잔고액이 100만원 이상을 조회
select * from `bank_account` where `a_item_name` = '자유저축예금' and `a_balance` >= 1000000;

#실습 2-11. 경기도에 거주하는 고객을 조회
select * from `bank_customer` where `c_addr` like '경기도%';

#실습 2-12. 기업고객 조회
select * from `bank_customer` where `c_dist` = 2;

#실습 2-13. 거래네역 중 입금만 조회
select * from `bank_transaction` where `t_dist` = 1;

#실습 2-14. 출금액이 가장 큰 순서로 조회
select * from `bank_transaction` where `t_dist` = 2 order by `t_amount` desc;

#실습 2-15. 입금액의 총합과 평균
select sum(t_amount) as '입금총합', avg(t_amount) as '입금평균' from `bank_transaction` where `t_dist` = 1;

#실습 2-16. 출금액의 가장 큰 금액과 가장 작은 금액
select max(t_amount) as '큰 금액', min(t_amount) as '작은 금액' from `bank_transaction` where `t_dist` = 2;

#실습 2-17. 자유저축 예금계좌에서 큰 잔고액 순으로 조회
select * from `bank_account` where `a_item_name` = '자유저축예금' order by `a_balance` desc;

#실습 2-18. 가장 많은 잔고를 보유한 자유저축 예금계좌를 조회
select * from `bank_account` where `a_item_name` = '자유저축예금' order by `a_balance` desc limit 1;

#실습 2-19. 거래내역에서 입금액과 출금액이 각각 큰 순서로 조회
select * from `bank_transaction` where `t_dist` = 1 or `t_dist` = 2 order by `t_dist`, `t_amount` desc;

#실습 2-20. 거래내역에서 입금 건수, 출금 건수, 조회 건수를 조회
select
	count(case when `t_dist`=1 then 1 end) as `입금 건수`,
    count(case when `t_dist`=2 then 1 end) as `출금 건수`,
    count(case when `t_dist`=3 then 1 end) as `조회 건수`
    from `bank_transaction`;
    
#실습 2-21. 거래내역에서 거래 구분번호를 통해 type을 아래와 같이 조회
select `t_dist`,
	case
		when (`t_dist`=1) then '입금'
        when (`t_dist`=2) then '출금'
        when (`t_dist`=3) then '조회'
	end as 'type',
    `t_a_no`,
    `t_amount`
 from `bank_transaction`;

#실습 2-23. 입금 거래만 계좌별로 합계를 조회
select `t_a_no`, `t_dist`, sum(`t_amount`) from `bank_transaction` where `t_dist` = 1 group by `t_a_no`

#실습 2-24. 입금 거래만 계좌별로 합계 구하고 10만원 이상만 큰 순서로 조회
select `t_a_no`, `t_dist`