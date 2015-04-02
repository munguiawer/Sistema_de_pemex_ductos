<%-- 
    Document   : ingreso
    Created on : 13/08/2014, 01:44:07 AM
    Author     : jose_l
--%>

<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="login.login"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   HttpSession sesion = request.getSession();
   String usr = request.getParameter("usr").toString(); 
   String pass= request.getParameter("pass").toString();
    
    String ps =  DigestUtils.md5Hex( pass );
    login ing = new login(usr,ps); 
    if(ing.getNombre() == null)
    {
        response.sendRedirect("login.jsp");
    }else{
   
   sesion.setAttribute("Usuario", ing.getNombre());
   sesion.setAttribute("Rol", ing.getIdRol());
   sesion.setAttribute("Tipo", ing.getRol());
   
  //response.sendRedirect("pages/tables/ordenesMixtas_1.jsp");
   
    Cookie miCookie=new Cookie("usuario",session.getAttribute("Usuario").toString());
        miCookie.setPath("/");
        miCookie.setMaxAge(-1);
        response.addCookie(miCookie);
  response.sendRedirect("../tblMixtas/index.jsp");
   
    }
%>
<%= ing.getNombre() %>
<br>
<%= ing.getRol() %>
