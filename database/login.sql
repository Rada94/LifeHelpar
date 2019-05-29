create database if not exists lifehelper;
use lifehelper;
create table if not exists login(
ids int not null,
perfiles varchar(200) not null,
emails varchar(255) not null,
passwords varchar(8) not null
)engine=InnoDB;

select * from login;