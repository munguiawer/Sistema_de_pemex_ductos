package conector;

import modelo.Datos;

import java.sql.Connection;
import java.sql.Statement;
public class Graficas {
	
 private	Datos Mensual[] = new Datos[10];
 private    Datos Trimestral[] = new Datos[20];
 private    Datos Semestral[]  = new Datos[20];
 private	mysql_conn c = new mysql_conn();
 private	Connection con = c.getCon();
 private    String b = "bien";
	 
	
	public Graficas(int year) {
		Mensual(year);
		Trimestral(year);
		Semestral(year);
		
	}
	
	private void Semestral(int year) {
        int i =0;
		
		try {
			Statement st = con.createStatement();
			
			st.executeQuery("SELECT * FROM sasp."+year+" WHERE periodo = 'Semestral'");
			while(st.getResultSet().next())
			{
				i++;
				Semestral[i] = new Datos();
				Semestral[i].setDescripsion(st.getResultSet().getString("descripsion"));
				Semestral[i].setJunio(st.getResultSet().getFloat("junio"));
				Semestral[i].setDiciembre(st.getResultSet().getFloat("diciembre"));
			}
		}catch(Exception e){
		    
		    System.out.println(e.getMessage());
		}
		
	}

	private void Trimestral(int year) {
		
		int i =0;
		
		try {
			Statement st = con.createStatement();
			
			st.executeQuery("SELECT * FROM sasp."+year+" WHERE periodo = 'Trimestral'");
			while(st.getResultSet().next())
			{
				i++;
				Trimestral[i] = new Datos();
				Trimestral[i].setDescripsion(st.getResultSet().getString("descripsion"));
				Trimestral[i].setMarzo(st.getResultSet().getFloat("marzo"));
				Trimestral[i].setJunio(st.getResultSet().getFloat("junio"));
				Trimestral[i].setSeptiembre(st.getResultSet().getFloat("septiembre"));
				Trimestral[i].setDiciembre(st.getResultSet().getFloat("diciembre"));
				
			}
		}catch(Exception e){
		    
		    System.out.println(e.getMessage());
		}
		
	}

	public void Mensual(int year)
	{
		
		int i =0;
		
		try {
			Statement st = con.createStatement();
			
			st.executeQuery("SELECT * FROM sasp."+year+" WHERE periodo = 'Mensual'");
			while(st.getResultSet().next())
			{
				i++;
				Mensual[i] = new Datos();
				Mensual[i].setDescripsion(st.getResultSet().getString("descripsion"));
				Mensual[i].setEnero(st.getResultSet().getFloat("enero"));
				Mensual[i].setFebrero(st.getResultSet().getFloat("febrero"));
				Mensual[i].setMarzo(st.getResultSet().getFloat("marzo"));
				Mensual[i].setAbril(st.getResultSet().getFloat("abril"));
				Mensual[i].setMayo(st.getResultSet().getFloat("mayo"));
				Mensual[i].setJunio(st.getResultSet().getFloat("junio"));
				Mensual[i].setJulio(st.getResultSet().getFloat("julio"));
				Mensual[i].setAgosto(st.getResultSet().getFloat("agosto"));
				Mensual[i].setSeptiembre(st.getResultSet().getFloat("septiembre"));
				Mensual[i].setOctubre(st.getResultSet().getFloat("octubre"));
				Mensual[i].setNoviembre(st.getResultSet().getFloat("noviembre"));
				Mensual[i].setDiciembre(st.getResultSet().getFloat("diciembre"));
				
				
				
				
			
				
				
			}
			
		} catch (Exception e) {
			b = e.getMessage();
		}finally{
			b = "bien";
		}
		
		
		
		
	}

	public String getB() {
		return b;
	}

	public Datos[] getMensual() {
		return Mensual;
	}

	public Datos[] getTrimestral() {
		return Trimestral;
	}

	public Datos[] getSemestral() {
		return Semestral;
	}


	public Connection getCon() {
		return con;
	}

	
	
	

}
