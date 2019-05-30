<%@page import="com.administrativos.model.Administrativo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Administrador</title>

  <!-- mobile responsive meta -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  
  <!-- Slick Carousel -->
  <link rel="stylesheet" href="plugins/slick/slick.css">
  <link rel="stylesheet" href="plugins/slick/slick-theme.css">
  <!-- FancyBox -->
  <link rel="stylesheet" href="plugins/fancybox/jquery.fancybox.min.css">
  
  <!-- Stylesheets -->
  <link href="css/style.css" rel="stylesheet">
  
  <!--Favicon-->
  <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
  <link rel="icon" href="images/favicon.ico" type="image/x-icon">

</head>

<body>
  <div class="page-wrapper">
    <!-- Preloader -->
    <!-- <div class="preloader"></div> -->
    <!-- Preloader -->

<!--Main Header-->
<nav class="navbar navbar-default">
      <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                        aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                  </button>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                  <ul class="nav navbar-nav">
                        <li class="active">
                              <a href="administraDoc.html">Administra Doctores</a> <!--Se conecta con el CRUD Administrador-->
                        </li>
                        <li>
                              <a href="administraPaciente.html">Administra Pacientes</a> <!--Se conecta con el CRUD Administrador-->
                        </li>
                        <li>
                          <a href="administraCitas.html">Administra Citas</a> 
                    </li>
                    <li>
                      <a href="#irCrudAdm">Administra Administrativo</a> 
                </li>
                  </ul>

                <!-- Boton Login-->
                  <a href="index.html"  id = "btnLogin" class="btn btn-info btn-lg">Cerrar Sesion</a>
                <!-- Fin Boton Login-->  

            </div>
            <!-- /.navbar-collapse -->
      </div>
      <!-- /.container-fluid -->
</nav>
<!--End Main Header -->

<!--=================================
=            Page Slider            =
==================================-->
<div class="hero-slider">
    <!-- Slider Item -->
    <div class="slider-item slide1" style="background-image:url(images/slider/slider-flores.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Slide Content Start -->
                    <div class="content style text-center">
                        <h2 class="text-white text-bold mb-2">PÁGINA PRINCIPAL DEL ADMINISTRADOR </h2>
                        <p class="tag-text mb-5">Esta es la página principal para el administrador del sistema</p>
                        <a href="#irCrudAdm" class="btn btn-main btn-white">Administradores</a>
                    </div>
                    <!-- Slide Content End -->
                </div>
            </div>
        </div>
    </div>
    <!-- Slider Item -->
    <div class="slider-item" style="background-image:url(images/slider/slider-camino.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Slide Content Start-->
                    <div class="content style text-right">
                        <h2 class="text-white">Administrar Doctores<br></h2>
                        <p class="tag-text">Desde aquí se puede ir a administrar la información de los doctores</p>
                        <a href="administraDoc.html" class="btn btn-main btn-white">Administrar Doctores</a>
                    </div>
                    <!-- Slide Content End-->
                </div>
            </div>
        </div>
    </div>
    <!-- Slider Item -->
    <div class="slider-item" style="background-image:url(images/slider/slider-arbol.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Slide Content Start -->
                    <div class="content text-center style">
                        <h2 class="text-white text-bold mb-2">Administrar Pacientes</h2>
                        <p class="tag-text mb-5">Desde aquí se puede ir a administrar la información de los pacientes</p>
                        <a href="administraPaciente.html" class="btn btn-main btn-white">Administrar Pacientes</a>
                    </div>
                    <!-- Slide Content End -->
                </div>
            </div>
        </div>
    </div>
    <!-- Slider Item -->
    <div class="slider-item" style="background-image:url(images/slider/slider-camino.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Slide Content Start-->
                    <div class="content style text-right">
                        <h2 class="text-white">Administrar Citas<br></h2>
                        <p class="tag-text">Desde aquí se puede ir a administrar registrar Citas</p>
                        <a href="administraCitas.html" class="btn btn-main btn-white">Administrar Citas</a>
                    </div>
                    <!-- Slide Content End-->
                </div>
            </div>
        </div>
    </div>
</div>

<!--====  End of Page Slider  ====-->

<!--====  Inicio CRUD Administrador  ====-->

