package bean;



import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.CategoryAxis;
import org.primefaces.model.chart.ChartSeries;
import org.primefaces.model.chart.LineChartModel;

import conector.Graficas;

public class Graficas_bean {
	private LineChartModel mensual;
	private LineChartModel trimestral;
	private LineChartModel semestral;
	

	public Graficas_bean() {
		Mensual();
		Trimestral();
		Semestral();
	}

	private void Semestral() {
		semestral = new LineChartModel();
		Semestres();
		semestral.setTitle("SASP Semestral");
		semestral.setLegendPosition("e");
		semestral.setShowPointLabels(true);
		semestral.getAxes().put(AxisType.X, new CategoryAxis("Meses"));
		Axis yAxis = semestral.getAxis(AxisType.Y);
		yAxis.setLabel("%");
		yAxis.setMin(0);
		yAxis.setMax(110);

	}

	private void Trimestral() {
		
		trimestral = new LineChartModel();
		Trimestres();
		trimestral.setTitle("SASP Trimestral");
		trimestral.setLegendPosition("c");
		trimestral.setShowPointLabels(true);
		trimestral.getAxes().put(AxisType.X, new CategoryAxis("Meses"));
		Axis yAxis = trimestral.getAxis(AxisType.Y);
		yAxis.setLabel("%");
		yAxis.setMin(0);
		yAxis.setMax(110);
		

	}

	

	private void Mensual() {
		mensual = new LineChartModel();
		Meses();
		mensual.setTitle("SASP Mensual");
		mensual.setLegendPosition("e");
		mensual.setShowPointLabels(true);
		mensual.getAxes().put(AxisType.X, new CategoryAxis("Meses"));
		Axis yAxis = mensual.getAxis(AxisType.Y);
		yAxis.setLabel("%");
		yAxis.setMin(0);
		yAxis.setMax(110);

	}



	// relleno de datos
	private void Semestres() {
		Graficas gf = new Graficas();
		ChartSeries sem[] = new ChartSeries[10];
		for (int i = 0; i < gf.getSemestral().length; i++) {
			if (gf.getSemestral()[i] != null) {
				sem[i] = new ChartSeries();

				sem[i].setLabel(gf.getSemestral()[i].getDescripsion());

				sem[i].set("Junio", gf.getSemestral()[i].getJunio());
				sem[i].set("diciembre", gf.getSemestral()[i].getDiciembre());

				semestral.addSeries(sem[i]);
			}
		}
        
	}
	
	private void Trimestres() {
		Graficas gf = new Graficas();
		ChartSeries tri[] = new ChartSeries[20];
			for (int i = 0; i < gf.getTrimestral().length; i++) {
				
				if (gf.getTrimestral()[i] != null) {
				tri[i] = new ChartSeries();
				tri[i].setLabel(gf.getTrimestral()[i].getDescripsion());
				tri[i].set("Marzo",gf.getTrimestral()[i].getMarzo());
				tri[i].set("Junio",gf.getTrimestral()[i].getJunio());
				tri[i].set("Septiembre",gf.getTrimestral()[i].getSeptiembre());
				tri[i].set("Diciembre",gf.getTrimestral()[i].getDiciembre());
				
				
				trimestral.addSeries(tri[i]);
				
				}
			}
			
			
		
		
	}
   
	private void Meses() {
		Graficas gf = new Graficas();
		ChartSeries mes[] = new ChartSeries[10];					
			for (int i = 0; i < gf.getMensual().length; i++) {
				if (gf.getMensual()[i] != null) {
				mes[i] = new ChartSeries();
				mes[i].setLabel(gf.getMensual()[i].getDescripsion());
				mes[i].set("Enero",gf.getMensual()[i].getEnero());
				mes[i].set("Febrero",gf.getMensual()[i].getFebrero());
				mes[i].set("Marzo",gf.getMensual()[i].getMarzo());
				mes[i].set("Abril",gf.getMensual()[i].getAbril());
				mes[i].set("Mayo",gf.getMensual()[i].getMayo());
				mes[i].set("Junio",gf.getMensual()[i].getJunio());
				mes[i].set("Julio",gf.getMensual()[i].getJulio());
				mes[i].set("Agosto",gf.getMensual()[i].getAgosto());
				mes[i].set("Septiembre",gf.getMensual()[i].getSeptiembre());
				mes[i].set("Octubre",gf.getMensual()[i].getOctubre());
				mes[i].set("Noviembre",gf.getMensual()[i].getNoviembre());
				mes[i].set("Diciembre",gf.getMensual()[i].getDiciembre());
				
				mensual.addSeries(mes[i]);
			}
		}
			
		
		
	}
	
	public LineChartModel getMensual() {
		return mensual;
	}

	public LineChartModel getTrimestral() {
		return trimestral;
	}

	public LineChartModel getSemestral() {
		return semestral;
	}
	
	
	

}
