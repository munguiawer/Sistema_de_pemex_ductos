package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the valvserm database table.
 * 
 */
@Entity
@NamedQuery(name="Valvserm.findAll", query="SELECT v FROM Valvserm v")
public class Valvserm implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private int abril;

	private int agosto;

	private int diciembre;

	private int enero;

	private int febrero;

	private int julio;

	private int junio;

	private int marzo;

	private int mayo;

	private String mes;

	private int noviembre;

	private int octubre;

	private int septiembre;

	@Temporal(TemporalType.DATE)
	private Date year;

	public Valvserm() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAbril() {
		return this.abril;
	}

	public void setAbril(int abril) {
		this.abril = abril;
	}

	public int getAgosto() {
		return this.agosto;
	}

	public void setAgosto(int agosto) {
		this.agosto = agosto;
	}

	public int getDiciembre() {
		return this.diciembre;
	}

	public void setDiciembre(int diciembre) {
		this.diciembre = diciembre;
	}

	public int getEnero() {
		return this.enero;
	}

	public void setEnero(int enero) {
		this.enero = enero;
	}

	public int getFebrero() {
		return this.febrero;
	}

	public void setFebrero(int febrero) {
		this.febrero = febrero;
	}

	public int getJulio() {
		return this.julio;
	}

	public void setJulio(int julio) {
		this.julio = julio;
	}

	public int getJunio() {
		return this.junio;
	}

	public void setJunio(int junio) {
		this.junio = junio;
	}

	public int getMarzo() {
		return this.marzo;
	}

	public void setMarzo(int marzo) {
		this.marzo = marzo;
	}

	public int getMayo() {
		return this.mayo;
	}

	public void setMayo(int mayo) {
		this.mayo = mayo;
	}

	public String getMes() {
		return this.mes;
	}

	public void setMes(String mes) {
		this.mes = mes;
	}

	public int getNoviembre() {
		return this.noviembre;
	}

	public void setNoviembre(int noviembre) {
		this.noviembre = noviembre;
	}

	public int getOctubre() {
		return this.octubre;
	}

	public void setOctubre(int octubre) {
		this.octubre = octubre;
	}

	public int getSeptiembre() {
		return this.septiembre;
	}

	public void setSeptiembre(int septiembre) {
		this.septiembre = septiembre;
	}

	public Date getYear() {
		return this.year;
	}

	public void setYear(Date year) {
		this.year = year;
	}
	public double getSum() {
		return enero + febrero + marzo + abril + mayo + junio + julio + agosto
				+ septiembre + octubre + noviembre + diciembre;
	}

}