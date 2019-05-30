package com.administrativos.model;

public class Administrativo {
	private int id;
	private String nombre;
	private String apellidos;
	private String puesto;
	private String sexo;
	private String domicilio;
	private String telefono;
	private String email;
	
	public Administrativo() {
		
	}
		
	public Administrativo(int id, String nombre, String apellidos, String puesto, String sexo, String domicilio,
			String telefono, String email) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.puesto = puesto;
		this.sexo = sexo;
		this.domicilio = domicilio;
		this.telefono = telefono;
		this.email = email;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getPuesto() {
		return puesto;
	}
	public void setPuesto(String puesto) {
		this.puesto = puesto;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public String getDomicilio() {
		return domicilio;
	}
	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "Administrativo [id=" + id + ", nombre=" + nombre + ", apellidos=" + apellidos + ", puesto=" + puesto
				+ ", sexo=" + sexo + ", domicilio=" + domicilio + ", telefono=" + telefono + ", email=" + email + "]";
	}
}
