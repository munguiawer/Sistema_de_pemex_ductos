package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the ermpdf database table.
 * 
 */
@Entity
@NamedQuery(name="Ermpdf.findAll", query="SELECT e FROM Ermpdf e")
public class Ermpdf implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String mes;

	private String nombre;

	private String pdf;

	private String usuario;

	private int valido;

	@Temporal(TemporalType.DATE)
	private Date year;

	public Ermpdf() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMes() {
		return this.mes;
	}

	public void setMes(String mes) {
		this.mes = mes;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPdf() {
		return this.pdf;
	}

	public void setPdf(String pdf) {
		this.pdf = pdf;
	}

	public String getUsuario() {
		return this.usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public int getValido() {
		return this.valido;
	}

	public void setValido(int valido) {
		this.valido = valido;
	}

	public Date getYear() {
		return this.year;
	}

	public void setYear(Date year) {
		this.year = year;
	}

}