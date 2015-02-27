package tablas;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.context.FacesContext;
import javax.persistence.Query;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.primefaces.event.FileUploadEvent;
import org.primefaces.event.RowEditEvent;
import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.ChartSeries;

import ermUP.Upload;  // subir en erm
import model.Ermcom;
import model.Ermpdf;
import model.PhatsValvulas;
import model.Valvserm;
import model.Valvulasfloat;
import persistencia.GetPersistence;
import sesion.Usuarios;

// este bean tiene que ser de tipo view para que se guarde la variable de fecha
public class Erms {
    Usuarios us = new Usuarios();  
    GetPersistence gp = new GetPersistence();
    PhatsValvulas pat;
    //usuario
    private String usuario = null;
    // tabla realizada
    List<Valvulasfloat> ListaR = new ArrayList<Valvulasfloat>();
    Valvulasfloat re = new Valvulasfloat();
    // Sin realizar
    List<Valvulasfloat> ListaNR = new ArrayList<Valvulasfloat>();
    Valvulasfloat nr = new Valvulasfloat();
    // Porcentaje
    List<Valvulasfloat> ListaPorc = new ArrayList<Valvulasfloat>();
    Valvulasfloat Porc = new Valvulasfloat();
    // pdfChinameca
    List<Ermpdf> ListaEmPdf = new ArrayList<Ermpdf>();
    // tabla planeadas
    List<Valvserm> ListaPlan = new ArrayList<Valvserm>();
    // Grafica
    private BarChartModel model;
    SimpleDateFormat formateador = new SimpleDateFormat("yyyy");
    // Comentarios
    List<Ermcom> ListCom = new ArrayList<Ermcom>();

    Date dato = new Date();

    public Erms() {
	
	ListCom.clear();
	ListaPorc.clear();
	ListaNR.clear();
	ListaR.clear();
	ListaPlan.clear();
	ListaEmPdf.clear();
	model = new BarChartModel();
	tabla();
	model.setLegendPosition("ne");
	model.setAnimate(true);
	Axis xAxis = model.getAxis(AxisType.X);
	xAxis.setLabel("");
	Axis yAxis = model.getAxis(AxisType.Y);
	yAxis.setLabel("");
	yAxis.setMin(0);
	yAxis.setMax(20);
    }

    public void tabla() {
	
	model.clear();
	ListCom.clear();
	ListaPorc.clear();
	ListaNR.clear();
	ListaR.clear();
	model.setTitle("PROGRAMA Y CUMPLIMIENTO DE CALIBRACION DE"
		// + "VALVULAS DE SEGURIDAD DE LAS ERM´s " + year);
		+ "VALVULAS DE SEGURIDAD DE ERM's "
		+ formateador.format(dato));
	// obtenemos las planeadas
	gp.getEm().getTransaction().begin();
	Query q = gp.getEm().createQuery(
		"SELECT X FROM Valvserm X WHERE X.year = :years ");
	q.setParameter("years", dato);
	ListaPlan = (List<Valvserm>) q.getResultList();
	gp.getEm().getTransaction().commit();

	// obtenemos los pdf
	gp.getEm().getTransaction().begin();
	Query q2 = gp.getEm().createQuery(
		"SELECT X FROM Ermpdf X WHERE X.year = :years ");
	q2.setParameter("years", dato);
	ListaEmPdf = (List<Ermpdf>) q2.getResultList();
	gp.getEm().getTransaction().commit();

	// obtenemos Comentarios
	gp.getEm().getTransaction().begin();
	Query q3 = gp.getEm().createQuery(
		"SELECT X FROM Ermcom X WHERE X.year = :years ");
	q3.setParameter("years", dato);
	ListCom = (List<Ermcom>) q3.getResultList();
	gp.getEm().getTransaction().commit();

	realiz();
	noRealiza();
	Porcnt();
	Graf();
    }

