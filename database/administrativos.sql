Create DATABASE if not exists LifeHelper;	/*Nombre de la base de datos*/
use LifeHelper;	/*instruccion para entrar a la base de datos*/
Create Table if not exists Administradores(	/*crear tabla dentro de la base de datos si no existe con el nombre de "Administradores"*/
id_administrador int auto_increment not null UNIQUE,     /*referencia para asignar de forma automatica un id a el registro del administrador es de tipo int y es unico, sera refen=renciado como primary key*/
nombre_administrador text NOT NULL,	 /*referencia para asignar los nombres de los Administradores, es de tipo text y no puede estar vacio*/
apellidop_administrador text NOT NULL,     /*referencia para asignar el apellido paterno de los Administradores, es de tipo text y no puede estar vacio*/
apellidom_administrador text NOT NULL,     /*referencia para asignar el apellido materno de los Administradores, es de tipo text y no puede estar vacio*/
puesto_administrador text NOT NULL, /*referencia para asignar el puesto del administrativo (secretaria, director, etc), es de tipo text, puede ser modificado y es not null*/
fnacimiento_administrador date NOT NULL,     /*referencia para asignar fecha de nacimiento de los Administradores, es de tipo date y no puede estar vacio, puede ser modificado*/
edad_administrador text NOT NULL,	/*referencia para asignar la edad de los Administradores, es de tipo int y no puede estar vacio, puede ser modificado(se podria obtener de forma automatica con la fecha de nacimiento???*/      
genero_administrador varchar(12) NOT NULL,	/*referencia para asignar el sexo de los Administradores, es de tipo varchar,no puede estar vacio(femenino, masculino) y no puede ser modificado*/
domicilio_administrador text NOT NULL,	/*referencia para asignar el domicilio(calle, numero) de los Administradores, es de tipo text,no puede estar vacio y puede ser modificado*/
colonia_administrador text NOT NULL,	/*referencia para asignar la colonia de los Administradores, es de tipo text,no puede estar vacio y puede ser modificado*/
telefonop_administrador varchar(20) NOT NULL, /*referencia para asignar telefono principal de contacto con el Administrador, es de tipo varchar, no puede estar vacio y puede ser modificado*/
telefonos_administrador varchar(20), /*referencia para asignar telefono secundario de contacto con el Administrador, es de tipo varchar,puede estar vacio y puede ser modificado*/
email_administrador text NOT NULL, /*referencia para asignar e-mail para Administrador, es de tipo text, no puede estar vacio y puede ser modificado*/
cprefnombre_administrador text NOT NULL, /*referencia para asignar el nombre del contacto de referencia principal de el Administrador, es de tipo text, no puede estar vacio y puede ser modificado*/
cprefapellidos_administrador text NOT NULL, /*referencia para asignar apellidos del contacto de referencia para Administrador, es de tipo text, no puede estar vacio y puede ser modificado*/
cprefparentesco_administrador text NOT NULL, /*referencia para asignar parentesco del contacto de referencia para Administrador, es de tipo text, no puede estar vacio y puede ser modificado*/
cpreftelprincipal_administrador varchar(20) NOT NULL, /*referencia para asignar el telefono de contacto principal del contacto de referencia principal para Administrador, es de tipo varchar, no puede estar vacio y puede ser modificado*/
cpreftelsecundario_administrador varchar(20), /*referencia para asignar el telefono de contacto secundario del contacto de referencia principal para Administrador, es de tipo varchar, puede estar vacio y puede ser modificado*/
csrefnombre_administrador text, /*referencia para asignar el nombre del contacto de referencia secundario de el Administrador, es de tipo text, puede estar vacio y puede ser modificado*/
csrefapellidos_administrador text, /*referencia para asignar apellidos del contacto de referencia secundario para Administrador, es de tipo text, puede estar vacio y puede ser modificado*/
csresfparentesco_administrador text, /*referencia para asignar parentesco del contacto de referencia secundario para Administrador, es de tipo text, puede estar vacio y puede ser modificado*/
csreftelprincipal_administrador varchar(20), /*referencia para asignar el telefono de contacto principal del contacto de referencia secundario para Administrador, es de tipo varchar, puede estar vacio y puede ser modificado*/
csreftelsecundario_administrador varchar(20), /*referencia para asignar el telefono de contacto secundario del contacto de referencia secundario para Administrador, es de tipo varchar, puede estar vacio y puede ser modificado*/ 
primary key (id_administrador))ENGINE=InnoDB;






