create database if not exists LifeHelper;
use LifeHelper;
create table if not exists pacientes(
id_pac int not null auto_increment unique,
nombre_pac varchar(150) not null, /*Nombre o nombres del paciente*/
apellidos_pac varchar(150) not null, /*Apellido paterno del paciente*/
sexo_pac varchar(12) not null, /*Genero del paciente*/
domicilio_pac varchar(300) not null, /*Calle y numero de casa del paciente*/
telefono_pac varchar(20) not null, /*Numero de celular*/
email_pac varchar(255) not null unique, /*Correo electrónico del paciente*/
pass_pac varchar(8) not null, 
expediente_pac varchar(10000) not null, /*Comentarios de doctor al paciente*/
incidencia_pac varchar(3000) not null,
cita_pac varchar(1200) not null, /*Fecha y hora del cometario del doctor al paciente*/
primary key(id_pac))ENGINE=InnoDB;

DELIMITER //
CREATE TRIGGER ins_pac_login AFTER INSERT ON pacientes FOR EACH ROW
BEGIN
	INSERT INTO login (ids, perfiles, emails, passwords) VALUES (NEW.id_pac,"pac", NEW.email_pac, NEW.pass_pac);
END; //

DELIMITER //
CREATE TRIGGER del_pac_login AFTER DELETE ON pacientes FOR EACH ROW
BEGIN
	DELETE FROM login WHERE (ids=OLD.id_pac AND perfiles="pac");
END; //

DELIMITER //
CREATE TRIGGER upd_pac_login AFTER UPDATE ON pacientes FOR EACH ROW
BEGIN
	UPDATE login SET emails=NEW.email_pac, passwords=NEW.pass_pac WHERE (ids=OLD.id_pac AND perfiles="pac");
END; //


select * from pacientes;
describe pacientes;