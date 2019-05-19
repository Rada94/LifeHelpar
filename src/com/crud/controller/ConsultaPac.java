package com.crud.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ConsultaPac
 */
@WebServlet("/ConsultaPac")
public class ConsultaPac extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html charset='utf-8'");
		
		String url="jdbc:mysql://localhost:3306/proyecto?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		String usuario="root";
		String password="root";
		PrintWriter salida = response.getWriter();
		PrintWriter out = response.getWriter();


		
		Connection conn=null;
		Statement stmnt =null;
		ResultSet rs=null;
		int id_pac=0;
		id_pac=Integer.parseInt(request.getParameter("id_paciente"));


		
		try {
			//Se instancia el driver
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			//se abre la conexion a la base de datos
			conn= DriverManager.getConnection(url,usuario,password);
			//se apunta el objeto statement que nos sirve para ejecutar comandos en la base de datos (se crea la consolo de comandos que apuntan a esa conexion)
			stmnt = conn.createStatement();
			
			rs= stmnt.executeQuery("SELECT * FROM pacientes where id_paciente ="+id_pac);
			salida.append("<table>");
			
			salida.append("<tr>");
			salida.append("<td> Id paciente: ");
			salida.append("<td> Nombre paciente: ");
			salida.append("<td> Apellido paterno: ");
			salida.append("<td> Edad: ");
			salida.append("<td> Sexo: ");
			salida.append("<td> Domicilio: ");
			salida.append("<td> Telefono: ");
			salida.append("<td> Expediente");
			salida.append("<td> Incidencias");


			salida.append("</tr>");
			salida.append("</table");

			while(rs.next()) {
				
				salida.append("<table>");
				
				
				salida.append("<tr>");
				salida.append("<td>"+rs.getInt("id_paciente")+"</td>");
				salida.append("<td>"+rs.getString("nombre_pac")+"</td>");
				salida.append("<td>"+rs.getString("apellido_pac")+"</td>");
				salida.append("<td>"+rs.getInt("edad_pac")+"</td>");
				salida.append("<td>"+rs.getString("sexo_pac")+"</td>");
				salida.append("<td>"+rs.getString("domicilio_pac")+"</td>");
				salida.append("<td>"+rs.getInt("telefono_pac")+"</td>");
				salida.append("<td>"+rs.getString("expediente_pac")+"</td>");
				salida.append("<td>"+rs.getString("pac_incidencia")+"</td>");



				salida.append("</table");

			}

			
		} catch (Exception e) {
			e.printStackTrace();

		}
		finally
		{
			
			try {
				rs.close();
				stmnt.close();
				conn.close();
				out.println("<a href=administrador.jsp>index</a>");

				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		salida.close();
	}

}
