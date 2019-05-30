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
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pacientes.model.Paciente;

/**
 * Servlet implementation class ReadGeneralPac
 */
@WebServlet("/ReadGeneralPac")
public class ReadGeneralPac extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ArrayList<Paciente> listaPacientes=new ArrayList<Paciente>();
		
		//String url="jdbc:mysql://localhost:3306/lifehelper?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
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
		String sql=props.getProperty("ReadGeneralPac");
		
		Connection conn=null;
		PreparedStatement pstmnt =null;
		ResultSet rs=null;
		PrintWriter out = response.getWriter();

		
		try {
			//Se instancia el driver
			Class.forName(driver).newInstance();
			//se abre la conexion a la base de datos
			conn= DriverManager.getConnection(url,usuario,password);
			//se apunta el objeto statement que nos sirve para ejecutar comandos en la base de datos (se crea la consolo de comandos que apuntan a esa conexion)
			pstmnt = conn.prepareStatement(sql);
			rs= pstmnt.executeQuery();
			
			while(rs.next()) {
			listaPacientes.add(new Paciente(
					rs.getInt("id_pac"),
					rs.getString("nombre_pac"),
					rs.getString("apellidos_pac"),
					rs.getString("sexo_pac"), 
					rs.getString("domicilio_pac"), 
					rs.getString("telefono_pac"),
					rs.getString("email_pac"),
					rs.getString("expediente_pac"),
					rs.getString("incidencia_pac"),
					rs.getString("cita_pac")
						)
					);
			}
			
			RequestDispatcher rd=request.getRequestDispatcher("administraPaciente.jsp");
			request.setAttribute("listaPacientes", listaPacientes);
			
			rd.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			
			try {
				rs.close();
				pstmnt.close();
				conn.close();
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		out.close();
	}

}