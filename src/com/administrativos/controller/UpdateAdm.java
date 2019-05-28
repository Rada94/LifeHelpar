package com.administrativos.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
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

/**
 * Servlet implementation class UpdateAdm
 */
@WebServlet("/UpdateAdm")
public class UpdateAdm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				response.setContentType("text/html charset='utf-8'");
				
				int id_administrativo= Integer.parseInt(request.getParameter("id_adm"));
				String nombre_administrativo = request.getParameter("nombre_adm");
				String apellidos_administrativo = request.getParameter("apellido_adm");
		        String puesto_administrativo = request.getParameter("puesto_adm");
				String genero_administrativo = request.getParameter("sexo_adm");
				String domicilio_administrativo = request.getParameter("domicilio_adm");
		        String telefono_administrativo = request.getParameter("telefono_adm");
				String email_administrativo=request.getParameter("email_adm");
				String pass_administrativo=request.getParameter("pass_adm");
				
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
				String sql=props.getProperty("UpdateAdm");
				
				PrintWriter out = response.getWriter();
				
				
				//Declaramos e inicializamos los objetos de conexi�n
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
					pstmnt.setInt(9, id_administrativo);
					
					rs= pstmnt.executeUpdate();
					
					if(rs>0)
					{
						out.append("Se ha actualizado correctamente");
					}
					else
					{	
						out.append("Error al actualizar");
					}
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					//Cerramos la conexi�n y colocamos los objetos a disposici�n del garbage collector
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