    // obtenemos las realizadas
    public void realiz() {
	int cont = 0;
	double enero = 0;
	double febrero = 0;
	double marzo = 0;
	double abril = 0;
	double mayo = 0;
	double junio = 0;
	double julio = 0;
	double agosto = 0;
	double septiembre = 0;
	double octubre = 0;
	double noviembre = 0;
	double diciembre = 0;

	// contabilizamos
	for (Ermpdf cpf : ListaEmPdf) {

	    if (cpf.getMes().endsWith("ENERO") && cpf.getValido() ==1) {
		enero++;
	    }
	    if (cpf.getMes().endsWith("FEBRERO") && cpf.getValido() ==1) {
		febrero++;
	    }
	    if (cpf.getMes().endsWith("MARZO") && cpf.getValido() ==1) {
		marzo++;
	    }
	    if (cpf.getMes().endsWith("ABRIL") && cpf.getValido() ==1) {
		abril++;
	    }
	    if (cpf.getMes().endsWith("MAYO") && cpf.getValido() ==1) {
		mayo++;
	    }
	    if (cpf.getMes().endsWith("JUNIO") && cpf.getValido() ==1) {
		junio++;
	    }
	    if (cpf.getMes().endsWith("JULIO") && cpf.getValido() ==1) {
		julio++;
	    }
	    if (cpf.getMes().endsWith("AGOSTO") && cpf.getValido() ==1) {
		agosto++;
	    }
	    if (cpf.getMes().endsWith("SEPTIEMBRE")) {
		septiembre++;
	    }
	    if (cpf.getMes().endsWith("OCTUBRE")) {
		octubre++;
	    }
	    if (cpf.getMes().endsWith("NOVIEMBRE")) {
		noviembre++;
	    }
	    if (cpf.getMes().endsWith("DICIEMBRE")) {
		diciembre++;
	    }
	}

	re.setEnero(enero);
	re.setFebrero(febrero);
	re.setMarzo(marzo);
	re.setAbril(abril);
	re.setMayo(mayo);
	re.setJunio(junio);
	re.setJulio(julio);
	re.setAgosto(agosto);
	re.setSeptiembre(septiembre);
	re.setOctubre(octubre);
	re.setNoviembre(noviembre);
	re.setDiciembre(diciembre);

	ListaR.add(re);
    }

    // obtenemos sin realizar lista
    public void noRealiza() {

	if (ListaR.size() > 0) { // si hay datos en realizados se hace
	    nr.setEnero(ListaPlan.get(0).getEnero() - ListaR.get(0).getEnero());
	    nr.setFebrero(ListaPlan.get(0).getFebrero()
		    - ListaR.get(0).getFebrero());
	    nr.setMarzo(ListaPlan.get(0).getMarzo() - ListaR.get(0).getMarzo());
	    nr.setAbril(ListaPlan.get(0).getAbril() - ListaR.get(0).getAbril());
	    nr.setMayo(ListaPlan.get(0).getMayo() - ListaR.get(0).getMayo());
	    nr.setJunio(ListaPlan.get(0).getJunio() - ListaR.get(0).getJunio());
	    nr.setJulio(ListaPlan.get(0).getJulio() - ListaR.get(0).getJulio());
	    nr.setAgosto(ListaPlan.get(0).getAgosto()
		    - ListaR.get(0).getAgosto());
	    nr.setSeptiembre(ListaPlan.get(0).getSeptiembre()
		    - ListaR.get(0).getSeptiembre());
	    nr.setOctubre(ListaPlan.get(0).getOctubre()
		    - ListaR.get(0).getOctubre());
	    nr.setNoviembre(ListaPlan.get(0).getNoviembre()
		    - ListaR.get(0).getNoviembre());
	    nr.setDiciembre(ListaPlan.get(0).getDiciembre()
		    - ListaR.get(0).getDiciembre());
	}
	ListaNR.add(nr);

    }

    // obtenemos el porcentaje

