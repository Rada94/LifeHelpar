CREATE DATABASE if not exists LifeHelper; 	/*Nombre de la base de datos*/
use LifeHelper;	/*Instruccion para entrar a la base de datos*/
CREATE TABLE if not exists Doctores (	/*Crear tabla dentro de la base de datos si no existe con el nombre de "Doctores"*/
id_doctores int auto_increment not null UNIQUE,		/*referencia para asignar de forma automatica un id al registro del doctor, es de tipo int y es unico, sera refenciado como primary key*/
nombre_doctor text NOT NULL,		/*referencia para asignar los nombres del doctor, es de tipo text y no puede estar vacio*/
apellidop_doctor text NOT NULL,	/*referencia para asignar apellido paterno del doctor, es de tipo text y no puede estar vacio*/
apellidom_doctor text NOT NULL,	/*referencia para asignar apellido materno del doctor, es de tipo text y no puede estar vacio*/
fnacimiento_doctor date NOT NULL,	/*referencia para asignar fecha de nacimiento del doctor, es de tipo date y no puede estar vacio, puede ser modificable*/
cedula_doctor varchar(40) NOT NULL UNIQUE, /*referencia para asignar la cedula del doctor, es de tipo varchar, no puede estar vacio, es unica y no puede ser modificable*/
edad_doctor int NOT NULL,	/*referencia para asignar la edad del doctor, es de tipo int, no puede estar vacio y puede ser modificable(se podria obtener de forma automatica con la fecha de nacimiento?)*/
genero_doctor varchar(12) NOT NULL,	/*referencia para asignar el sexo del doctor, es de tipo varchar, no puede estar vacio(femenino, masculino) y no puede ser modificable*/
domicilio_doctor text NOT NULL,	/*referencia para asignar el domicilio (calle y numero) del doctor, es de tipo text, no puede estar vacio y puede ser modificable*/
colonia_doctor text NOT NULL,	/*referencia para asignar el la colonia del doctor, es de tipo text, no puede estar vacio y puede ser modificable*/
telefonop_doctor varchar (20) NOT NULL,	/*referencia para asignar telefono principal de contacto con el doctor, es de tipo varchar, no puede estar vacio y puede ser modificable*/
telefonos_doctor varchar (20),	/*referencia para asignar telefono secundario de contacto con el doctor, es de tipo varchar, puede estar vacio y puede ser modificable*/
email_doctor text NOT NULL,		/*referencia para asignar email  del doctor, es de tipo text, no puede estar vacio y puede ser modificable*/
cprefnombre_doctor text NOT NULL,	/*referencia para asignar el nombre completo del contacto de referencia principal del doctor, es de tipo text, no puede estar vacio y puede ser modificable*/
/* cprefapellidos_doctor text NOT NULL,	/*referencia para asignar los apellidos del contacto de referencia principal del doctor, es de tipo text, no puede estar vacio y puede ser modificable*/
cprefparentesco_doctor text NOT NULL,	/*referencia para asignar el parentesco del contacto de referencia principal con el doctor, es de tipo text, no puede estar vacio y puede ser modificable*/
cpreftelprincipal_doctor varchar (20) NOT NULL,	/*referencia para asignar el tlefono de contacto principal del contacto de referencia principal del doctor, es de tipo varchar, no puede estar vacio y puede ser modificable*/
cpreftelsecundario_doctor varchar (20), /*referencia para asignar el telefono de contacto secundario del contacto de referencia principal del doctor, es de tipo varchar, puede estar vacio y puede ser modificable*/
csrefnombre_doctor text,	/*referencia para asignar el nombre completo del contacto de referencia secundario del doctor, es de tipo text, puede estar vacio y puede ser modificable*/
/* csrefapellidos_doctor text,	/*referencia para asignar los apellidos del contacto de referencia secundario del doctor, es de tipo text, puede estar vacio y puede ser modificable*/
csrefparentesco_doctor text,	/*referencia para asignar el parentesco del contacto de referencia secundario con el doctor, es de tipo text, puede estar vacio y puede ser modificable*/
csreftelprincipal_doctor varchar (20),	/*referencia para asignar el telefono de contacto principal del contacto de referencia secundario del doctor, es de tipo varchar, puede estar vacio y puede ser modificable*/
csreftelsecundario_doctor varchar (20), /*referencia para asignar el tlefono de contacto secundario del contacto de referencia secundario del doctor, es de tipo varchar, puede estar vacio y puede ser modificable*/
primary key (id_doctores))ENGINE=InnoDB; /*Test 1*/