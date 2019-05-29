CREATE DATABASE if not exists LifeHelper; 	/*Nombre de la base de datos*/
use LifeHelper;	/*Instruccion para entrar a la base de datos*/
CREATE TABLE if not exists doctores(	/*Crear tabla dentro de la base de datos si no existe con el nombre de "doces"*/
id_doc int auto_increment not null UNIQUE,		/*referencia para asignar de forma automatica un id al registro del doc, es de tipo int y es unico, sera refenciado como primary key*/
nombre_doc varchar(150) NOT NULL,		/*referencia para asignar los nombres del doc, es de tipo text y no puede estar vacio*/
apellidos_doc varchar(150) NOT NULL,	/*referencia para asignar apellido paterno del doc, es de tipo text y no puede estar vacio*/
cedula_doc varchar(10) NOT NULL UNIQUE, /*referencia para asignar la cedula del doc, es de tipo varchar, no puede estar vacio, es unica y no puede ser modificable*/
sexo_doc varchar(12) NOT NULL,	/*referencia para asignar el sexo del doc, es de tipo varchar, no puede estar vacio(femenino, masculino) y no puede ser modificable*/
domicilio_doc varchar(300) NOT NULL,	/*referencia para asignar el domicilio (calle y numero) del doc, es de tipo text, no puede estar vacio y puede ser modificable*/
telefono_doc varchar(20) NOT NULL,	/*referencia para asignar telefono principal de contacto con el doc, es de tipo varchar, no puede estar vacio y puede ser modificable*/
email_doc varchar(255) NOT NULL,		/*referencia para asignar email  del doc, es de tipo text, no puede estar vacio y puede ser modificable*/
pass_doc varchar(8) not null, /*Contraseña de doc*/
primary key (id_doc))ENGINE=InnoDB;

DELIMITER //
CREATE TRIGGER doc_to_login AFTER INSERT ON doctores FOR EACH ROW
BEGIN
	INSERT INTO login (perfil, emails, passwords) VALUES ("doc", NEW.email_doc, NEW.pass_doc);
END; //

desc doctores;
select * from doctores;