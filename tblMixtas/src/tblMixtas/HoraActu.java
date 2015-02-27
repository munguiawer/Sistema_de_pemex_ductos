package tblMixtas;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the hora_actu database table.
 * 
 */
@Entity
@Table(name="hora_actu")
@NamedQuery(name="HoraActu.findAll", query="SELECT h FROM HoraActu h")
public class HoraActu implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="idhora_actu")
	private int idhoraActu;

	@Temporal(TemporalType.TIMESTAMP)
	private Date hora;

	public HoraActu() {
	}

	public int getIdhoraActu() {
		return this.idhoraActu;
	}

	public void setIdhoraActu(int idhoraActu) {
		this.idhoraActu = idhoraActu;
	}

	public Date getHora() {
		return this.hora;
	}

	public void setHora(Date hora) {
		this.hora = hora;
	}

}