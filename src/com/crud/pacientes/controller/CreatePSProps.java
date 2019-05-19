package com.crud.pacientes.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvcpractica10.productos.model.Productos;

@WebServlet("/CreatePSProps")
public class CreatePSProps extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Obtener datos del archivo de propiedades
		String result="";
		Properties props=new Properties();
		String nombreArchivo="config.properties";
		InputStream inputStream=getClass().getClassLoader().getResourceAsStream(nombreArchivo);
		
		if(inputStream!=null)
		{
			props.load(inputStream);
		}
		else
		{
			throw new FileNotFoundException("Property file '"+nombreArchivo+"' no se encontró en el classpath");
		}
		
		Productos miProducto=new Productos();
		miProducto.setNombre(request.getParameter("txtNombreProducto"));
		miProducto.setPrecio(Double.parseDouble(request.getParameter("txtPrecioProducto")));
		miProducto.setExistencia(Integer.parseInt(request.getParameter("txtExistenciaProducto")));
		
		String urlServer= props.getProperty("urlServidor");
		String user=props.getProperty("user");
		String password=props.getProperty("password");
		String secuenciaSQL=props.getProperty("sql");
		
		Connection conn=null;
		PreparedStatement pstmnt=null;
		int nRegistros=0;
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
			conn=DriverManager.getConnection(urlServer,user,password);
			pstmnt=conn.prepareStatement(secuenciaSQL);
			pstmnt.setString(1, miProducto.getNombre());
			pstmnt.setDouble(2, miProducto.getPrecio());
			pstmnt.setInt(3, miProducto.getExistencia());
			nRegistros=pstmnt.executeUpdate();
			if(nRegistros>0)
			{
				response.getWriter().append("Registro Creado...");
			}
			else
			{
				response.getWriter().append("Registro No Creado...");
			}
		}
		catch (Exception e) {
			e.getStackTrace();
		}
		finally
		{
			try {
				pstmnt.close();
				conn.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			
		}
	}

}