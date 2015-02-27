<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="conector.Graficas" %>
<%@page import="modelo.Datos" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pemex</title>
</head>
<body>
  <% 
       
       Graficas gf = new Graficas();
    
    	/*  Mensual
    	 for(int i =0;i<gf.getMensual().length;i++)
    	 {
    		 if(gf.getMensual()[i] != null)
    		 {
    		 out.println(gf.getMensual()[i].getDescripsion()+" <br/> "+gf.getMensual()[i].getEnero()+ gf.getMensual()[i].getFebrero() + "<br/>");
    		 
    		 
    		 }
    	 }
    	 */
    	 /* Trimestral
    	 for(int i=0;i<gf.getTrimestral().length;i++)
    	 {
    		 if(gf.getTrimestral()[i] != null)
    		 {
    		 out.println(gf.getTrimestral()[i].getDescripsion()+" <br/> "+gf.getTrimestral()[i].getMarzo()+ gf.getTrimestral()[i].getJunio()+gf.getTrimestral()[i].getSeptiembre()+gf.getTrimestral()[i].getDiciembre() + "<br/>");
    		 }
    		 }
    	 */
    	 
    	 /*
    	 
    	 for(int i=0;i<gf.getSemestral().length;i++)
    	 {
    		 if(gf.getSemestral()[i] != null)
    		 {
    			 out.println(gf.getSemestral()[i].getDescripsion()+" <br/> "+gf.getSemestral()[i].getJunio()+ gf.getSemestral()[i].getDiciembre() + "<br/>");
    		 }
    	 }
    	 */
    	 
    	
    	 
    	
     
  %>
</body>
</html>