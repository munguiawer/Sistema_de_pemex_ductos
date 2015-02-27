package implementacion;

import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import mail.SendMailTLS;
import model.Area;
import model.Email;
import model.ErrorCostoCero;
import model.ErrorIncumpliento;
import model.ErrorOtro;
import model.ErrorTexto;
import model.ErrorVeintePorc;
import model.GrupoPlanError;
import model.Mixtasordene;
import persistencia.GetPersistence;

/* en esta clase encontraremos todos los errores en las ordenes de la tabla 
 * pemexqbs.mixtos */

public class Errores {
    GetPersistence gp = new GetPersistence();
    EntityManager em = gp.getEm();
    List<Area> ListArea = new ArrayList<Area>();
    List<Mixtasordene> ListaMixtas = new ArrayList<Mixtasordene>();
    int contador_errores = 0;
    String grupo = "";
    List<GrupoPlanError> ClasErrGrup = new ArrayList<GrupoPlanError>();
    List<ErrorIncumpliento> ClasErrIncum = new ArrayList<ErrorIncumpliento>();
    List<ErrorCostoCero> ClasErrCero = new ArrayList<ErrorCostoCero>();
    List<ErrorVeintePorc> ClasErrVein = new ArrayList<ErrorVeintePorc>();
    List<ErrorTexto> ClasErrTexto = new ArrayList<ErrorTexto>();
    List<ErrorOtro> ClasErrOtro = new ArrayList<ErrorOtro>();
    List <Email>  ListEmail = new ArrayList<Email>();
    SendMailTLS sm;

    public Errores() {
	ClasErrGrup.clear();
	ClasErrIncum.clear();
	ClasErrCero.clear();
	ClasErrVein.clear();
	ClasErrTexto.clear();
	ClasErrOtro.clear();
	ListEmail.clear();
	em.getTransaction().begin();
	Query qry = em.createQuery("SELECT X FROM Area X ");
	ListArea = (List<Area>) qry.getResultList();
	Query qry2 = em.createQuery("SELECT X FROM Mixtasordene X ");
	ListaMixtas = (List<Mixtasordene>) qry2.getResultList();
	Query qry3 = em.createQuery("SELECT X FROM Email X ");
	ListEmail = (List<Email>) qry3.getResultList();
	em.getTransaction().commit();
	
	comparar();
	 contador_errores = ListEmail.size();
	 //enviar_grupo();
	 send_error_email();
	//grupo = getEmailDirection("SSEG10");

    }

