package logica;



import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import javax.persistence.EntityManager;
import javax.persistence.Query;

import conexion.GetPersistence;
import tblMixtas.*;

public class TablaMixta {

    GetPersistence gp = new GetPersistence();
    EntityManager em = gp.getEm();
    List<Area> listArea = new ArrayList<Area>();
    List<Mixtasordene> listMixta = new ArrayList<Mixtasordene>();
    List<Mixtasordene> MixtaExecu = new ArrayList<Mixtasordene>();
    // errores
    List<Mixtasordene> ListaMixtas = new ArrayList<Mixtasordene>();
    //hora de actualizacion y fecha
    List<HoraActu> listHora = new ArrayList<HoraActu>();
    HoraActu h = new HoraActu();

    public TablaMixta() {

	Date date = new Date();
	
	listArea.clear();
	listMixta.clear();
	ListaMixtas.clear();
	MixtaExecu.clear();
	listHora.clear();
	em.getTransaction().begin();
	Query qry = em.createQuery("SELECT X FROM Area X ");
	listArea = (List<Area>) qry.getResultList();
	Query qry2 = em
		.createQuery("SELECT X FROM Mixtasordene X WHERE X.fechaFinExtr < :finExtr ");
		
	qry2.setParameter("finExtr", date);
	listMixta = (List<Mixtasordene>) qry2.getResultList();
	Query qry3 = em
		.createQuery("SELECT X FROM Mixtasordene X WHERE X.fechaFinExtr >= :finExtr ");
	        	       
	qry3.setParameter("finExtr", date);
	MixtaExecu = (List<Mixtasordene>) qry3.getResultList();
	// errores
	Query qry4 = em.createQuery("SELECT X FROM Mixtasordene X ");
	ListaMixtas = (List<Mixtasordene>) qry4.getResultList();
        //hora actual
	Query qry5 = em.createQuery("SELECT X FROM HoraActu X ");
	listHora = (List<HoraActu>) qry5.getResultList();
	
	em.getTransaction().commit();
	em.close();

    }

    public int AbierLib(String res) {

	int ablib = 0;
	int cont = 0;
	String estado = "";
	String[] palabras = new String[2];

	while (cont < listMixta.size()) {

	    if (listMixta.get(cont).getPtoTrabRes().endsWith(res)) {

		estado = listMixta.get(cont).getEstado();

		palabras = estado.split(" ");

		if (palabras[0].endsWith("ABIE")) {
		    ablib++;
		}

		if (palabras[0].endsWith("LIB.")) {
		    ablib++;
		}

	    }

	    cont++;
	}

	return ablib;

    }

    public int cerradas(String res) {
	int ablib = 0;
	int cont = 0;
	String estado = "";
	String[] palabras = new String[2];

	while (cont < listMixta.size()) {

	    if (listMixta.get(cont).getPtoTrabRes().endsWith(res)) {

		estado = listMixta.get(cont).getEstado();

		palabras = estado.split(" ");

		if (palabras[0].endsWith("CERR")) {
		    ablib++;
		}

	    }

	    cont++;
	}

	return ablib;

    }

    public int cetec(String res) {
	int ablib = 0;
	int cont = 0;
	String estado = "";
	String[] palabras = new String[2];

	while (cont < listMixta.size()) {

	    if (listMixta.get(cont).getPtoTrabRes().endsWith(res)) {

		estado = listMixta.get(cont).getEstado();

		palabras = estado.split(" ");

		if (palabras[0].endsWith("CTEC")) {
		    ablib++;
		}

	    }

	    cont++;
	}

	return ablib;

    }

    public int execu(String res) {
	int cont = 0;
	int execu = 0;
	while (cont < MixtaExecu.size()) {
	    if (MixtaExecu.get(cont).getPtoTrabRes().endsWith(res)) {
		execu++;
		
	    }
	    cont++;
	}
	return execu;
    }

    public int errores(String res) {
	int cont = 0;
	String estado = "";
	String[] palabras = new String[2];
	String grupos = "";
	int error = 0;
	while (cont < ListaMixtas.size()) {
	    if (ListaMixtas.get(cont).getPtoTrabRes().endsWith(res)) {
		/* Detectamos los errores de grupo */
		grupos = obtener_grupo(ListaMixtas.get(cont).getPtoTrabRes()
			.trim());

		if (!ListaMixtas.get(cont).getGrupoPlanMant().endsWith(grupos)
			&& !grupos.endsWith("NAN")) {

		    error++;
		}

		/*
		 * Detectamos los errores de detectar errores para
		 * incumplimientos
		 */

		estado = ListaMixtas.get(cont).getEstado().trim();
		palabras = estado.split(" ");

		if (palabras[1].equals("NOTP") || palabras[1].equals("NEJE")
			|| palabras[1].equals("PTBO")) {

		    error++;

		}

		if (ListaMixtas.get(cont).getTotal_coste_plan() <= 0) {
		    error++;

		}

		/* detectar errores de >20% */
		Float total_coste_plan = (float) (ListaMixtas.get(cont)
			.getTotal_coste_plan() * .20);
		Float resta = ListaMixtas.get(cont).getTotal_coste_plan()
			- ListaMixtas.get(cont).getCost_total_real();
		if(resta > 0){
		if (palabras[0].equals("CERR") || palabras[0].equals("CETC") && total_coste_plan < resta
			&& ListaMixtas.get(cont).getCost_total_real() != 0) {

		    error++;

		}
		}

		/* // texto_breve error */

		if (ListaMixtas.get(cont).getTexto_breve().trim() == "") {

		    error++;

		}

	    }
	    cont++;
	}

	return error;

    }
    
