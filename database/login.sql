create database if not exists lifehelper;
use lifehelper;
create table if not exists login(
emails varchar(255) not null,
passwords varchar(8) not null
)engine=InnoDB;