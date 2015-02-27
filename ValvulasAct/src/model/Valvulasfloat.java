package model;

public class Valvulasfloat {

	String mes;
	double enero=0;
	double febrero=0;
	double  marzo=0;
	double  abril=0;
	double  mayo=0;
	double  junio=0;
	double  julio=0;
	double  agosto=0;
	double  septiembre=0;
	double  octubre=0;
	double  noviembre=0;
	double  diciembre=0;
	double sum = 0;
   
	

	public String getMes() {
		return mes;
	}



	public void setMes(String mes) {
		this.mes = mes;
	}



	public double getEnero() {
		return enero;
	}



	public void setEnero(double enero) {
		this.enero = enero;
	}



	public double getFebrero() {
		return febrero;
	}



	public void setFebrero(double febrero) {
		this.febrero = febrero;
	}



	public double getMarzo() {
		return marzo;
	}



	public void setMarzo(double marzo) {
		this.marzo = marzo;
	}



	public double getAbril() {
		return abril;
	}



	public void setAbril(double abril) {
		this.abril = abril;
	}



	public double getMayo() {
		return mayo;
	}



	public void setMayo(double mayo) {
		this.mayo = mayo;
	}



	public double getJunio() {
		return junio;
	}



	public void setJunio(double junio) {
		this.junio = junio;
	}



	public double getJulio() {
		return julio;
	}



	public void setJulio(double julio) {
		this.julio = julio;
	}



	public double getAgosto() {
		return agosto;
	}



	public void setAgosto(double agosto) {
		this.agosto = agosto;
	}



	public double getSeptiembre() {
		return septiembre;
	}



	public void setSeptiembre(double septiembre) {
		this.septiembre = septiembre;
	}



	public double getOctubre() {
		return octubre;
	}



	public void setOctubre(double octubre) {
		this.octubre = octubre;
	}



	public double getNoviembre() {
		return noviembre;
	}



	public void setNoviembre(double noviembre) {
		this.noviembre = noviembre;
	}



	public double getDiciembre() {
		return diciembre;
	}



	public void setDiciembre(double diciembre) {
		this.diciembre = diciembre;
	}



	public double getSum() {
		return enero + febrero + marzo + abril + mayo + junio + julio + agosto
				+ septiembre + octubre + noviembre + diciembre;
	}
	
	public double getPorc() {
		return Math.round((enero + febrero + marzo + abril + mayo + junio + julio + agosto
				+ septiembre + octubre + noviembre + diciembre)/12);
	}

	

}