    public void Porcnt() {
	if (ListaNR.size() > 0) { // si hay datos en no realizado se hace
	    Porc.setEnero(Math.round((ListaR.get(0).getEnero() / ListaPlan.get(
		    0).getEnero()) * 100));
	    Porc.setFebrero(Math.round((ListaR.get(0).getFebrero() / ListaPlan
		    .get(0).getFebrero()) * 100));
	    Porc.setMarzo(Math.round((ListaR.get(0).getMarzo() / ListaPlan.get(
		    0).getMarzo()) * 100));
	    Porc.setAbril(Math.round((ListaR.get(0).getAbril() / ListaPlan.get(
		    0).getAbril()) * 100));
	    Porc.setMayo(Math.round((ListaR.get(0).getMayo() / ListaPlan.get(0)
		    .getMayo()) * 100));
	    Porc.setJunio(Math.round((ListaR.get(0).getJunio() / ListaPlan.get(
		    0).getJunio()) * 100));
	    Porc.setJulio(Math.round((ListaR.get(0).getJulio() / ListaPlan.get(
		    0).getJulio()) * 100));
	    Porc.setAgosto(Math.round((ListaR.get(0).getAgosto() / ListaPlan
		    .get(0).getAgosto()) * 100));
	    Porc.setSeptiembre(Math
		    .round((ListaR.get(0).getSeptiembre() / ListaPlan.get(0)
			    .getSeptiembre()) * 100));
	    Porc.setOctubre(Math.round((ListaR.get(0).getOctubre() / ListaPlan
		    .get(0).getOctubre()) * 100));
	    Porc.setNoviembre(Math
		    .round((ListaR.get(0).getNoviembre() / ListaPlan.get(0)
			    .getNoviembre()) * 100));
	    Porc.setDiciembre(Math
		    .round((ListaR.get(0).getDiciembre() / ListaPlan.get(0)
			    .getDiciembre()) * 100));
	}
	ListaPorc.add(Porc);
    }

    // Grafica

    public void Graf() {
	ChartSeries progra = new ChartSeries();
	progra.setLabel("Programado");
	progra.set("ENE", ListaPlan.get(0).getEnero());
	progra.set("FEB", ListaPlan.get(0).getFebrero());
	progra.set("MAR", ListaPlan.get(0).getMarzo());
	progra.set("APR", ListaPlan.get(0).getAbril());
	progra.set("MAY", ListaPlan.get(0).getMayo());
	progra.set("JUN", ListaPlan.get(0).getJunio());
	progra.set("JUL", ListaPlan.get(0).getJulio());
	progra.set("AUG", ListaPlan.get(0).getAgosto());
	progra.set("SEP", ListaPlan.get(0).getSeptiembre());
	progra.set("OCT", ListaPlan.get(0).getOctubre());
	progra.set("NOV", ListaPlan.get(0).getNoviembre());
	progra.set("DEC", ListaPlan.get(0).getDiciembre());
	model.addSeries(progra);

	ChartSeries realiza = new ChartSeries();
	realiza.setLabel("Realizado");
	realiza.set("ENE", ListaR.get(0).getEnero());
	realiza.set("FEB", ListaR.get(0).getFebrero());
	realiza.set("MAR", ListaR.get(0).getMarzo());
	realiza.set("APR", ListaR.get(0).getAbril());
	realiza.set("MAY", ListaR.get(0).getMayo());
	realiza.set("JUN", ListaR.get(0).getJunio());
	realiza.set("JUL", ListaR.get(0).getJulio());
	realiza.set("AUG", ListaR.get(0).getAgosto());
	realiza.set("SEP", ListaR.get(0).getSeptiembre());
	realiza.set("OCT", ListaR.get(0).getOctubre());
	realiza.set("NOV", ListaR.get(0).getNoviembre());
	realiza.set("DEC", ListaR.get(0).getDiciembre());
	model.addSeries(realiza);

    }

    // Actualizar comentarios
    public void update(RowEditEvent event) {
	Ermcom com = (Ermcom) event.getObject();
	gp.getEm().getTransaction().begin();
	gp.getEm().persist(com);
	gp.getEm().getTransaction().commit();

    }

