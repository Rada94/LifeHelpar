package com.crud.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeletePac
 */
@WebServlet("/DeletePac")
public class DeletePac extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html charset='utf-8'");
		
		String id_pac= request.getParameter("id_paciente");
		
		
		//Declaramos e inicializamos las credenciales de acceso
		String url="jdbc:mysql://localhost:3306/proyecto?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		String usuario="root";
		String password="root";
		PrintWriter out = response.getWriter();
		
		//String sql = "INSERT INTO productos VALUES (";
		
		//Declaramos e inicializamos los objetos de conexi�n
		Connection conn=null;
		Statement stmnt =null;
		int rs = 0;//clase para tomar toda la tabla
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			//se abre la conexion a la base de datos
			conn= DriverManager.getConnection(url,usuario,password);
			//se apunta el objeto statement que nos sirve para ejecutar comandos en la base de datos (se crea la consolo de comandos que apuntan a esa conexion)
			stmnt = conn.createStatement();
			
			
			rs= stmnt.executeUpdate("DELETE from pacientes where id_paciente="+id_pac+";");

			


			
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			out.println("<font color='red'>Elemento creado con �xito</font>");
			out.println("<a href=http://localhost:8080/MVCPractica10/index.jsp>index</a>");
			dispatcher.include(request, response);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//Cerramos la conexi�n y colocamos los objetos a disposici�n del garbage collector
			try {
				
				stmnt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}


}