<div class="formato" id = "irCrudAdm">
		<div class="dropdown">
        <button class="tam" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <p>Crear Administrativo</p>
          </button>
          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <form action="CreateAdm" method="post">
                    <input type="text" name="nombre_adm"  id="nombre_adm" class="tam1" placeholder="Nombre"  required></input></br> 
                    <input type="text" name="apellido_adm"  id="apellido_adm" class="tam1" placeholder="Apellido" required></input></br>
                    <input type="text" name="puesto_adm"  id="puesto_adm" class="tam1" placeholder="Puesto laboral" required></input></br>
                    <input type="radio" name="sexo_adm" id="sexo_adm"  class="rbutton" value="Mujer">Mujer</input></br>
                    <input type="radio" name="sexo_adm" id="sexo_adm"  class="rbutton" value="Hombre">Hombre</input></br>
                    <input type="text" name="domicilio_adm" id="domicilio_adm"  class="tam1" placeholder="Domicilio" required></input></br>
                    <input type="text" name="telefono_adm" id="telefono_adm"  class="tam1" placeholder="Telefono" required></input></br>
	                <input type="text" name="email_adm" id="email_adm"  class="tam1" placeholder="Email" required></input></br>
                    <input type="text" name="pass_adm" id="pass_adm"  class="tam1" placeholder="Password" required></input></br>
                    
                    <input type="submit" value="enviar" id=""  class="tbutton" ></input>	
            </form>
          </div>
    </div></br>
    
    
    <div class="dropdown">
        <button class=" tam " type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <p>Consulte Administrativos</p>
          </button>
          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <form action="ReadAdm" method="post">
                    <p>Si quiere una consulta de un Administrativo ingrese su ID</p>
                    <input type="text" name="id_adm" class="tam1" placeholder="ingrese el ID del Administrador"  required></input></br>
                    <input type="submit" value="enviar" class="tbutton"></input>	
            </form>

            <form action="ReadGeneralAdm" method="post">
                <p>Si quiere una consulta general de click en el boton de abajo</p>
                <input type="submit" value="Consulta General" class="tbutton"></input>	
            </form>
          </div>
    </div></br>
    
    <div class="dropdown">
        <button class="tam" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <p>Modifique Administrativo</p>
          </button>
          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <form action="UpdateAdm" method="post">
                    <p>Ingrese el ID del Administrativo que quiere modificar</p>
                    <input type="text" name="id_adm"  class="tam1"placeholder ="ID Administrador"  required></input></br>
                    <p>Ingrese a continuación los datos que quiere modificar</p>
                    <input type="text" name="nombre_adm"  id="nombre_adm" class="tam1" placeholder="Nombre"  required></input></br> 
                    <input type="text" name="apellido_adm"  id="apellido_adm" class="tam1" placeholder="Apellido" required></input></br>
                    <input type="text" name="puesto_adm"  id="puesto_adm" class="tam1" placeholder="Puesto laboral" required></input></br>
                    <input type="radio" name="sexo_adm" id="sexo_adm"  class="rbutton" value="Mujer">Mujer</input></br>
                    <input type="radio" name="sexo_adm" id="sexo_adm"  class="rbutton" value="Hombre">Hombre</input></br>
                    <input type="text" name="domicilio_adm" id="domicilio_adm"  class="tam1" placeholder="Domicilio" required></input></br>
                    <input type="text" name="telefono_adm" id="telefono_adm"  class="tam1" placeholder="Telefono" required></input></br>
	                <input type="text" name="email_adm" id="email_adm"  class="tam1" placeholder="Email" required></input></br>
                    <input type="text" name="pass_adm" id="pass_adm"  class="tam1" placeholder="Password" required></input></br>
                    <input type="submit" value="enviar" class="tbutton"></input>	
            </form>
          </div>
    </div></br>

    <div class="dropdown">
        <button class="tam" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <p>Baja Administrativo</p>
          </button>
    
          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <form action="DeleteAdm" method="post">
                    <input type="text" name="id_adm" id="id_adm" class="tam1"placeholder="Ingrese el ID del administrativo a dar de baja " required></input></br>
                    <input type="submit" value="enviar" class="tbutton"></input>	
            </form>
          </div>
    </div>
    </div>


    <!--====  End CRUD Administrador  ====-->