    // actualizar planeadas
    public void ActualizarPlan(RowEditEvent event) {
	Valvserm chinavlvs = (Valvserm) event.getObject();
	// administrador desarrollador  cordero jefe de operacion
	if(us.getRol() == 1 || us.getRol() == 3 || us.getUsuario().endsWith("846660")|| us.getUsuario().endsWith("201796")){
	gp.getEm().getTransaction().begin();
	gp.getEm().persist(chinavlvs);
	gp.getEm().getTransaction().commit();
	}

    }
     
    
    // subir enero
    public void subirEnero(FileUploadEvent event) {
	try {
	    Upload ip = new Upload(
		    "ENERO",
		    event.getFile().getFileName(),
		    pat.phatErm("ENERO"),
		    us.getUsuario(), dato, event.getFile().getInputstream(),
		    pat.phatGuardarErm("ENERO"));
	    
	    // recargamos todas las listas para ver los resultados del cambio en la tabla
	    tabla();
		
	} catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }
    
    
    //subir febrero
    
    public void subirFebrero(FileUploadEvent event) {
	try {
	    Upload ip = new Upload(
		    "FEBRERO",
		    event.getFile().getFileName(),
		    pat.phatErm("FEBRERO"),
		    us.getUsuario(), dato, event.getFile().getInputstream(),
		    pat.phatGuardarErm("FEBRERO"));
	    tabla();
	} catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }
    
  //subir Marzo
    public void subirMarzo(FileUploadEvent event) {
	try {
	    Upload ip = new Upload(
		    "MARZO",
		    event.getFile().getFileName(),
		    pat.phatErm("MARZO"),
		    us.getUsuario(), dato, event.getFile().getInputstream(),
		    pat.phatGuardarErm("MARZO"));
	    tabla();
	} catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }
    
    
    //subir abril
    public void subirAbril(FileUploadEvent event) {
	try {
	    Upload ip = new Upload(
		    "ABRIL",
		    event.getFile().getFileName(),
		    pat.phatErm("ABRIL"),
		    us.getUsuario(), dato, event.getFile().getInputstream(),
		    pat.phatGuardarErm("ABRIL"));
	    tabla();
	} catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }
    
    //subir mayo
    public void subirMayo(FileUploadEvent event) {
	try {
	    Upload ip = new Upload(
		    "MAYO",
		    event.getFile().getFileName(),
		    pat.phatErm("MAYO"),
		    us.getUsuario(), dato, event.getFile().getInputstream(),
		    pat.phatGuardarErm("MAYO"));
	    tabla();
	} catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }
    
  //subir junio
    public void subirJunio(FileUploadEvent event) {
	try {
	    Upload ip = new Upload(
		    "JUNIO",
		    event.getFile().getFileName(),
		    pat.phatErm("JUNIO"),
		    us.getUsuario(), dato, event.getFile().getInputstream(),
		    pat.phatGuardarErm("JUNIO"));
	    tabla();
	} catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }
    
  //subir julio
    public void subirJulio(FileUploadEvent event) {
	try {
	    Upload ip = new Upload(
		    "JULIO",
		    event.getFile().getFileName(),
		    pat.phatErm("JULIO"),
		    us.getUsuario(), dato, event.getFile().getInputstream(),
		    pat.phatGuardarErm("JULIO"));
	    tabla();
	} catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }
    
  //subir agosto
    public void subirAgosto(FileUploadEvent event) {
	try {
	    Upload ip = new Upload(
		    "AGOSTO",
		    event.getFile().getFileName(),
		    pat.phatErm("AGOSTO"),
		    us.getUsuario(), dato, event.getFile().getInputstream(),
		    pat.phatGuardarErm("AGOSTO"));
	    tabla();
	} catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }
    
  //subir septiembre
    public void subirSeptiembre(FileUploadEvent event) {
	try {
	    Upload ip = new Upload(
		    "SEPTIEMBRE",
		    event.getFile().getFileName(),
		    pat.phatErm("SEPTIEMBRE"),
		    us.getUsuario(), dato, event.getFile().getInputstream(),
		    pat.phatGuardarErm("SEPTIEMBRE"));
	    tabla();
	} catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }
    
    //subir octubre
    public void subirOctubre(FileUploadEvent event) {
	try {
	    Upload ip = new Upload(
		    "OCTUBRE",
		    event.getFile().getFileName(),
		    pat.phatErm("OCTUBRE"),
		    us.getUsuario(), dato, event.getFile().getInputstream(),
		    pat.phatGuardarErm("OCTUBRE"));
	    tabla();
	} catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }
    
