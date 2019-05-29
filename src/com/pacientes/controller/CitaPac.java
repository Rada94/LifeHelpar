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
 * Servlet implementation class CitaPac
 */
@WebServlet("/CitaPac")
public class CitaPac extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html charset='utf-8'");
		
		int id_pac= Integer.parseInt(request.getParameter("id_pac"));
		String nombre_doc = request.getParameter("nombre_doc");
		String fecha = request.getParameter("fecha");
		String salida=" "+nombre_doc+" "+fecha;
		
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
		
		Connection conn=null;
		PreparedStatement pstmnt =null;
		int rs = 0;//clase para tomar toda la tabla
		
		try {
			Class.forName(driver).newInstance();
			//se abre la conexion a la base de datos
			conn= DriverManager.getConnection(url,usuario,password);
			//se apunta el objeto statement que nos sirve para ejecutar comandos en la base de datos (se crea la consolo de comandos que apuntan a esa conexion)
			pstmnt = conn.prepareStatement(sql);
			pstmnt.setString(1, salida);
			pstmnt.setInt(2, id_pac);
			
			rs= pstmnt.executeUpdate();

			
			RequestDispatcher dispatcher = request.getRequestDispatcher("administraCitas.html");
			
			if(rs>0)
			{
				out.append("<p>Cita creada con exito</p>");
			}
			else
			{
				out.append("<p>La cita no fue creada con exito</p>");
			}
			
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


    