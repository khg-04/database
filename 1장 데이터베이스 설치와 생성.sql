#날짜: 2025/01/06
#이름: 김효경
#내용: 1장 데이터베이스 설치와 생성

#실습 1-1
CREATE DATABASE `StudyDB`;
#DROP DATABASE `StudyDB`;

#실습 1-2
CREATE USER 'rlagyrud222'@'%' identified by '1234';
GRANT ALL PRIVILEGES ON StudyDB.* to 'rlagyrud222'@'%';
FLUSH PRIVILEGES;

#실습 1-3
ALTER USER 'rlagyrud222'@'%' IDENTIFIED BY 'abc1234';
DROP USER 'rlagyrud222'@'%';
FLUSH PRIVILEGES;