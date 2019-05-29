package com.doctores.controller;

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
 * Servlet implementation class CreateDoc
 */
@WebServlet("/CreateDoc")
public class CreateDoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html charset='utf-8'");
		
		String nombre_doc = request.getParameter("nombre_doc");
		String apellido_doc = request.getParameter("apellidos_doc");
		String cedula_doc = request.getParameter("cedula_doc");
		String sexo_doc = request.getParameter("sexo_doc");
		String domicilio_doc = request.getParameter("domicilio_doc");
		String telefono_doc = request.getParameter("telefono_doc");
		String email_doc = request.getParameter("email_doc");
		String pass_doc = request.getParameter("pass_doc");

		
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
		String sql=props.getProperty("CreateDoc");
		
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
			pstmnt.setString(1, nombre_doc);
			pstmnt.setString(2, apellido_doc);
			pstmnt.setString(3, cedula_doc);
			pstmnt.setString(4, sexo_doc);
			pstmnt.setString(5, domicilio_doc);
			pstmnt.setString(6, telefono_doc);
			pstmnt.setString(7, email_doc);
			pstmnt.setString(8, pass_doc);
			
			rs= pstmnt.executeUpdate();                                   
			
			RequestDispatcher rd=request.getRequestDispatcher("administraDoc.html");
			if(rs>0)
			{
				out.append("<p>Se dio de alta doctor</p>");
			}
			else
			{
				out.append("<p>No se dio de alta doctor</p>");
			}
			rd.include(request, response);
			
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
