package com.pacientes.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
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
 * Servlet implementation class CreatePac
 */
@WebServlet("/CreatePac")
public class CreatePac extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html charset='utf-8'");
		
		String nombre_pac = request.getParameter("nombre_pac");
		String apellido_pac = request.getParameter("apellidos_pac");
		String sexo_pac = request.getParameter("sexo_pac");
		String domicilio_pac = request.getParameter("domicilio_pac");
		String telefono_pac = request.getParameter("telefono_pac");
		String email_pac = request.getParameter("email_pac");
		String pass_pac = request.getParameter("pass_pac");
		String expediente_pac = request.getParameter("expediente_pac");
		String incidencia_pac = request.getParameter("pac_incidencia");
		String cita_pac = request.getParameter("citaFecha_pac");

		
		//Declaramos e inicializamos las credenciales de acceso
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
		String sql=props.getProperty("CreatePac");
		
		PrintWriter out = response.getWriter();
		
		//String sql = "INSERT INTO productos VALUES (";
		
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
			pstmnt.setString(1, nombre_pac);
			pstmnt.setString(2, apellido_pac);
			pstmnt.setString(3, sexo_pac);
			pstmnt.setString(4, domicilio_pac);
			pstmnt.setString(5, telefono_pac);
			pstmnt.setString(6, email_pac);
			pstmnt.setString(7, pass_pac);
			pstmnt.setString(8, expediente_pac);
			pstmnt.setString(9, incidencia_pac);
			pstmnt.setString(10, cita_pac);
			
			rs= pstmnt.executeUpdate();                                   
			//rs= stmnt.executeUpdate("INSERT INTO pacientes (nombre_pac, apellido_pac, edad_pac) VALUES ('"+nombre_pac+"', '"+apellido_pac+"',"+edad_pac+");");
			//rs= stmnt.executeUpdate("INSERT INTO abarrotes (nombre_producto, precio_producto) VALUES ('"+nombre_producto +"', "+precio_producto+");");

			
			RequestDispatcher dispatcher = request.getRequestDispatcher("administraPaciente.html");
			if(rs>0)
			{
				out.append("<p>Se dio de alta paciente</p>");
			}
			else
			{
				out.append("<p>NNo se dio de alta paciente</p>");
			}
//			out.println("<a href=http://localhost:8080/MVCPractica10/index.jsp>index</a>");
			dispatcher.include(request, response);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//Cerramos la conexión y colocamos los objetos a disposición del garbage collector
			try {
				
				pstmnt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
}
