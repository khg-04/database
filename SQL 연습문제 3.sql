CREATE DATABASE `College`;
CREATE USER 'college'@'%' IDENTIFIED BY '1234'; 
GRANT ALL PRIVILEGES ON College.* TO 'college'@'%'; 
FLUSH PRIVILEGES;

use college;

create table `Student` (
	`stdNo` char(8) primary key,
    `stdName` varchar(20) not null,
    `stdHp` char(13) not null,
    `stdYear` int not null,
    `stdAddress` varchar(100) default null
);

create table `Lecture` (
	`lecNo` int primary key,
    `lecName` varchar(20) not null,
    `lecCredit` int not null,
    `lecTime` int not null,
    `lecClass` varchar(10)
);