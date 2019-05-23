create database if not exists LifeHelper;
use LifeHelper;
create table if not exists pacientes(
id_paciente int not null auto_increment unique,
nombre_paciente text not null, /*Nombre o nombres del paciente*/
apellidop_paciente text not null, /*Apellido paterno del paciente*/
apellidom_paciente text not null, /*Apellido materno del paciente*/
fnacimiento_paciente date not null, /*Fecha de nacimiento del paciente*/
edad_paciente int not null, /*Edad del paciente*/
genero_paciente varchar(12) not null, /*Genero del paciente*/
calleynumero_paciente text not null, /*Calle y numero de casa del paciente*/
colonia_paciente text not null, /*Colonia donde vive el paciente*/
ciudad_paciente text not null, /*Ciudad donde viene el paciente*/
estado_paciente text not null, /*Estado donde vive el paciente*/
celular_paciente varchar(20) not null, /*Numero de celular*/
telefono_opcinal_paciente varchar(20), /*Numero de telefono opcional*/
email_paciente varchar(255) not null unique, /*Correo electrónico del paciente*/
pass_paciente varchar(8) not null, 
status_paciente text not null, /*Status del paciente*/
expediente_paciente longtext not null, /*Comentarios de doctor al paciente*/
fcitas_paciente datetime not null, /*Fecha y hora del cometario del doctor al paciente*/
cprefnombre_paciente text not null, /*Nombre compelto del referenciado principal*/
cprefparentesco_paciente text not null, /*Tipo de persona para la referencia principal*/
cpreftelprincipal_paciente varchar(20) not null, /*Telefono de referencia principal del paciente*/
cpreftelsecundario_paciente varchar(20), /*Telefono de referencia opcional del paciente*/
csrefnombre_paciente text, /*Nombre compelto del referenciado principal*/
csrefparentesco_paciente text, /*Tipo de persona para la referencia principal*/
csreftelprincipal_paciente varchar(20), /*Telefono de referencia secundaria principal del paciente*/
csreftelsecundario_paciente varchar(20), /*Telefono de referencia secundaria opcional del paciente*/
inicioatencion_paciente datetime not null, /*Cuando se unio al servicio*/
finatencion_paciente datetime, /*Cuando dejo el servicio*/
motivofin_paciente text, /*Motivo de fin de la atencion*/
primary key(id_paciente))ENGINE=InnoDB;

DELIMITER //
CREATE TRIGGER paciente_to_login AFTER INSERT ON pacientes FOR EACH ROW
BEGIN
	INSERT INTO login (emails, passwords) VALUES (NEW.email_pacientes, NEW.pass_paciente);
END; //