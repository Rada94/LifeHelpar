package com.administrativos.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




/**
 * servlet implementation class CreateAdm 
 * @author user
 */
@WebServlet("/CreateAdm")
public class CreateAdm extends HttpServlet{
	private static final long serialVersionUID=1L;
	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html charset='utf-8'");
			//response.getWriter().append("esta vivo");
			
			String nombre_administrativo = request.getParameter("nombre_adm");
			String apellidos_administrativo = request.getParameter("apellido_adm");
			String puesto_administrativo = request.getParameter("puesto_adm");
			String genero_administrativo = request.getParameter("sexo_adm");
			String domicilio_administrativo = request.getParameter("domicilio_adm");
			String telefono_administrativo = request.getParameter("telefono_adm");
			String email_administrativo = request.getParameter("email_adm");
			String pass_administrativo = request.getParameter("pass_adm");
			
			//declarar variables de conexion
			Properties props=new Properties();
			String fileName="config.properties";
			InputStream inputStream=getClass().getClassLoader().getResourceAsStream(fileName);
			
			if(inputStream!=null)
			{
				props.load(inputStream);
			}
			else
			{
				throw new FileNotFoundException("Property file "+fileName+" not found");
			}
		
			
			String url=props.getProperty("urlServer");
			String usuario=props.getProperty("user");
			String password=props.getProperty("pass");
			String driver=props.getProperty("driver");
			String sql=props.getProperty("CreateAdm");
			
		
			
			//Declaramos e inicializamos los objetos de conexión
			Connection conn=null;
			PreparedStatement pstmnt =null;
			int rs = 0;//clase para tomar toda la tabla
			
			try {
				Class.forName(driver).newInstance();
				//se abre la conexion a la base de datos
				conn= DriverManager.getConnection(url,usuario,password);
				//se apunta el objeto statement que nos sirve para ejecutar comandos en la base de datos (se crea la consolo de comandos que apuntan a esa conexion)
				pstmnt = conn.prepareStatement(sql);
				pstmnt.setString(1, nombre_administrativo);
				pstmnt.setString(2, apellidos_administrativo);
				pstmnt.setString(3, puesto_administrativo);
				pstmnt.setString(4, genero_administrativo);
				pstmnt.setString(5, domicilio_administrativo);
				pstmnt.setString(6, telefono_administrativo);
				pstmnt.setString(7, email_administrativo);
				pstmnt.setString(8, pass_administrativo);
				
				
				rs= pstmnt.executeUpdate();           
//				salida.append(driver);
				
				
				RequestDispatcher rd = request.getRequestDispatcher("adminstra.html");
				if(rs>0)
				{
					response.getWriter().append("<p>Elemento fue creado con éxito</p>");
				}
				else
				{
					response.getWriter().append("<p>Elemento no fue creado con éxito</p>");
				}
				rd.include(request, response);
				
			} catch (Exception e) {
			
				e.printStackTrace();
			}finally {
				//Cerramos la conexión y colocamos los objetos a disposición del garbage collector
				try {
					
					pstmnt.close();
					conn.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
				
			}
		}
}