    //subir noviembre
    public void subirNoviembre(FileUploadEvent event) {
	try {
	    Upload ip = new Upload(
		    "NOVIEMBRE",
		    event.getFile().getFileName(),
		    pat.phatErm("NOVIEMBRE"),
		    us.getUsuario(), dato, event.getFile().getInputstream(),
		    pat.phatGuardarErm("NOVIEMBRE"));
	    tabla();
	} catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }
    
    //subir DICIEMBRE
    public void subirDiciembre(FileUploadEvent event) {
	try {
	    Upload ip = new Upload(
		    "DICIEMBRE",
		    event.getFile().getFileName(),
		    pat.phatErm("DICIEMBRE"),
		    us.getUsuario(), dato, event.getFile().getInputstream(),
		    pat.phatGuardarErm("DICIEMBRE"));
	    tabla();
	} catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }
    
    
    //borrar 
    public void DeletePdf(Ermpdf pd)
    {
	Ermpdf chp = (Ermpdf) pd;
	// si es el mismo usuario que lo subio lo borra o si es un administrador o jefe de operacion
	if(chp.getUsuario().endsWith(us.getUsuario()) || us.getRol() == 1 || us.getUsuario().endsWith("201796")){
	gp.getEm().getTransaction().begin();
	gp.getEm().remove(chp);
	gp.getEm().getTransaction().commit();
	tabla();
	}
    }
    
    //validar 
    
    public void ValidarPdf(Ermpdf pdf)
    {
	Ermpdf chp = (Ermpdf) pdf;
	Ermpdf mod = new Ermpdf();
	//si es administrador o desarollador
	
	if(us.getRol() == 1 || us.getRol() == 3 || us.getUsuario().endsWith("201796")){
	gp.getEm().getTransaction().begin();
	mod = (Ermpdf) gp.getEm().find(Ermpdf.class, chp.getId());
	mod.setValido(1);
	gp.getEm().persist(mod);
	gp.getEm().getTransaction().commit();
	}
	
    }
    
    // Direccion del servidor ftp
public String ServidorERM()
{
    return pat.viewErmServidor();
}


    public Date getDato() {
	return dato;
    }

    public void setDato(Date dato) {

	this.dato = dato;

    }

    public List<Valvserm> getListaPlan() {
	return ListaPlan;
    }

    public void setListaPlan(List<Valvserm> listaPlan) {
	ListaPlan = listaPlan;
    }

    public List<Valvulasfloat> getListaR() {
	return ListaR;
    }

    public void setListaR(List<Valvulasfloat> listaR) {
	ListaR = listaR;
    }

    public List<Valvulasfloat> getListaNR() {
	return ListaNR;
    }

    public void setListaNR(List<Valvulasfloat> listaNR) {
	ListaNR = listaNR;
    }

    public List<Valvulasfloat> getListaPorc() {
	return ListaPorc;
    }

    public void setListaPorc(List<Valvulasfloat> listaPorc) {
	ListaPorc = listaPorc;
    }

    public BarChartModel getModel() {
	return model;
    }

    public void setModel(BarChartModel model) {
	this.model = model;
    }

    public List<Ermcom> getListCom() {
	return ListCom;
    }

    public void setListCom(List<Ermcom> listCom) {
	ListCom = listCom;
    }
    
    // pdf de enero
    public List<Ermpdf> getListaEnero()
    {
	List<Ermpdf> pdf = new ArrayList();
	pdf.clear();
	for (Ermpdf cp : ListaEmPdf ) {
	    if(cp.getMes().endsWith("ENERO"))
	    {
		pdf.add(cp);
	    }
	}
	return pdf;
    }
    
    // pdf de febrero
    public List<Ermpdf> getListaFebrero()
    {
	List<Ermpdf> pdf = new ArrayList();
	pdf.clear();
	for (Ermpdf cp : ListaEmPdf ) {
	    if(cp.getMes().endsWith("FEBRERO"))
	    {
		pdf.add(cp);
	    }
	}
	return pdf;
    }
    