    public void comparar() {
	int cont = 0;
	String grupos = "";
	String estado = "";
	String[] palabras = new String[2];
	GrupoPlanError[] cf = new GrupoPlanError[ListaMixtas.size()];
	ErrorIncumpliento[] incum = new ErrorIncumpliento[ListaMixtas.size()];
	ErrorCostoCero[] cero = new ErrorCostoCero[ListaMixtas.size()];
	ErrorVeintePorc[] veinte = new ErrorVeintePorc[ListaMixtas.size()];
	ErrorTexto[] texto = new ErrorTexto[ListaMixtas.size()];
	ErrorOtro[] otro = new ErrorOtro[ListaMixtas.size()];

	while (cont < ListaMixtas.size()) {
	    /* Detectamos los errores de grupo */
	    grupos = obtener_grupo(ListaMixtas.get(cont).getPtoTrabRes().trim());

	    if (!ListaMixtas.get(cont).getGrupoPlanMant().endsWith(grupos)
		    && !grupos.endsWith("NAN")) {
		/*
		 * System.out.println(ListaMixtas.get(cont).getPtoTrabRes() +
		 * " " + ListaMixtas.get(cont).getGrupoPlanMant() + " " +
		 * grupos);
		 */
		cf[cont] = new GrupoPlanError();
		cf[cont].setOrden(ListaMixtas.get(cont).getOrden());
		cf[cont].setResponsable(ListaMixtas.get(cont).getPtoTrabRes());
		ClasErrGrup.add(cf[cont]);

	    }

	    /* Detectamos los errores de detectar errores para incumplimientos */

	    estado = ListaMixtas.get(cont).getEstado().trim();
	    palabras = estado.split(" ");

	    if (palabras[1].equals("NOTP") || palabras[1].equals("NEJE")
		    || palabras[1].equals("PTBO")) {
		/*
		 * System.out.println(ListaMixtas.get(cont).getPtoTrabRes() +
		 * " " + ListaMixtas.get(cont).getGrupoPlanMant() + " " +
		 * grupos);
		 */

		incum[cont] = new ErrorIncumpliento();
		incum[cont].setOrden(ListaMixtas.get(cont).getOrden());
		incum[cont].setResponsable(ListaMixtas.get(cont)
			.getPtoTrabRes());
		ClasErrIncum.add(incum[cont]);
	    }

	    /* Detectamos coste total 0 */

	    if (ListaMixtas.get(cont).getTotal_coste_plan() <= 0) {
		/*
		 * System.out.println(ListaMixtas.get(cont).getPtoTrabRes() +
		 * " " + ListaMixtas.get(cont).getGrupoPlanMant() + " " +
		 * ListaMixtas.get(cont).getOrden());
		 */
		cero[cont] = new ErrorCostoCero();
		cero[cont].setOrden(ListaMixtas.get(cont).getOrden());
		cero[cont]
			.setResponsable(ListaMixtas.get(cont).getPtoTrabRes());
		ClasErrCero.add(cero[cont]);

	    }

	    /* detectar errores de >20% */
	    Float total_coste_plan = (float) (ListaMixtas.get(cont)
		    .getTotal_coste_plan() * .20);
	    Float resta = ListaMixtas.get(cont).getTotal_coste_plan()
		    - ListaMixtas.get(cont).getCost_total_real();

	    if (total_coste_plan < resta
		    && ListaMixtas.get(cont).getCost_total_real() != 0) {
		/*
		 * System.out.println(ListaMixtas.get(cont).getPtoTrabRes() +
		 * " " + ListaMixtas.get(cont).getGrupoPlanMant() + " " +
		 * ListaMixtas.get(cont).getOrden());
		 */
		veinte[cont] = new ErrorVeintePorc();
		veinte[cont].setOrden(ListaMixtas.get(cont).getOrden());
		veinte[cont].setResponsable(ListaMixtas.get(cont)
			.getPtoTrabRes());
		ClasErrVein.add(veinte[cont]);

	    }

	    /* // texto_breve error */

	    if (ListaMixtas.get(cont).getTexto_breve().trim() == "") {
		/*
		 * System.out.println(ListaMixtas.get(cont).getPtoTrabRes() +
		 * " " + ListaMixtas.get(cont).getGrupoPlanMant() + " " +
		 * ListaMixtas.get(cont).getOrden());
		 */

		texto[cont] = new ErrorTexto();
		texto[cont].setOrden(ListaMixtas.get(cont).getOrden());
		texto[cont].setResponsable(ListaMixtas.get(cont)
			.getPtoTrabRes());
		ClasErrTexto.add(texto[cont]);

	    }
	    /* otros */
	    if (grupos == "") {
		/*
		 * System.out.println(ListaMixtas.get(cont).getPtoTrabRes() +
		 * " " + ListaMixtas.get(cont).getGrupoPlanMant() + " " +
		 * ListaMixtas.get(cont).getOrden());
		 */
		otro[cont] = new ErrorOtro();
		otro[cont].setOrden(ListaMixtas.get(cont).getOrden());
		otro[cont]
			.setResponsable(ListaMixtas.get(cont).getPtoTrabRes());
		ClasErrOtro.add(otro[cont]);

	    }

	    cont++;
	}

    }

    /* Obtener grupo planificador apartir del responsable */
    public String obtener_grupo(String resp) {
	int cont = 0;
	String planGrup = "";
	while (cont < ListArea.size()) {
	    if (ListArea.get(cont).getId().endsWith(resp)) {
		planGrup = ListArea.get(cont).getGrupoPlan();
		break;
	    }
	    cont++;
	}
	return planGrup;
    }
 //====================000=========00000===========00000000000000000000==================================================================   
    /* ejecutar el envio */
    public void send_error_email() {
	int cont = 0;
	while (cont < ListArea.size()) {
	    System.out.println(enviar_errores(ListArea.get(cont).getId()));
	    cont++;
	}
    }
    
 // =========================== Logica de envio de errores por email ==========================================================     
    
    /* enviar errores de grupo por email */
    public String enviar_errores(String resp) {
	String status = "";
	String grupo = " Ninguna\n";
	String incum = " Ninguna\n";
	String cero = " Ninguna\n";
	String veinte = " Ninguna\n";
	String texto = " Ninguna\n";

	if(grupo_getConcatErr(resp)!=""){
	    grupo = grupo_getConcatErr(resp);
	}
	if(incum_getConcatErr(resp) !=""){
	    incum = incum_getConcatErr(resp);
	}
	if(cero_getConcatErr(resp)!=""){
	    cero = cero_getConcatErr(resp);
	}
	if(veinte_getConcatErr(resp)!="")
	{
	    veinte = veinte_getConcatErr(resp);
	}
	if(texto_getConcatErr(resp)!="")
	{
	    texto = texto_getConcatErr(resp);
	}
	
	
	
	if (!getEmailDirection(resp).endsWith("NAN")) {

	    try {
		sm = new SendMailTLS(getEmailDirection(resp), resp + "\n"
			+ " Error de grupo  en ordenes: \n"
			+ grupo
			+"Error de incumplimiento en ordenes: \n"
			+incum
			+"Error de costos planeados en 0 ,en ordenes: \n"
			+cero
			+"Error costos >20%  en ordenes: \n"
			+veinte
			+"Error de texto en ordenes: \n"
			+texto
			+"No responda este mensaje")	;
		

		status += "Error  " + sm.getStatus() + " a "+ resp +" E-mail " + getEmailDirection(resp)
			+ "\n";

	    } catch (Exception e) {
		System.out.println(e.getMessage());
	    }
	}
	
	return status;

    }

  
 
    
    
