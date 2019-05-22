create database if not exists LifeHelper;
use LifeHelper;
create table if not exists pacientes(
id_paciente int not null auto_increment unique primary key,
nombre_paciente text not null,
apellidop_paciente text not null,
apellidom_paciente text not null,
fnacimiento_paciente date not null,
edad_paciente int not null,
genero_paciente varchar(12) not null,
calleynumero_paciente text not null, /*Calle y numero de casa del paciente*/
colonia_paciente text not null,
celular_paciente varchar(20) not null,
telefono_opcinal_paciente varchar(20),
email_paciente text not null unique,
status_paciente text not null, /*Status del paciente*/
expediente_paciente longtext not null, /*Comentarios de doctor al paciente*/
fcitas_paciente datetime not null, /*Fecha y hora del cometario del doctor al paciente*/
crefnombre_paciente text not null, /*Nombre del referenciado del paciente*/
crefparentezco_paciente text not null, /*Referencia Familiar*/
telrefparentezco_paciente text not null, /*Telefono del familiar*/
crefparentezco_opcional_paciente text, /*Referencia opcional*/
telrefparentezco_opcional_paciente text, /*Telefono de la referencia opcional*/
telefonoref_paciente text not null /*Numero de telefono del referenciado del paciente*/
);