package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the ermcom database table.
 * 
 */
@Entity
@NamedQuery(name="Ermcom.findAll", query="SELECT e FROM Ermcom e")
public class Ermcom implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String comentario;

	private String meses;

	@Temporal(TemporalType.DATE)
	private Date year;

	public Ermcom() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComentario() {
		return this.comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public String getMeses() {
		return this.meses;
	}

	public void setMeses(String meses) {
		this.meses = meses;
	}

	public Date getYear() {
		return this.year;
	}

	public void setYear(Date year) {
		this.year = year;
	}

}