package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the areas database table.
 * 
 */
@Entity
@Table(name="areas")
@NamedQuery(name="Area.findAll", query="SELECT a FROM Area a")
public class Area implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private String area;

	@Column(name="GRUPO_PLAN")
	private String grupoPlan;

	private String responsable;

	public Area() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getArea() {
		return this.area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getGrupoPlan() {
		return this.grupoPlan;
	}

	public void setGrupoPlan(String grupoPlan) {
		this.grupoPlan = grupoPlan;
	}

	public String getResponsable() {
		return this.responsable;
	}

	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}

}