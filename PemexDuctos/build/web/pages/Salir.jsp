<%-- 
    Document   : Salir
    Created on : 13/08/2014, 09:03:36 PM
    Author     : jose_l
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="conect_mysql.mysql_op"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    HttpSession sesion = request.getSession();
   if(sesion.getAttribute("Usuario") == null)
   {
       response.sendRedirect("login.jsp");
   }else
   {
      mysql_op mysql = new mysql_op();
       Date date = new Date();
        SimpleDateFormat t = new SimpleDateFormat("yyyy-MM-dd ");
    Calendar cal = Calendar.getInstance();
       Date momento = new Date(sesion.getCreationTime()); //ingreso
       
       
       long res = date.getTime() - momento.getTime();
       long dif =  res/(60000); // minutis
       float minutos = (int) dif;
       
       Connection con = mysql.getConexion();
       Statement visit = con.createStatement();
       visit.executeUpdate("INSERT INTO visitas VALUES(null,'"+sesion.getAttribute("Usuario")+"','"+t.format(cal.getTime())+"',"+minutos+");");
       // eliminamos la cookie
        Cookie miCookie=new Cookie("usuario","");
        miCookie.setPath("/");
        miCookie.setMaxAge(0);
        response.addCookie(miCookie);
        
      //eliminamos la secion      
     sesion.invalidate();  // cierro la session
     
     response.sendRedirect("../index.jsp"); // regrso al index y como no tengo ya la session me manda al login.jsp
   }
%>
