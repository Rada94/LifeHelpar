<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css" >

<title>Insert title here</title>
</head>
<body>

	<p>doctores</p>
	
	buscar paciente y traer su perfil</br>
	agregar expediente en la parte de abajo de su propio perfil expediente </br>
	
	modificar registros paciente</br>
	
	
	<div class="dropdown">
			<button class=" tam " type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    	<p>Busqueda paciente</p>
		  	</button>
		  	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			    <form action="ConsultaPac" method="post">
						<input type="text" name="id_paciente" class="tam1" placeholder="ingresa el ID del paciente"  required></input></br>
						<input type="submit" value="enviar" class="tbutton"></input>	
				</form>
		  	</div>
	</div></br>
	<div class="dropdown">
			<button class="tam" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    	<p>modificar paciente</p>
		  	</button>
		  	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			    <form action="UpdatePac" method="post">
			    		<input type="text" name="id_paciente"  class="tam1"placeholder ="ID paciente"  required></input></br>
						<input type="text" name="nombre_pac" class="tam1" placeholder="Nombre"  required></input></br> 
						<input type="text" name="apellido_pac" class="tam1" placeholder="Apellido" required></input></br>
						<input type="text" name="edad_pac"  class="tam1"placeholder="edad" ></input required></br>
						<p> Genero</p>
						<input type="radio" name="sexo_pac" class="rbutton">Mujer</input></br>
						<input type="radio" name="sexo_pac" class="rbutton">Hombre</input></br>
						<input type="text" name="domicilio_pac" class="tam1" placeholder="Domicilio" required></input></br>
						<input type="text" name="telefono_pac" class="tam1" placeholder="Telefono" required></input></br>
						<textarea name="expediente_pac" class="tam1"  rows="4" cols="32" placeholder="Expediente" required></textarea></br>
						<input type="text" name="incidencia_pac" class="tam1" placeholder="Incidencia"  ></input></br>
						<input type="submit" value="enviar" class="tbutton"></input>	
				</form>
		  	</div>
		</div></br>
	
	

</body>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>