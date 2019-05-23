Create DATABASE if not exists LifeHelper;	/*Nombre de la base de datos*/
use LifeHelper;	/*instruccion para entrar a la base de datos*/
Create Table if not exists administrativos(	/*crear tabla dentro de la base de datos si no existe con el nombre de "administrativo"*/
id_administrativo int auto_increment not null UNIQUE,     /*referencia para asignar de forma automatica un id a el registro del administrativo es de tipo int y es unico, sera refen=renciado como primary key*/
nombre_administrativo text NOT NULL,	 /*referencia para asignar los nombres de los administrativo, es de tipo text y no puede estar vacio*/
apellidop_administrativo text NOT NULL,     /*referencia para asignar el apellido paterno de los administrativo, es de tipo text y no puede estar vacio*/
apellidom_administrativo text NOT NULL,     /*referencia para asignar el apellido materno de los administrativo, es de tipo text y no puede estar vacio*/
puesto_administrativo text NOT NULL, /*referencia para asignar el puesto del administrativo (secretaria, director, etc), es de tipo text, puede ser modificado y es not null*/
fnacimiento_administrativo date NOT NULL,     /*referencia para asignar fecha de nacimiento de los administrativo, es de tipo date y no puede estar vacio, puede ser modificado*/
edad_administrativo text NOT NULL,	/*referencia para asignar la edad de los administrativo, es de tipo int y no puede estar vacio, puede ser modificado(se podria obtener de forma automatica con la fecha de nacimiento???*/      
genero_administrativo varchar(12) NOT NULL,	/*referencia para asignar el sexo de los administrativo, es de tipo varchar,no puede estar vacio(femenino, masculino) y no puede ser modificado*/
domicilio_administrativo text NOT NULL,	/*referencia para asignar el domicilio(calle, numero) de los administrativo, es de tipo text,no puede estar vacio y puede ser modificado*/
colonia_administrativo text NOT NULL,	/*referencia para asignar la colonia de los administrativo, es de tipo text,no puede estar vacio y puede ser modificado*/
telefonop_administrativo varchar(20) NOT NULL, /*referencia para asignar telefono principal de contacto con el administrativo, es de tipo varchar, no puede estar vacio y puede ser modificado*/
telefonos_administrativo varchar(20), /*referencia para asignar telefono secundario de contacto con el administrativo, es de tipo varchar,puede estar vacio y puede ser modificado*/
email_administrativo varchar(255) NOT NULL , /*referencia para asignar e-mail para administrativo, es de tipo text, no puede estar vacio y puede ser modificado*/
pass_administrativo varchar(8) NOT NULL, /*contraseña del administrativo*/
cprefnombre_administrativo text NOT NULL, /*referencia para asignar el nombre completo del contacto de referencia principal de el administrativo, es de tipo text, no puede estar vacio y puede ser modificado*/
/* cprefapellidos_administrativo text NOT NULL, /referencia para asignar apellidos del contacto de referencia para administrativo, es de tipo text, no puede estar vacio y puede ser modificado*/
cprefparentesco_administrativo text NOT NULL, /*referencia para asignar parentesco del contacto de referencia para administrativo, es de tipo text, no puede estar vacio y puede ser modificado*/
cpreftelprincipal_administrativo varchar(20) NOT NULL, /*referencia para asignar el telefono de contacto principal del contacto de referencia principal para administrativo, es de tipo varchar, no puede estar vacio y puede ser modificado*/
cpreftelsecundario_administrativo varchar(20), /*referencia para asignar el telefono de contacto secundario del contacto de referencia principal para administrativo, es de tipo varchar, puede estar vacio y puede ser modificado*/
csrefnombre_administrativo text, /*referencia para asignar el nombre completodel contacto de referencia secundario de el administrativo, es de tipo text, puede estar vacio y puede ser modificado*/
/* csrefapellidos_administrativo text, /*referencia para asignar apellidos del contacto de referencia secundario para administrativo, es de tipo text, puede estar vacio y puede ser modificado*/
csresfparentesco_administrativo text, /*referencia para asignar parentesco del contacto de referencia secundario para administrativo, es de tipo text, puede estar vacio y puede ser modificado*/
csreftelprincipal_administrativo varchar(20), /*referencia para asignar el telefono de contacto principal del contacto de referencia secundario para administrativo, es de tipo varchar, puede estar vacio y puede ser modificado*/
csreftelsecundario_administrativo varchar(20), /*referencia para asignar el telefono de contacto secundario del contacto de referencia secundario para administrativo, es de tipo varchar, puede estar vacio y puede ser modificado*/
PRIMARY KEY(id_administrativo)
)ENGINE=InnoDB;

DELIMITER //
CREATE TRIGGER admin_to_login AFTER INSERT ON administrativos FOR EACH ROW
BEGIN
	INSERT INTO login (emails, passwords) VALUES (NEW.email_administrativo, NEW.pass_administrativo);
END; //






