create database if not exists LifeHelper;
use LifeHelper;
create table if not exists pacientes(
id_paciente int auto_increment not null unique,
nombre_paciente text not null,
apellidop_paciente text not null,
apellidom_paciente text not null,
edad_paciente int not null,
domicilio_paciente text not null,
telefonoc_paciente varchar(20) not null,
mobil_paciente varchar(20) not null,
genero_paciente varchar(12) not null,
foto_paciente blob not null
);