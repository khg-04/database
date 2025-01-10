#날짜: 2025/01/09
#이름: 김효경
#내용: 5장 데이터베이스 개체

#실습 5-1
show index from `User1`;
show index from `user2`;
show index from `user3`;

#실습 5-2
create index `idx_user1_uid` on `User1`(`uid`);
analyze table `User1`;

#실습 5-3
drop index idx_user1_uid on `User1`;

#실습 5-4
create view `vw_user1` as (select `name`, `hp`, `age` from `User1`);
create view `vw_user4_age_under30` as (select * from `User4` where `age` < 30);
CREATE VIEW `vw_member_with_sales` AS (
	SELECT 
		a.`uid`   AS `직원아이디`,
		b.`name`  AS `직원이름`,
		b.`pos`   AS `직급`,
		c.`name`  AS `부서명`,
		a.`year`  AS `매출년도`,
		a.`month` AS `월`,
		a.`sale`  AS `매출액`
	FROM `Sales` AS a 	
    JOIN `Member` AS b ON a.uid = b.uid JOIN `Department` AS c ON b.dep = c.depNo );
 
 #실습 5-5   
select * from `vw_user1`;
select * from `vw_user4_age_under30`;

#실습 5-6
drop view `vw_user1`;
drop view `vw_member_with_sales`;
drop view `vw_user4_age_under30`;

#실습 5-7
DELIMITER $$
	create PROCEDURE proc_test1()
    begin
		select * from `Member`;
        select * from `Department`;
	end $$
DELIMITER ;

call proc_test1();

#실습 5-8
delimiter $$
	create procedure proc_test2(in _userName varchar(10))
    begin
		select * from `Member` where `name`=_userName;
	end $$
    delimiter ;

call proc_test2('김유신');

DELIMITER $$
CREATE PROCEDURE proc_test4(IN _pos VARCHAR(10), OUT _count INT) 
BEGIN
	SELECT COUNT(*) INTO _count FROM `Member` WHERE `pos`=_pos ; 
END $$
DELIMITER ;
CALL proc_test4('대리', @_count);
SELECT CONCAT('_count : ', @_count)

#실습 5-9
delimiter $$
	create procedure proc_test5(in _name varchar(10))
    begin
		declare userId varchar(10);
        select `uid` into userId from `Member` where `name` = _name;
        select * from `Sales` where `uid` = userId;
	end $$
delimiter ;
call proc_test5('김유신');

#실습 5-11. 저장 함수 생성 및 호출
 DELIMITER $$
	CREATE FUNCTION func_test1(_userid VARCHAR(10)) RETURNS INT
	deterministic
	BEGIN
		DECLARE total INT;
		SELECT SUM(`sale`) INTO total FROM `Sales` WHERE `uid`=_userid;
		RETURN total;
	END $$
DELIMITER ;

#show global variables like 'log_bin_trust_function_creators';
#SET GlOBAL log_bin_trust_function_creators = 1;

SELECT func_test1('a101'); #저장함수 호출(root에서만 가능)
