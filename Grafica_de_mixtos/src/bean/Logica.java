package bean;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Query;
import javax.persistence.TemporalType;

import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.CategoryAxis;
import org.primefaces.model.chart.LineChartModel;
import org.primefaces.model.chart.LineChartSeries;

import model.Variable;
import persistencia.GetPersistence;

public class Logica {

    private LineChartModel model;

    SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy");
    GetPersistence gp = new GetPersistence();
    List<Variable> ListVar = new ArrayList<Variable>();
    
    private Date date = new Date();
    private Date date2 = new Date();

    public Logica() {
	
	actualizar();
    }

    public void actualizar() {
	obtener_datos();
	model = new LineChartModel();

	LineChartSeries SCOR00 = new LineChartSeries();
	SCOR00.setLabel("SCOR00");

	LineChartSeries STUB10 = new LineChartSeries();
	STUB10.setLabel("STUB10");

	LineChartSeries SRES00 = new LineChartSeries();
	SRES00.setLabel("SRES00");

	LineChartSeries SAUT10B = new LineChartSeries(); 
	SAUT10B.setLabel("SAUT10B");

	LineChartSeries SAUT00 = new LineChartSeries();
	SAUT00.setLabel("SAUT00");

	LineChartSeries CEE00 = new LineChartSeries();
	CEE00.setLabel("CEE00");

	LineChartSeries STUB00 = new LineChartSeries();
	STUB00.setLabel("STUB00");

	LineChartSeries ESP00 = new LineChartSeries();
	ESP00.setLabel("ESP00");

	LineChartSeries SSEG10 = new LineChartSeries();
	SSEG10.setLabel("SSEG10");

	LineChartSeries SAUT10 = new LineChartSeries();
	SAUT10.setLabel("SAUT10");

	LineChartSeries SMED10 = new LineChartSeries();
	SMED10.setLabel("SMED10");

	LineChartSeries SMED00 = new LineChartSeries();
	SMED00.setLabel("SMED00");

	LineChartSeries SCIV00 = new LineChartSeries();
	SCIV00.setLabel("SCIV00");

	LineChartSeries SMCD00 = new LineChartSeries();
	SMCD00.setLabel("SMCD00");

	
	for (Variable v : ListVar) {
	    String fecha = formateador.format(v.getFecha());
	    if (v.getResponsable().endsWith("SCOR00")) {
		SCOR00.set(fecha, v.getValor());

	    }

	    if (v.getResponsable().endsWith("STUB10")) {
		STUB10.set(fecha, v.getValor());

	    }

	    if (v.getResponsable().endsWith("SRES00")) {
		SRES00.set(fecha, v.getValor());

	    }
	    
	    if (v.getResponsable().endsWith("SAUT10B")) {
		SAUT10B.set(fecha, v.getValor());

	    }
	    
	    if (v.getResponsable().endsWith("SAUT00")) {
		SAUT00.set(fecha, v.getValor());

	    }
	    
	    if (v.getResponsable().endsWith("CEE00")) {
		CEE00.set(fecha, v.getValor());

	    }
	    
	    if (v.getResponsable().endsWith("STUB00")) {
		STUB00.set(fecha, v.getValor());

	    }
	    if (v.getResponsable().endsWith("ESP00")) {
		ESP00.set(fecha, v.getValor());

	    }
	    if (v.getResponsable().endsWith("SSEG10")) {
		SSEG10.set(fecha, v.getValor());

	    }
	    if (v.getResponsable().endsWith("SAUT10")) {
		SAUT10.set(fecha, v.getValor());

	    }
	    if (v.getResponsable().endsWith("SMED10")) {
		SMED10.set(fecha, v.getValor());

	    }
	    
	    if (v.getResponsable().endsWith("SCIV00")) {
		SCIV00.set(fecha, v.getValor());

	    }
	    
	    if (v.getResponsable().endsWith("SMCD00")) {
		SMCD00.set(fecha, v.getValor());

	    }
	    
	   
	    
	    

	}

	
	model.addSeries(SCOR00);
	model.addSeries(STUB10);
	model.addSeries(SRES00);
	model.addSeries(SAUT10B);
	model.addSeries(SAUT00);
	model.addSeries(CEE00);
	model.addSeries(STUB00);
	model.addSeries(ESP00);
	model.addSeries(SSEG10);
	model.addSeries(SAUT10);
	model.addSeries(SMED10);
	model.addSeries(SCIV00);
	model.addSeries(SMED00);
	model.addSeries(SMCD00);

	model.setTitle("Grafica de mixtos");

	model.setLegendPosition("e");
	model.setShowPointLabels(true);
	model.getAxes().put(AxisType.X, new CategoryAxis("Fecha"));
	Axis yAxis = model.getAxis(AxisType.Y);
	yAxis.setLabel("%");
	yAxis.setMin(0);
	yAxis.setMax(100);

    }

    public void obtener_datos() {
	Query q = gp.getEm().createQuery("SELECT X FROM Variable X" );// WHERE X.fecha >= ?1 AND X.fecha <= ?2");
	//q.setParameter(1, date,TemporalType.DATE);
	//q.setParameter(2, date2,TemporalType.DATE);
	ListVar = (List<Variable>) q.getResultList();
    }

    public LineChartModel getModel() {
	return model;
    }

    public void setModel(LineChartModel model) {
	this.model = model;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getDate2() {
        return date2;
    }

    public void setDate2(Date date2) {
        this.date2 = date2;
    }
    

}
