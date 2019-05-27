Create DATABASE if not exists LifeHelper;	/*Nombre de la base de datos*/
use LifeHelper;	/*instruccion para entrar a la base de datos*/
Create Table if not exists administrativos(	/*crear tabla dentro de la base de datos si no existe con el nombre de "administrativo"*/
id_administrativo int auto_increment not null UNIQUE,     /*referencia para asignar de forma automatica un id a el registro del administrativo es de tipo int y es unico, sera refen=renciado como primary key*/
nombre_administrativo text NOT NULL,	 /*referencia para asignar los nombres de los administrativo, es de tipo text y no puede estar vacio*/
apellidos_administrativo text NOT NULL,     /*referencia para asignar el apellido paterno de los administrativo, es de tipo text y no puede estar vacio*/
puesto_administrativo text NOT NULL, /*referencia para asignar el puesto del administrativo (secretaria, director, etc), es de tipo text, puede ser modificado y es not null*/
genero_administrativo varchar(12) NOT NULL,	/*referencia para asignar el sexo de los administrativo, es de tipo varchar,no puede estar vacio(femenino, masculino) y no puede ser modificado*/
domicilio_administrativo text NOT NULL,	/*referencia para asignar el domicilio(calle, numero) de los administrativo, es de tipo text,no puede estar vacio y puede ser modificado*/
telefono_administrativo varchar(20) NOT NULL, /*referencia para asignar telefono principal de contacto con el administrativo, es de tipo varchar, no puede estar vacio y puede ser modificado*/
email_administrativo varchar(255) NOT NULL , /*referencia para asignar e-mail para administrativo, es de tipo text, no puede estar vacio y puede ser modificado*/
pass_administrativo varchar(8) NOT NULL, /*contraseña del administrativo*/
PRIMARY KEY(id_administrativo)
)ENGINE=InnoDB;

DELIMITER //
CREATE TRIGGER admin_to_login AFTER INSERT ON administrativos FOR EACH ROW
BEGIN
	INSERT INTO login (perfil, emails, passwords) VALUES (NEW.puesto_administrativo, NEW.email_administrativo, NEW.pass_administrativo);
END; //