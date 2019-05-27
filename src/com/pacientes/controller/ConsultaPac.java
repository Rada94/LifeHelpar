package com.pacientes.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

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
		PrintWriter salida=response.getWriter();
		
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
		String sql=props.getProperty("ConsultaPac");

		Connection conn=null;
		PreparedStatement pstmnt =null;
		ResultSet rs=null;
		int id_pac=0;
		id_pac=Integer.parseInt(request.getParameter("id_paciente"));


		
		try {
			//Se instancia el driver
			Class.forName(driver).newInstance();
			//se abre la conexion a la base de datos
			conn= DriverManager.getConnection(url,usuario,password);
			//se apunta el objeto statement que nos sirve para ejecutar comandos en la base de datos (se crea la consolo de comandos que apuntan a esa conexion)
			pstmnt = conn.prepareStatement(sql);
			pstmnt.setInt(1, id_pac);
			
			rs= pstmnt.executeQuery();
			salida.append("<table>");
			
			salida.append("<tr>");
			salida.append("<td> Id paciente: ");
			salida.append("<td> Nombre paciente: ");
			salida.append("<td> Apellidos: ");
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
				salida.append("<td>"+rs.getString("nombre_paciente")+"</td>");
				salida.append("<td>"+rs.getString("apellidos_paciente")+"</td>");
				salida.append("<td>"+rs.getString("genero_paciente")+"</td>");
				salida.append("<td>"+rs.getString("domicilio_paciente")+"</td>");
				salida.append("<td>"+rs.getInt("telefono_paciente")+"</td>");
				salida.append("<td>"+rs.getString("expediente_paciente")+"</td>");
				salida.append("<td>"+rs.getString("incidencia_paciente")+"</td>");



				salida.append("</table");

			}

			
		} catch (Exception e) {
			e.printStackTrace();

		}
		finally
		{
			
			try {
				rs.close();
				pstmnt.close();
				conn.close();
				salida.println("<a href=administrador.jsp>index</a>");

				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		salida.close();
	}

}
