CREATE DATABASE if not exists LifeHelper; 	/*Nombre de la base de datos*/
use LifeHelper;	/*Instruccion para entrar a la base de datos*/
CREATE TABLE if not exists doctores(	/*Crear tabla dentro de la base de datos si no existe con el nombre de "Doctores"*/
id_doctor int auto_increment not null UNIQUE,		/*referencia para asignar de forma automatica un id al registro del doctor, es de tipo int y es unico, sera refenciado como primary key*/
nombre_doctor text NOT NULL,		/*referencia para asignar los nombres del doctor, es de tipo text y no puede estar vacio*/
apellidos_doctor text NOT NULL,	/*referencia para asignar apellido paterno del doctor, es de tipo text y no puede estar vacio*/
cedula_doctor varchar(40) NOT NULL UNIQUE, /*referencia para asignar la cedula del doctor, es de tipo varchar, no puede estar vacio, es unica y no puede ser modificable*/
genero_doctor varchar(12) NOT NULL,	/*referencia para asignar el sexo del doctor, es de tipo varchar, no puede estar vacio(femenino, masculino) y no puede ser modificable*/
domicilio_doctor text NOT NULL,	/*referencia para asignar el domicilio (calle y numero) del doctor, es de tipo text, no puede estar vacio y puede ser modificable*/
telefono_doctor varchar (20) NOT NULL,	/*referencia para asignar telefono principal de contacto con el doctor, es de tipo varchar, no puede estar vacio y puede ser modificable*/
email_doctor varchar(255) NOT NULL,		/*referencia para asignar email  del doctor, es de tipo text, no puede estar vacio y puede ser modificable*/
pass_doctor varchar(8), /*Contraseña de doctor*/
primary key (id_doctores))ENGINE=InnoDB;

DELIMITER //
CREATE TRIGGER doctor_to_login AFTER INSERT ON doctores FOR EACH ROW
BEGIN
	INSERT INTO login (perfil, emails, passwords) VALUES ("Doctor", NEW.email_doctor, NEW.pass_doctor);
END; //