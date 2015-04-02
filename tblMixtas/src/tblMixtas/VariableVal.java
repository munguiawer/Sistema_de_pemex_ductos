package tblMixtas;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the variable_val database table.
 * 
 */
@Entity
@Table(name="variable_val")
@NamedQuery(name="VariableVal.findAll", query="SELECT v FROM VariableVal v")
public class VariableVal implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private int estado;

	@Temporal(TemporalType.DATE)
	private Date fecha;

	public VariableVal() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEstado() {
		return this.estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}

	public Date getFecha() {
		return this.fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

}