    /* concatenar los errores de grupo*/
    public String grupo_getConcatErr(String res) {

	String errores = "";
	int cont = 0;
	while (cont < ClasErrGrup.size()) {
	    if (ClasErrGrup.get(cont).getResponsable().endsWith(res)) {
		errores += Integer.toString(ClasErrGrup.get(cont).getOrden())
			+ "\n";
	    }
	    
	    cont++;
	}

	return errores;
    }
    
    /* concatenar los errores de incumplimiento*/
    public String incum_getConcatErr(String res) {

	String errores = "";
	int cont = 0;
	while (cont < ClasErrIncum.size()) {
	    if (ClasErrIncum.get(cont).getResponsable().endsWith(res)) {
		errores += Integer.toString(ClasErrIncum.get(cont).getOrden())
			+ "\n";
	    }
	    
	    cont++;
	}

	return errores;
    }
    
    /*concatenar errores 0*/
    public String cero_getConcatErr(String res) {

   	String errores = "";
   	int cont = 0;
   	while (cont < ClasErrCero.size()) {
   	    if (ClasErrCero.get(cont).getResponsable().endsWith(res)) {
   		errores += Integer.toString(ClasErrCero.get(cont).getOrden())
   			+ "\n";
   	    }
   	    
   	    cont++;
   	}

   	return errores;
       }
    
    /*concatenar errores >20 */
    public String veinte_getConcatErr(String res) {

   	String errores = "";
   	int cont = 0;
   	while (cont < ClasErrVein.size()) {
   	    if (ClasErrVein.get(cont).getResponsable().endsWith(res)) {
   		errores += Integer.toString(ClasErrVein.get(cont).getOrden())
   			+ "\n";
   	    }
   	    
   	    cont++;
   	}

   	return errores;
       }
    
    /* concatenar sin texto*/
    public String texto_getConcatErr(String res) {

   	String errores = "";
   	int cont = 0;
   	while (cont < ClasErrTexto.size()) {
   	    if (ClasErrTexto.get(cont).getResponsable().endsWith(res)) {
   		errores += Integer.toString(ClasErrTexto.get(cont).getOrden())
   			+ "\n";
   	    }
   	    
   	    cont++;
   	}

   	return errores;
       }
    
    /*concatenar otros*/
    public String otro_getConcatErr(String res) {

   	String errores = "";
   	int cont = 0;
   	while (cont < ClasErrOtro.size()) {
   	    if (ClasErrOtro.get(cont).getResponsable().endsWith(res)) {
   		errores += Integer.toString(ClasErrOtro.get(cont).getOrden())
   			+ "\n";
   	    }
   	    
   	    cont++;
   	}

   	return errores;
       }
    
    /* Obtener el email del responsable */
    public String getEmailDirection(String res) {
	String email = "";
	int cont = 0;
	while (cont < ListEmail.size()) {

	    if (ListEmail.get(cont).getArea().endsWith(res)) {

		email = ListEmail.get(cont).getCorreo();
		break;

	    }

	    cont++;

	}
	return email;
    }


    public int getContador_errores() {
	return contador_errores;
    }

    public void setContador_errores(int contador_errores) {
	this.contador_errores = contador_errores;
    }

    public String getGrupo() {
	return grupo;
    }

    public void setGrupo(String grupo) {
	this.grupo = grupo;
    }

    public List<GrupoPlanError> getClasErrGrup() {
	return ClasErrGrup;
    }

    public void setClasErrGrup(List<GrupoPlanError> clasErrGrup) {
	ClasErrGrup = clasErrGrup;
    }

    public List<ErrorIncumpliento> getClasErrIncum() {
	return ClasErrIncum;
    }

    public void setClasErrIncum(List<ErrorIncumpliento> clasErrIncum) {
	ClasErrIncum = clasErrIncum;
    }

    public List<ErrorCostoCero> getClasErrCero() {
	return ClasErrCero;
    }

    public void setClasErrCero(List<ErrorCostoCero> clasErrCero) {
	ClasErrCero = clasErrCero;
    }

    public List<ErrorVeintePorc> getClasErrVein() {
	return ClasErrVein;
    }

    public void setClasErrVein(List<ErrorVeintePorc> clasErrVein) {
	ClasErrVein = clasErrVein;
    }

    public List<ErrorTexto> getClasErrTexto() {
	return ClasErrTexto;
    }

    public void setClasErrTexto(List<ErrorTexto> clasErrTexto) {
	ClasErrTexto = clasErrTexto;
    }

    public List<ErrorOtro> getClasErrOtro() {
	return ClasErrOtro;
    }

    public void setClasErrOtro(List<ErrorOtro> clasErrOtro) {
	ClasErrOtro = clasErrOtro;
    }

    public List<Mixtasordene> getListaMixtas() {
	return ListaMixtas;
    }

    public void setListaMixtas(List<Mixtasordene> listaMixtas) {
	ListaMixtas = listaMixtas;
    }

    public List<Area> getListArea() {
	return ListArea;
    }

    public void setListArea(List<Area> listArea) {
	ListArea = listArea;
    }

}
