<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@page import="implementacion.Errores" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<f:view>
<% Errores er = new Errores(); %> 
<% int cont =0,cont2=0,cont3=0; %>

<table id="example" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Responsable</th>
                <th>Grupo</th>
                <th>Incumplimiento</th>
                <th>Costo 0</th>
                <th>Costo >20%</th>
                <th>Sin texto de operacion</th>
                <th>Otro</th>
            </tr>            
        </thead>
         <tbody>
         <% while(cont < er.getClasErrGrup().size()){ %>
           <tr>
            <th><%= er.getClasErrGrup().get(cont).getResponsable() %></th>
            <th><%= er.getClasErrGrup().get(cont).getOrden() %></th>
           </tr>
           <%cont++;} %>
         </tbody>
        </table>
</f:view>
</body>
</html>