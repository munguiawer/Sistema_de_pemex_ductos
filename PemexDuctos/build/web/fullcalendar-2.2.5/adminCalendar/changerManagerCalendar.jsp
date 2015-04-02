<%-- 
    Document   : changerManagerCalendar
    Created on : 15/07/2014, 08:30:03 PM
    Author     : jose
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="conect_mysql.mysql_op"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    SimpleDateFormat nor =new SimpleDateFormat("yyyy-MM-dd");
    String orden = request.getParameter("orden").toString();
    String inicio = request.getParameter("inicio").toString();
    Date  fecInic = new Date(inicio);
    Long mod = fecInic.getTime()+100000000;
    fecInic.setTime(mod);
    String fin= request.getParameter("fin").toString();
    Date fecFin = new Date(fin);
    String linea = orden.trim(); 
    String sLinea[]; 
    sLinea = linea.split(" "); 
    String g = sLinea[0];
    
    java.sql.Date sqlinc = new java.sql.Date(mod);
    java.sql.Date sqlfin = new java.sql.Date(fecFin.getTime());
    mysql_op m = new mysql_op();
    out.println(g);
    
    Connection con = m.getConexion();
    try{
        String sql = "update pemexqbs.proyectos2  set Incextr=? , Finextr=? where Orden =?;";
        PreparedStatement st = con.prepareStatement(sql);
          st.setString(1,nor.format(fecInic));
           st.setString(2, nor.format(fecFin));
           st.setString(3,g);
           st.executeUpdate();
           
        out.print("exito");
    }catch(Exception e){
    out.println(e.toString());
    }
      con.close();      
%>
