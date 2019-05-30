package com.pacientes.model;

public class Paciente {
	private int id;
	private String nombre;
	private String apellidos;
	private String sexo;
	private String domicilio;
	private String telefono;
	private String email;
	private String expediente;
	private String incidencia;
	private String cita;
	
	public Paciente()
	{
		
	}
	
	public Paciente(int id, String nombre, String apellidos, String sexo, String domicilio, String telefono,
			String email, String expediente, String incidencia, String cita) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.sexo = sexo;
		this.domicilio = domicilio;
		this.telefono = telefono;
		this.email = email;
		this.expediente = expediente;
		this.incidencia = incidencia;
		this.cita = cita;
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
	public String getExpediente() {
		return expediente;
	}
	public void setExpediente(String expediente) {
		this.expediente = expediente;
	}
	public String getIncidencia() {
		return incidencia;
	}
	public void setIncidencia(String incidencia) {
		this.incidencia = incidencia;
	}
	public String getCita() {
		return cita;
	}
	public void setCita(String cita) {
		this.cita = cita;
	}
	
	@Override
	public String toString() {
		return "Pacientes [id=" + id + ", nombre=" + nombre + ", apellidos=" + apellidos + ", sexo=" + sexo
				+ ", domicilio=" + domicilio + ", telefono=" + telefono + ", email=" + email + ", expediente=" 
				+ expediente + ", incidencia=" + incidencia + ", cita=" + cita + "]";
	}
}