    // pdf de marzo
    public List<Ermpdf> getListaMarzo()
    {
	List<Ermpdf> pdf = new ArrayList();
	pdf.clear();
	for (Ermpdf cp : ListaEmPdf ) {
	    if(cp.getMes().endsWith("MARZO"))
	    {
		pdf.add(cp);
	    }
	}
	return pdf;
    }
    
    // pdf de abril
    public List<Ermpdf> getListaAbril()
    {
	List<Ermpdf> pdf = new ArrayList();
	pdf.clear();
	for (Ermpdf cp : ListaEmPdf ) {
	    if(cp.getMes().endsWith("ABRIL"))
	    {
		pdf.add(cp);
	    }
	}
	return pdf;
    }
    // pdf de mayo
    public List<Ermpdf> getListaMayo()
    {
	List<Ermpdf> pdf = new ArrayList();
	pdf.clear();
	for (Ermpdf cp : ListaEmPdf ) {
	    if(cp.getMes().endsWith("MAYO"))
	    {
		pdf.add(cp);
	    }
	}
	return pdf;
    }
    
    // pdf de junio
    public List<Ermpdf> getListaJunio()
    {
	List<Ermpdf> pdf = new ArrayList();
	pdf.clear();
	for (Ermpdf cp : ListaEmPdf ) {
	    if(cp.getMes().endsWith("JUNIO"))
	    {
		pdf.add(cp);
	    }
	}
	return pdf;
    }
    
    // pdf de julio
    public List<Ermpdf> getListaJulio()
    {
	List<Ermpdf> pdf = new ArrayList();
	pdf.clear();
	for (Ermpdf cp : ListaEmPdf ) {
	    if(cp.getMes().endsWith("JULIO"))
	    {
		pdf.add(cp);
	    }
	}
	return pdf;
    }
    
    // pdf de agosto
    public List<Ermpdf> getListaAgosto()
    {
	List<Ermpdf> pdf = new ArrayList();
	pdf.clear();
	for (Ermpdf cp : ListaEmPdf ) {
	    if(cp.getMes().endsWith("AGOSTO"))
	    {
		pdf.add(cp);
	    }
	}
	return pdf;
    }
    
    // pdf de septiembre
    public List<Ermpdf> getListaSeptiembre()
    {
	List<Ermpdf> pdf = new ArrayList();
	pdf.clear();
	for (Ermpdf cp : ListaEmPdf ) {
	    if(cp.getMes().endsWith("SEPTIEMBRE"))
	    {
		pdf.add(cp);
	    }
	}
	return pdf;
    }
    
    // pdf de marzo
    public List<Ermpdf> getListaOctubre()
    {
	List<Ermpdf> pdf = new ArrayList();
	pdf.clear();
	for (Ermpdf cp : ListaEmPdf ) {
	    if(cp.getMes().endsWith("OCTUBRE"))
	    {
		pdf.add(cp);
	    }
	}
	return pdf;
    }
    
    // pdf de noviembre
    public List<Ermpdf> getListaNoviembre()
    {
	List<Ermpdf> pdf = new ArrayList();
	pdf.clear();
	for (Ermpdf cp : ListaEmPdf ) {
	    if(cp.getMes().endsWith("NOVIEMBRE"))
	    {
		pdf.add(cp);
	    }
	}
	return pdf;
    }
    
    // pdf de diciembre
    public List<Ermpdf> getListaDiciembre()
    {
	List<Ermpdf> pdf = new ArrayList();
	pdf.clear();
	for (Ermpdf cp : ListaEmPdf ) {
	    if(cp.getMes().endsWith("DICIEMBRE"))
	    {
		pdf.add(cp);
	    }
	}
	return pdf;
    }
    
    
    public List<Ermpdf> getListaErmPdf() {
	
	
	
	return ListaEmPdf;
	
    }

    public void setListaChinaPdf(List<Ermpdf> listaChinaPdf) {
	ListaEmPdf = listaChinaPdf;
    }

}

