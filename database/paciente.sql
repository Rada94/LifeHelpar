create database if not exists LifeHelper;
use LifeHelper;
create table if not exists pacientes(
id_paciente int not null auto_increment unique,
nombre_paciente text not null, /*Nombre o nombres del paciente*/
apellidos_paciente text not null, /*Apellido paterno del paciente*/
genero_paciente varchar(12) not null, /*Genero del paciente*/
domicilio_paciente text not null, /*Calle y numero de casa del paciente*/
telefono_paciente varchar(20) not null, /*Numero de celular*/
email_paciente varchar(255) not null unique, /*Correo electrónico del paciente*/
pass_paciente varchar(8) not null, 
status_paciente text, /*Status del paciente*/
expediente_paciente longtext not null, /*Comentarios de doctor al paciente*/
incidencia_paciente varchar(15),
cita_paciente datetime not null, /*Fecha y hora del cometario del doctor al paciente*/
primary key(id_paciente))ENGINE=InnoDB;

DELIMITER //
CREATE TRIGGER paciente_to_login AFTER INSERT ON pacientes FOR EACH ROW
BEGIN
	INSERT INTO login (perfil, emails, passwords) VALUES ("Paciente", NEW.email_paciente, NEW.pass_paciente);
END; //