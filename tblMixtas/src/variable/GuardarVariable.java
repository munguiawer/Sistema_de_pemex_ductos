package variable;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Query;

import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import Modelo.Responsables_variable;
import tblMixtas.Variable;
import tblMixtas.VariableVal;
import conexion.GetPersistence;

public class GuardarVariable {

    GetPersistence gp = new GetPersistence();
    Date date = new Date();
    List<Responsables_variable> Respon_varList = new ArrayList<Responsables_variable>();
    List<VariableVal> estado = new ArrayList<VariableVal>();
    Boolean bandera = false;
    int id_fecha;
    

    public GuardarVariable() {
	dia();
	//gp.getEm().getTransaction().begin();
	Query q = gp.getEm().createQuery("SELECT x FROM VariableVal X");
	estado = (List<VariableVal>) q.getResultList();
	//gp.getEm().getTransaction().commit();
         
	SimpleDateFormat sm = new SimpleDateFormat("d/M/yyyy");
	String hoy = sm.format(date);
	for (VariableVal es : estado) {
	    if ( sm.format(es.getFecha()).endsWith(hoy) && es.getEstado() == 0) {
		bandera = true;
		id_fecha = es.getId();
		break;
	    } else {
		bandera = false;
	    }
	}
	
	

    }

    public void dia() {
	VariableVal vrval = new VariableVal();
	try {
	    gp.getEm().getTransaction().begin();
	    vrval.setFecha(date);
	    vrval.setEstado(0);
	    gp.getEm().persist(vrval);
	    gp.getEm().getTransaction().commit();
	} catch (Exception e) {
	}

    }

    public void llenar_res_list(Responsables_variable vr) {
	Respon_varList.add(vr);
    }

    public void guardar(List<Responsables_variable> resL) {
	SimpleDateFormat sm = new SimpleDateFormat("d/M/yyyy");
	String fecha = sm.format(date);

	DateTimeFormatter formatter = DateTimeFormat.forPattern("d/M/yyyy");
	LocalDate localDate = formatter.parseLocalDate(fecha);
	int dayOfWeek = localDate.getDayOfWeek();
	
	
	VariableVal vrval = new VariableVal();
	
	Variable var[] = new Variable[20];
	int cont=0;
	
        System.out.println(resL.size());
        System.out.println(dayOfWeek);
        System.out.println(id_fecha);
        System.out.println(bandera);
        
        for (Responsables_variable rv : resL) {
            System.out.println(rv.getResponsable()+" : "+rv.getValor());
        }
        
	if (dayOfWeek == 1 && bandera == true) {
	    try{
	    gp.getEm().getTransaction().begin();
	    for (Responsables_variable rv : resL) {
		
		
		var[cont] = new Variable();
		var[cont].setFecha(date);
		var[cont].setResponsable(rv.getResponsable());
		if(Float.isNaN(rv.getValor())){
		    var[cont].setValor(0);
		}else{
		var[cont].setValor(rv.getValor());
		}
		gp.getEm().persist(var[cont]);
		
		cont++;
	    }
	    vrval = gp.getEm().find(VariableVal.class, id_fecha);
	    vrval.setEstado(1);
	    gp.getEm().getTransaction().commit();
	    }catch(Exception e){}
	    
	  
	}
    }

    public List<Responsables_variable> getRespon_varList() {
        return Respon_varList;
    }

    public void setRespon_varList(List<Responsables_variable> respon_varList) {
        Respon_varList = respon_varList;
    }

}
