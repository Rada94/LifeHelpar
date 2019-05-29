create database if not exists lifehelper;
use lifehelper;
create table if not exists login(
perfil varchar(20) not null,
emails varchar(90) not null,
passwords varchar(8) not null
)engine=InnoDB;