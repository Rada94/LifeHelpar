package com.administrativos.controller;

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

import com.administrativos.model.Administrativo;


@WebServlet("/ReadAdm")
public class ReadAdm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<Administrativo> listaAdministrativos=new ArrayList<Administrativo>();
		
		int id_adm= Integer.parseInt(request.getParameter("id_adm"));
		
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
		String sql=props.getProperty("ReadAdm");
		
		PrintWriter salida = response.getWriter();

		
		Connection conn=null;
		PreparedStatement pstmnt =null;
		ResultSet rs=null;


		try {
			//Se instancia el driver
			Class.forName(driver).newInstance();
			//se abre la conexion a la base de datos
			conn= DriverManager.getConnection(url,usuario,password);
			//se apunta el objeto statement que nos sirve para ejecutar comandos en la base de datos (se crea la consolo de comandos que apuntan a esa conexion)
			pstmnt = conn.prepareStatement(sql);
			
			pstmnt.setInt(1, id_adm);
			rs= pstmnt.executeQuery();
			
			while(rs.next()) {
				listaAdministrativos.add(new Administrativo(
						rs.getInt("id_adm"),
						rs.getString("nombre_adm"),
						rs.getString("apellidos_adm"),
						rs.getString("puesto_adm"),
						rs.getString("sexo_adm"), 
						rs.getString("domicilio_adm"), 
						rs.getString("telefono_adm"),
						rs.getString("email_adm")
							)
						);
				}
				
				RequestDispatcher rd=request.getRequestDispatcher("administra.jsp");
				request.setAttribute("listaAdministrativos", listaAdministrativos);
				
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
		salida.close();
	}

}
