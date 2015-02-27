package tblMixtas;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Time;
import java.util.Date;


/**
 * The persistent class for the mixtasordenes database table.
 * 
 */
@Entity
@Table(name="mixtasordenes")
@NamedQuery(name="Mixtasordene.findAll", query="SELECT m FROM Mixtasordene m")
public class Mixtasordene implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idmixtasordenes;

	private String aviso;

	private int centro;

	@Column(name="clase_de_orden")
	private String claseDeOrden;

	private float cost_total_real;

	private int equipo;

	private String estado;

	@Temporal(TemporalType.DATE)
	private Date fecha_entrada;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_fin_extr")
	private Date fechaFinExtr;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_in_real")
	private Date fechaInReal;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_ini_ext")
	private Date fechaIniExt;

	private Time fin_real_hora;

	@Column(name="grupo_plan_mant")
	private String grupoPlanMant;

	private int orden;

	@Column(name="plan_mant_prev")
	private String planMantPrev;

	@Column(name="pto_trab_res")
	private String ptoTrabRes;

	private String texto_breve;

	private float total_coste_plan;

	@Column(name="ubicacion_tecnica")
	private String ubicacionTecnica;

	public Mixtasordene() {
	}

	public int getIdmixtasordenes() {
		return this.idmixtasordenes;
	}

	public void setIdmixtasordenes(int idmixtasordenes) {
		this.idmixtasordenes = idmixtasordenes;
	}

	public String getAviso() {
		return this.aviso;
	}

	public void setAviso(String aviso) {
		this.aviso = aviso;
	}

	public int getCentro() {
		return this.centro;
	}

	public void setCentro(int centro) {
		this.centro = centro;
	}

	public String getClaseDeOrden() {
		return this.claseDeOrden;
	}

	public void setClaseDeOrden(String claseDeOrden) {
		this.claseDeOrden = claseDeOrden;
	}

	public float getCost_total_real() {
		return this.cost_total_real;
	}

	public void setCost_total_real(float cost_total_real) {
		this.cost_total_real = cost_total_real;
	}

	public int getEquipo() {
		return this.equipo;
	}

	public void setEquipo(int equipo) {
		this.equipo = equipo;
	}

	public String getEstado() {
		return this.estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Date getFecha_entrada() {
		return this.fecha_entrada;
	}

	public void setFecha_entrada(Date fecha_entrada) {
		this.fecha_entrada = fecha_entrada;
	}

	public Date getFechaFinExtr() {
		return this.fechaFinExtr;
	}

	public void setFechaFinExtr(Date fechaFinExtr) {
		this.fechaFinExtr = fechaFinExtr;
	}

	public Date getFechaInReal() {
		return this.fechaInReal;
	}

	public void setFechaInReal(Date fechaInReal) {
		this.fechaInReal = fechaInReal;
	}

	public Date getFechaIniExt() {
		return this.fechaIniExt;
	}

	public void setFechaIniExt(Date fechaIniExt) {
		this.fechaIniExt = fechaIniExt;
	}

	public Time getFin_real_hora() {
		return this.fin_real_hora;
	}

	public void setFin_real_hora(Time fin_real_hora) {
		this.fin_real_hora = fin_real_hora;
	}

	public String getGrupoPlanMant() {
		return this.grupoPlanMant;
	}

	public void setGrupoPlanMant(String grupoPlanMant) {
		this.grupoPlanMant = grupoPlanMant;
	}

	public int getOrden() {
		return this.orden;
	}

	public void setOrden(int orden) {
		this.orden = orden;
	}

	public String getPlanMantPrev() {
		return this.planMantPrev;
	}

	public void setPlanMantPrev(String planMantPrev) {
		this.planMantPrev = planMantPrev;
	}

	public String getPtoTrabRes() {
		return this.ptoTrabRes;
	}

	public void setPtoTrabRes(String ptoTrabRes) {
		this.ptoTrabRes = ptoTrabRes;
	}

	public String getTexto_breve() {
		return this.texto_breve;
	}

	public void setTexto_breve(String texto_breve) {
		this.texto_breve = texto_breve;
	}

	public float getTotal_coste_plan() {
		return this.total_coste_plan;
	}

	public void setTotal_coste_plan(float total_coste_plan) {
		this.total_coste_plan = total_coste_plan;
	}

	public String getUbicacionTecnica() {
		return this.ubicacionTecnica;
	}

	public void setUbicacionTecnica(String ubicacionTecnica) {
		this.ubicacionTecnica = ubicacionTecnica;
	}

}