<!--Desplegue de tablas-->
<div  id="tablas">
	<table >
		<thead >
			<tr>
				<th>ID</th>
				<th>Nombre</th>
				<th>Apellidos</th>
				<th>Cedula</th>
				<th>Sexo</th>
				<th>Domicilio</th>
				<th>Telefono</th>
				<th>Email</th>
			</tr>
		</thead>
	<tbody>
	
<%

ArrayList<Administrativo> listaAdministrativos = (ArrayList<Administrativo>) request.getAttribute("listaAdministrativos"); 

for(Administrativo administrativo : listaAdministrativos)
{
	out.println("<tr>");
	out.println("<td>"+administrativo.getId()+"</td>");
	out.println("<td>"+administrativo.getNombre()+"</td>");
	out.println("<td>"+administrativo.getApellidos()+"</td>");
	out.println("<td>"+administrativo.getPuesto()+"</td>");
	out.println("<td>"+administrativo.getSexo()+"</td>");
	out.println("<td>"+administrativo.getDomicilio()+"</td>");
	out.println("<td>"+administrativo.getTelefono()+"</td>");
	out.println("<td>"+administrativo.getEmail()+"</td>");
	out.println("</tr>");
}
%>

		</tbody>
	</table>
</div>


<!--footer-main-->
<footer class="footer-main">
        <div class="footer-top">
          <div class="container">
            <div class="row">
              <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="about-widget">
                  <div class="footer-logo">
                    <figure>
                      <a href="index.html">
                        <img src="images/logo-2.png" alt="">
                      </a>
                    </figure>
                  </div>
                  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, temporibus?</p>
                  <ul class="location-link">
                    <li class="item">
                      <i class="fa fa-map-marker"></i>
                      <p>Modamba, NY 80021, United States</p>
                    </li>
                    <li class="item">
                      <i class="fa fa-envelope-o" aria-hidden="true"></i>
                      <a href="#">
                        <p>Support@medic.com</p>
                      </a>
                    </li>
                    <li class="item">
                      <i class="fa fa-phone" aria-hidden="true"></i>
                      <p id = "contactoNum">(88017) +123 4567</p>
                    </li>
                  </ul>
                  <ul class="list-inline social-icons">
                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                    <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                  </ul>
                </div>
              </div>
              <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="social-links">
                  <h6>Recent Posts</h6>
                  <ul>
                    <li class="item">
                      <div class="media">
                        <div class="media-left">
                          <a href="#">
                            <img class="media-object" src="images/blog/post-thumb-small.jpg" alt="post-thumb">
                          </a>
                        </div>
                        <div class="media-body">
                          <h4 class="media-heading"><a href="#">Post Title</a></h4>
                          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam, dolorem.</p>
                        </div>
                      </div>
                    </li>
                    <li class="item">
                      <div class="media">
                        <div class="media-left">
                          <a href="#">
                            <img class="media-object" src="images/blog/post-thumb-small.jpg" alt="post-thumb">
                          </a>
                        </div>
                        <div class="media-body">
                          <h4 class="media-heading">
                            <a href="#">Post Title</a>
                          </h4>
                          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam, dolorem.</p>
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="footer-bottom">
          <div class="container clearfix">
            <div class="copyright-text">
              <p>&copy; Copyright 2018. All Rights Reserved by
                <a href="index.html">Medic</a>
              </p>
            </div>
          </div>
        </div>
      </footer>
      <!--End footer-main-->
      
      </div>
      <!--End pagewrapper-->
      
      <!--Scroll to top-->
      <div class="scroll-to-top scroll-to-target" data-target=".header-top">
        <span class="icon fa fa-angle-up"></span>
      </div>
      
      <script src="plugins/jquery.js"></script>
      <script src="plugins/bootstrap.min.js"></script>
      <script src="plugins/bootstrap-select.min.js"></script>
      <!-- Slick Slider -->
      <script src="plugins/slick/slick.min.js"></script>
      <!-- FancyBox -->
      <script src="plugins/fancybox/jquery.fancybox.min.js"></script>
      <!-- Google Map -->
      <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
      <script src="plugins/google-map/gmap.js"></script>
      
      <script src="plugins/validate.js"></script>
      <script src="plugins/wow.js"></script>
      <script src="plugins/jquery-ui.js"></script>
      <script src="plugins/timePicker.js"></script>
      <script src="js/script.js"></script>
      </body>
      
      </html>
      
      