    //erores grupo -con orden
    public String errores_grupo(String res) {
	int cont = 0;
	String ordenes = "";
	String grupos = "";
	
	while (cont < ListaMixtas.size()) {
	    if (ListaMixtas.get(cont).getPtoTrabRes().endsWith(res)) {
		/* Detectamos los errores de grupo */
		grupos = obtener_grupo(ListaMixtas.get(cont).getPtoTrabRes()
			.trim());

		if (!ListaMixtas.get(cont).getGrupoPlanMant().endsWith(grupos)
			&& !grupos.endsWith("NAN")) {

		    ordenes += "|"+ListaMixtas.get(cont).getOrden()+"|"+"<br/>";
		}

		
	    }
	    cont++;
	}

	return ordenes;

    }
    //errires costo 0 -con orden
    public String error_costo(String res) {
	int cont = 0;
	String error = "";
	while (cont < ListaMixtas.size()) {
	    if (ListaMixtas.get(cont).getPtoTrabRes().endsWith(res)) {
		
		if (ListaMixtas.get(cont).getTotal_coste_plan() <= 0) {
		    
		    error+= "|"+ ListaMixtas.get(cont).getOrden()+"|"+"<br/>";

		}

		
	    }
	    cont++;
	}

	return error;

    }
    //error 20% - con orden MODIFICADO 20/02/2013
    public String error_20(String res) {
   	int cont = 0;
   	String estado = "";
   	String[] palabras = new String[2];
   	
   	 
	 
   	String error = "";
   	while (cont < ListaMixtas.size()) {
   	 estado = ListaMixtas.get(cont).getEstado().trim();
	 palabras = estado.split(" ");
   	    if (ListaMixtas.get(cont).getPtoTrabRes().endsWith(res)) {
   		

   		/* detectar errores de >20% */
   		Float total_coste_plan = (float) (ListaMixtas.get(cont)
   			.getTotal_coste_plan() * .20);
   		Float resta = ListaMixtas.get(cont).getTotal_coste_plan()
   			- ListaMixtas.get(cont).getCost_total_real();
                 if(resta > 0){
   		if (palabras[0].equals("CERR") || palabras[0].equals("CETC")  && total_coste_plan < resta
   			&& ListaMixtas.get(cont).getCost_total_real() != 0) {

   		    error+="|"+ListaMixtas.get(cont).getOrden()+"|"+"<br/>";

   		}
                 }

   	    }
   	    cont++;
   	}

   	return error;

       }
    
    //falta texto en operaciones- con orden
    

    public String error_text(String res) {
	int cont = 0;
	
	String error = "";
	while (cont < ListaMixtas.size()) {
	    if (ListaMixtas.get(cont).getPtoTrabRes().endsWith(res)) {
		
		/* // texto_breve error */

		if (ListaMixtas.get(cont).getTexto_breve().trim() == "") {

		    error +="|"+ListaMixtas.get(cont).getOrden()+"|"+"<br/>";

		}

	    }
	    cont++;
	}

	return error;

    }
    //error incumplimiento -con orden
    public String error_incum(String res) {
	int cont = 0;
	String estado = "";
	String[] palabras = new String[2];
	
	String error ="";
	while (cont < ListaMixtas.size()) {
	    if (ListaMixtas.get(cont).getPtoTrabRes().endsWith(res)) {
		

		/*
		 * Detectamos los errores de detectar errores para
		 * incumplimientos
		 */

		estado = ListaMixtas.get(cont).getEstado().trim();
		palabras = estado.split(" ");

		if (palabras[1].equals("NOTP") || palabras[1].equals("NEJE")
			|| palabras[1].equals("PTBO")) {

		    error+= "|"+ListaMixtas.get(cont).getOrden()+"|"+"<br/>";

		}

		

	    }
	    cont++;
	}

	return error;

    }

    /* Obtener grupo planificador apartir del responsable */
    public String obtener_grupo(String resp) {
	int cont = 0;
	String planGrup = "";
	while (cont < listArea.size()) {
	    if (listArea.get(cont).getId().endsWith(resp)) {
		planGrup = listArea.get(cont).getGrupoPlan();
		break;
	    }
	    cont++;
	}
	return planGrup;
    }

    public List<Area> getListArea() {
	return listArea;
    }

    public void setListArea(List<Area> listArea) {
	this.listArea = listArea;
    }

    public List<Mixtasordene> getListMixta() {
	return listMixta;
    }

    public void setListMixta(List<Mixtasordene> listMixta) {
	this.listMixta = listMixta;
    }

    public HoraActu getH() {
        return h;
    }

    public void setH(HoraActu h) {
        this.h = h;
    }

    public List<HoraActu> getListHora() {
        return listHora;
    }

    public void setListHora(List<HoraActu> listHora) {
        this.listHora = listHora;
    }
    

}
