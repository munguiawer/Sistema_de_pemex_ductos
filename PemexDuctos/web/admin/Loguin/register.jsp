<%-- 
    Document   : register
    Created on : 13/08/2014, 01:43:52 AM
    Author     : jose_l
--%>

<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="login.registrar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    if (session.getAttribute("Rol").equals(1) || session.getAttribute("Rol").equals(3)) {
   String usr = request.getParameter("userid").toString(); 
   String pass= request.getParameter("password").toString();
   String pass2 = request.getParameter("password2").toString();
   String error=null;
   registrar rg = null; 
   
   if(!usr.equals("") && !pass.equals("") && !pass2.equals(""))
   {
       if(pass.equals(pass2))
       {
         String ps =  DigestUtils.md5Hex( pass );
           rg = new registrar(usr,ps);
            if(rg.getError() != 1062)
           {
              
            response.sendRedirect("../../index.jsp");
               
           }else {
             out.println("Ese nombre de usuario ya esta en uso");
            }
       }else {
           if(rg.getError() != 1062){
            out.println("Las Contraseñas no coinciden");
           }else{
                  out.println("Las Contraseñas no coinciden");
           }
          
       }
   }else{
      out.println("algunos valores estan vacios");
   }
    }else{
      out.println("<h1>Entre como Administrador</h1>");
    }
%> 
