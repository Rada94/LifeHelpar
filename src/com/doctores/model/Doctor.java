package com.doctores.model;

public class Doctor {
	private int id;
	private String nombre;
	private String apellidos;
	private String cedula;
	private String sexo;
	private String domicilio;
	private String telefono;
	private String email;
	
	public Doctor() {
		
	}
	
	public Doctor(int id, String nombre, String apellidos, String cedula, String sexo, String domicilio,
			String telefono, String email) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.cedula = cedula;
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
	public String getCedula() {
		return cedula;
	}
	public void setCedula(String cedula) {
		this.cedula = cedula;
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
		return "Doctor [id=" + id + ", nombre=" + nombre + ", apellidos=" + apellidos + ", cedula=" + cedula + ", sexo="
				+ sexo + ", domicilio=" + domicilio + ", telefono=" + telefono + ", email=" + email + "]";
	}
}
