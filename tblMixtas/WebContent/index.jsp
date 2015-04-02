<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="logica.TablaMixta"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="tblMixtas.*" %>
<%@ page import="Modelo.*" %>
<%@ page import="variable.*" %>
<%@ page import="java.util.*" %>
<%
    TablaMixta tbl = new TablaMixta();
    int con = 0; // operaciones
    int con2 = 0; // mantenimiento
    int con3 = 0; //sipa
    int con4 = 0; //UAT
    int conErr = 0; // operaciones
    DecimalFormat df = new DecimalFormat("0.0");
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Document</title>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.4/css/jquery.dataTables.css" />
    <link rel="stylesheet" href="dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="pemex_dise/estilo.css">
	<link href="pemex_dise/style.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="pemex_dise/iconic.css" media="screen" rel="stylesheet" type="text/css" />
	<script src="pemex_dise/prefix-free.js"></script>
</head>
<body>


	<div class="content-box-blue"></div>
	<div class="container-fluid">
		<div class="row">
			<div id="header" class="col-md-12">
				<div class="col-md-8 col-md-offset-2" id="logo">
					<div id="lo">
						<img src="pemex_dise/logo1.png">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div align="center">
					<div class="wrap">

						<nav>
							<ul class="menu">
								<li><a href="http://colaboraciondesa/pgpb/sd-sdmin/SitePages/Inicio.aspx"><span class="iconic home"></span>
										Inicio</a></li>
								<li><a href="#"><span class="iconic plus-alt"></span>Planeación
										SAP </a>
									<ul>

										<li><a id="irMixtos" href="#">Status Ordenes</a></li>
										<li><a href="../../../Grafica_de_mixtos/">Grafica</a></li>
										<li><a
											href="../../../PemexDuctos/fullcalendar-2.2.5/demos/agenda-views.html">Original</a></li>
										<li><a
											href="../../../PemexDuctos/fullcalendar-2.2.5/demos/agenda-views_1.html">Planeacion</a></li>
											<li><a href="../../../PemexDuctos/fullcalendar-2.2.5/adminCalendar/agenda-views.html">Editar</a></li>
									</ul></li>
								<li><a href="#"><span class="iconic magnifying-glass"></span>
										Confiabilidad operacional</a>
									<ul>
                                          <li><a href="https://onedrive.live.com/view.aspx?resid=4401D0A477C4B47B!2797&ithint=file%2cxlsx&app=Excel&authkey=!AKvKW8exsnUXl6I">TCO Indicadores</a></li>
										<li><a href="../../../PemexDuctos/pages/confiabilidad.jsp">Confiabilidad</a></li>
									</ul></li>
								<li><a href="#"><span class="iconic map-pin"></span>
										Admin de los procesos</a>
									<ul>
										<li><a href="../../../PemexSASP-/">SASP</a></li>


									</ul></li>
								<li><a href="#"><span class="iconic mail"></span> PSV
										Calibracion</a>
									<ul>
										<li><a href="../../../ValvulasAct/ERMs.xhtml">ERM´S</a></li>
										<li><a href="../../../ValvulasAct/Chinameca.xhtml">Chinameca</a></li>
									</ul></li>
									<li><a href="#"><span class="iconic mail"></span> Administrador</a>
									<ul>
										<li><a href="../../../Personal/index.xhtml">Usuarios</a></li>
									</ul></li>
									
									<li><a href="#"><span class="iconic map-pin"></span> Cuenta</a>
									<ul>
										<li><a href="../../../PemexDuctos/pages/Salir.jsp">Salir</a></li>
									</ul></li>
							</ul>
							<div class="clearfix"></div>
						</nav>
					</div>

				</div>

			</div>

			<div class="col-md-2"></div>

		</div>

		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div align="center" id="carru">
					<!-- Carousel
    ================================================== -->
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<!--<li data-target="#myCarousel" data-slide-to="1"></li>-->
							<!--<li data-target="#myCarousel" data-slide-to="2"></li>-->
						</ol>
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img src="pemex_dise/img1.jpg" alt="First slide">
								<div class="container">
									<div class="carousel-caption">

										<p style="color:white; font-size: 20px;">Una de las verdaderas pruebas del liderazgo,es la
											habilidad de reconocer un problema antes de que se convierta
											en una emergencia</p>
										<p>
											<br/>
												<button type="button" class="btn btn-lg btn-primary" id="irMixto" >
												 <span class="glyphicon glyphicon-arrow-down"></span> ordenes
												</button>
										</p>
									</div>
								</div>
							</div>
							<!--<div class="item">
          <img src="../../pemex_dise/img2.jpg" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
            </div>
          </div>
        </div>-->
							<!-- <div class="item">
          <img src="../../pemex_dise/img3.jpg" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>One more for good measure.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
            </div>
          </div>
        </div>-->
						</div>
						<a class="left carousel-control" href="#myCarousel" role="button"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							role="button" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
					<!-- /.carousel -->
				</div>
			</div>


		</div>
	



	<div class="row">
		<div style="padding-top: 18px" class=" col-md-8 col-md-offset-2">
			<button type="button"
				onclick="tableToExcel('ordeneshoy', 'W3C Example Table')"
				class="btn btn-success btn-lg">
				<span class="glyphicon  glyphicon-floppy-disk"></span> Copiar a
				excel
			</button>
			
			
		</div>
	</div>
	<br/>
	

	<div class="row">
		
			<div class="row">


				<div id="ordeneshoy" class="panel panel panel-primary col-md-8  col-md-offset-2  ">


					<!-- Default panel contents -->
					<div class="panel-heading">
					<%
					GuardarVariable gb = new GuardarVariable();
					List<Responsables_variable> lista = new ArrayList<Responsables_variable>();
					Responsables_variable res[] =  new Responsables_variable [80];
					    int cont=0,cont2=0,cont3=0,cont4=0;%>
					<%  SimpleDateFormat formateador = new SimpleDateFormat("dd 'de' MMMM 'del' yyyy  HH:mm:ss", new Locale("es","MX")); %>
						<h3>Actualizada al: &nbsp; <%= formateador.format(tbl.getListHora().get(0).getHora()) %></h3>
					</div>
					<div class="panel-body">

						<!-- Mixtas tablas -->
						<table id="mixtas" class="table  col-md-8  col-md-offset-2">
							<thead>
								<tr>

									<th>Responsable</th>
									<th>ABIE/LIB</th>
									<th>CTEC</th>
									<th>SUBTOTAL</th>
									<th>CERR</th>
									<th>SUBTOTAL<br/>+CERR</th>
									<th>AVANCE</th>
									<th>EN EJECUCION</th>
									<th>TOTAL</th>
									<th><a id="irError" class="btn btn-danger " href="#error">Errores</a></th>

								</tr>
							</thead>
							<tbody>
								<!-- OPERACION  -->
							 <%
							 
							    int ablib = 0;
							    int cet= 0;
							    int subto = 0;
							    int cerr = 0;
							    float ttl1 = 0;
							    int ejec = 0;
							    int ttl = 0;
							    int err= 0;
							  
							 %>	
							 <%  for(Area a:tbl.getListArea() ) {  %>
							 <%  if(a.getArea().endsWith("OPERACION")){ %>
							 
							 <%
							
							 
							  int subtotal = tbl.cetec(a.getId())+
							                 tbl.AbierLib(a.getId());
							 
							  int  total = subtotal+
								           tbl.cerradas(a.getId());
							  
							  int totalFinal = total+ tbl.execu(a.getId());
							  
							 float x = new Float(total);
							 float y = new Float(tbl.cerradas(a.getId()));
							 float total1 = y / x * 100; //avance
							 //modif
						
							 res[cont] = new Responsables_variable();
							 res[cont].setResponsable(a.getId());
							 res[cont].setValor(total1);
							 
							 lista.add(res[cont]);
							 
							 // pie de tabla
							  ablib += tbl.AbierLib(a.getId());
							  cet += tbl.cetec(a.getId());
							  subto += tbl.AbierLib(a.getId())
								       + tbl.cetec(a.getId());
							   cerr += tbl.cerradas(a.getId());
							   ttl1 += total1;
							   ejec += tbl.execu(a.getId());
							   ttl += total;
							   err += tbl.errores(a.getId());
							 
							 
							 
							 %>
							 <tr>
							     <td><%= a.getId() %></td>
							     <td><%= tbl.AbierLib(a.getId()) %></td>
							     <td><%= tbl.cetec(a.getId()) %></td>
							     <td><%= subtotal%></td>
							     <td><%= tbl.cerradas(a.getId()) %></td>
							     <td><%= total %></td>
							     <% if(total1>=90){ %>
							     <td class="bien"><%= df.format(total1)+"%" %></td>
							     <%} %>
							     <% if(total1>=60 && total1<90){ %>
							     <td class="regular"><%= df.format(total1)+"%" %></td> 
							     <%} %>
							     <% if(total1>=0 && total1 <60 ){ %>
							     <td class="mal" style="color: white; "><%= df.format(total1)+"%" %></td>
							     <%}%>
								
							     						     
							     <td><%= tbl.execu(a.getId()) %></td>
							     <td><%= totalFinal %></td>
							     <td><%= tbl.errores(a.getId()) %></td>
							     
							 </tr>
							 <%cont++;} %>
							 <%} %>
							 
							 <td class="pie"><%out.println("OPERACION");%></td>
								<td class="pie"><%=ablib%></td>
								<td class="pie"><%=cet%></td>
								<td class="pie"><%=subto%></td>
								<td class="pie"><%=cerr%></td>
								<td class="pie"><%=ttl%></td>
								<!-- se divide entre 6 por que esos son los encardados de sipa al dia de hoy -->
								<% if((ttl1 / 6)>=90){ %>
								<td class="bien"><%=df.format(ttl1 / 6)+"%"%></td>
								<%} %>
								<% if((ttl1 / 6)>=60 && (ttl1 / 6)<90){ %>
								<td class="regular"><%=df.format(ttl1 / 6)+"%"%></td>
								<%} %>
								<% if((ttl1 / 6)>=0 && (ttl1 / 6)< 60 ){ %>
								<td class="mal" style="color: white;" ><%=df.format(ttl1 / 6)+"%"%></td>
								<%}%>
								
								<td class="pie"><%=ejec%></td>
								<td class="pie"><%=ttl%></td>
								<td class="pie"><%=err%></td>
								
							<!-- mantenimiento -->	
							 <%
							 
							    int ablib2 = 0;
							    int cet2= 0;
							    int subto2 = 0;
							    int cerr2 = 0;
							    float ttl12 = 0;
							    int ejec2 = 0;
							    int ttl2 = 0;
							    int err2= 0;
							  
							 %>	
							 <%  for(Area a:tbl.getListArea() ) {  %>
							 <%  if(a.getArea().endsWith("MANTENIMIENTO")){ %>
							 
							 <%
							  
							  int subtotal = tbl.cetec(a.getId())+
							                 tbl.AbierLib(a.getId());
							 
							  int  total = subtotal+
								           tbl.cerradas(a.getId());
							  int totalFinal = total+ tbl.execu(a.getId());
							  
							 float x = new Float(total);
							 float y = new Float(tbl.cerradas(a.getId()));
							 float total1 = y / x * 100; //avance
							 
							//modif
								
							 res[cont2] = new Responsables_variable();
							 res[cont2].setResponsable(a.getId());
							 res[cont2].setValor(total1);
							 
							 lista.add(res[cont2]);
							 
							 // pie de tabla
							  ablib2 += tbl.AbierLib(a.getId());
							  cet2 += tbl.cetec(a.getId());
							  subto2 += tbl.AbierLib(a.getId())
								       + tbl.cetec(a.getId());
							   cerr2 += tbl.cerradas(a.getId());
							   ttl12 += total1;
							   ejec2 += tbl.execu(a.getId());
							   ttl2 += total;
							   err2 += tbl.errores(a.getId());
							 
							 
							 
							 %>
							 <tr>
							     <td><%= a.getId() %></td>
							     <td><%= tbl.AbierLib(a.getId()) %></td>
							     <td><%= tbl.cetec(a.getId()) %></td>
							     <td><%= subtotal%></td>
							     <td><%= tbl.cerradas(a.getId()) %></td>
							     <td><%= total %></td>
							     <% if(total1>=90){ %>
							     <td class="bien"><%= df.format(total1)+"%" %></td>
							     <%} %>
							     <% if(total1>=60 && total1<90){ %>
							     <td class="regular"><%= df.format(total1)+"%" %></td> 
							     <%} %>
							     <% if(total1>=0 && total1 <60 ){ %>
							     <td class="mal" style="color: white;"><%= df.format(total1)+"%" %></td>
							    <%}%>
								
							     						     
							     <td><%= tbl.execu(a.getId()) %></td>
							     <td><%= totalFinal %></td>
							     <td><%= tbl.errores(a.getId()) %></td>
							     
							 </tr>
							 <%cont2++;} %>
							 <%} %>
							 <td class="pie"><%out.println("MANTENIMIENTO");%></td>
								<td class="pie"><%=ablib2%></td>
								<td class="pie"><%=cet2%></td>
								<td class="pie"><%=subto2%></td>
								<td class="pie"><%=cerr2%></td>
								<td class="pie"><%=ttl2%></td>
								<!-- se divide entre 5 por que esos son los encardados de mantenimiento al dia de hoy -->
								<% if((ttl12 / 5)>=90){ %>
								<td class="bien"><%=df.format(ttl12 / 5)+"%"%></td>
								<%} %>
								<% if((ttl12 / 5)>=60 && (ttl12 / 5)<90){ %>
								<td class="regular"><%=df.format(ttl12 / 5)+"%"%></td>
								<%} %>
								<% if((ttl12 / 5)>=0 && (ttl12 / 5)<60 ){ %>
								<td class="mal" style="color: white;"><%=df.format(ttl12 / 5)+"%"%></td>
								<%}%>
								
								<td class="pie"><%=ejec2%></td>
								<td class="pie"><%=ttl2%></td>
								<td class="pie"><%=err2%></td>
							
                     <!-- sipa -->
                               <%
							 
							    int ablib3 = 0;
							    int cet3= 0;
							    int subto3 = 0;
							    int cerr3 = 0;
							    float ttl13 = 0;
							    int ejec3 = 0;
							    int ttl3 = 0;
							    int err3= 0;
							  
							 %>	
							 <%  for(Area a:tbl.getListArea() ) {  %>
							 <%  if(a.getArea().endsWith("SEGURIDAD")){ %>
							 
							 <%
							  
							  int subtotal = tbl.cetec(a.getId())+
							                 tbl.AbierLib(a.getId());
							 
							  int  total = subtotal+
								           tbl.cerradas(a.getId());
							  
							  int totalFinal = total+ tbl.execu(a.getId());
							 
							 float x = new Float(total);
							 float y = new Float(tbl.cerradas(a.getId()));
							 float total1 = y / x * 100; //avance
							 
							//modif
								
							 res[cont3] = new Responsables_variable();
							 res[cont3].setResponsable(a.getId());
							 res[cont3].setValor(total1);
							 
							 lista.add(res[cont3]);
							 
							 // pie de tabla
							  ablib3 += tbl.AbierLib(a.getId());
							  cet3 += tbl.cetec(a.getId());
							  subto3 += tbl.AbierLib(a.getId())
								       + tbl.cetec(a.getId());
							   cerr3 += tbl.cerradas(a.getId());
							   ttl13 += total1;
							   ejec3 += tbl.execu(a.getId());
							   ttl3 += total;
							   err3 += tbl.errores(a.getId());
							 
							 
							 
							 %>
							 <tr>
							     <td><%= a.getId() %></td>
							     <td><%= tbl.AbierLib(a.getId()) %></td>
							     <td><%= tbl.cetec(a.getId()) %></td>
							     <td><%= subtotal%></td>
							     <td><%= tbl.cerradas(a.getId()) %></td>
							     <td><%= total %></td>
							     <% if(total1>=90){ %>
							     <td class="bien"><%= df.format(total1)+"%" %></td>
							     <%} %>
							     <% if(total1>=60 && total1<90){ %>
							     <td class="regular"><%= df.format(total1)+"%" %></td> 
							     <%} %>
							     <% if(total1>=0 && total1 <60 ){ %>
							     <td class="mal" style="color: white;"><%= df.format(total1)+"%" %></td>
							     <%}%>
								
							     						     
							     <td><%= tbl.execu(a.getId()) %></td>
							     <td><%= totalFinal %></td>
							     <td><%= tbl.errores(a.getId()) %></td>
							     
							 </tr>
							 <%cont3++;} %>
							 <%} %>
							 <td class="pie"><%out.println("SEGURIDAD");%></td>
								<td class="pie"><%=ablib3%></td>
								<td class="pie"><%=cet3%></td>
								<td class="pie"><%=subto3%></td>
								<td class="pie"><%=cerr3%></td>
								<td class="pie"><%=ttl3%></td>
								<!-- se divide entre 1 por que esos son los encardados de sipa al dia de hoy -->
								
								<% if((ttl13)>=90){ %>
								<td class="bien"><%=df.format(ttl13)+"%"%></td>
								<%} %>
								<% if((ttl13 )>=60 && (ttl13)<90){ %>
								<td class="regular"><%=df.format(ttl13 )+"%"%></td>
								<%} %>
								<% if((ttl13 )>=0 && (ttl13)<60 ){ %>
								<td class="mal" style="color: white;"><%=df.format(ttl13)+"%"%></td>
								<%}%>
								
								<td class="pie"><%=ejec3%></td>
								<td class="pie"><%=ttl3%></td>
								<td class="pie"><%=err3%></td>
								
								
                             <!-- UAT -->
                             
                                  <%
							 
							    int ablib4 = 0;
							    int cet4= 0;
							    int subto4 = 0;
							    int cerr4 = 0;
							    float ttl14 = 0;
							    int ejec4 = 0;
							    int ttl4 = 0;
							    int err4= 0;
							  
							 %>	
							 <%  for(Area a:tbl.getListArea() ) {  %>
							 <%  if(a.getArea().endsWith("UAT")){ %>
							 
							 <%
							  
							  int subtotal = tbl.cetec(a.getId())+
							                 tbl.AbierLib(a.getId());
							 
							  int  total = subtotal+
								           tbl.cerradas(a.getId());
							  int totalFinal = total+ tbl.execu(a.getId());
							 
							 float x = new Float(total);
							 float y = new Float(tbl.cerradas(a.getId()));
							 float total1 = y / x * 100; //avance
							//modif
								
							 res[cont4] = new Responsables_variable();
							 res[cont4].setResponsable(a.getId());
							 res[cont4].setValor(total1);
							 
							 lista.add(res[cont4]);
							 
							 // pie de tabla
							  ablib4 += tbl.AbierLib(a.getId());
							  cet4 += tbl.cetec(a.getId());
							  subto4 += tbl.AbierLib(a.getId())
								       + tbl.cetec(a.getId());
							   cerr4 += tbl.cerradas(a.getId());
							   ttl14 += total1;
							   ejec4 += tbl.execu(a.getId());
							   ttl4 += total;
							   err4 += tbl.errores(a.getId());
							 
							 
							 
							 %>
							 <tr>
							     <td><%= a.getId() %></td>
							     <td><%= tbl.AbierLib(a.getId()) %></td>
							     <td><%= tbl.cetec(a.getId()) %></td>
							     <td><%= subtotal%></td>
							     <td><%= tbl.cerradas(a.getId()) %></td>
							     <td><%= total %></td>
							     <% if(total1>=90){ %>
							     <td class="bien"><%= df.format(total1)+"%" %></td>
							     <%} %>
							     <% if(total1>=60 && total1<90){ %>
							     <td class="regular"><%= df.format(total1)+"%" %></td> 
							     <%} %>
							     <% if(total1>=0 && total1 <60 ){ %>
							     <td class="mal" style="color: white;"><%= df.format(total1)+"%" %></td>
							     <%}else{ %>
							     <td class="mal" style="color: white;"><%=0+"%"%></td>
							     <%} %>
							     						     
							     <td><%= tbl.execu(a.getId()) %></td>
							     <td><%= totalFinal %></td>
							     <td><%= tbl.errores(a.getId()) %></td>
							     
							 </tr>
							 <% cont4++;} %>
							 <%} %>
							 <% gb.guardar(lista); %>
							 <td class="pie"><%out.println("UAT");%></td>
								<td class="pie"><%=ablib4%></td>
								<td class="pie"><%=cet4%></td>
								<td class="pie"><%=subto4%></td>
								<td class="pie"><%=cerr4%></td>
								<td class="pie"><%=ttl4%></td>
								<!-- se divide entre 2 por que esos son los encardados de sipa al dia de hoy -->
								
								<% if((ttl14 / 2)>=90){ %>
								<td class="bien"><%=df.format(ttl14 / 2)+"%"%></td>
								<%} %>
								<% if((ttl14 / 2)>=60 && (ttl14 / 2)<90){ %>
								<td class="regular"><%=df.format(ttl14 / 2)+"%"%></td>
								<%} %>
								<% if((ttl14 / 2)>=0 && (ttl14 / 2)<60 ){ %>
								<td class="mal" style="color: white;"><%=df.format(ttl14 / 2)+"%"%></td>
								<%} else{%>
								<td class="mal" style="color: white;"><%=0+"%"%></td>
								<%} %>
								<td class="pie"><%=ejec4%></td>
								<td class="pie"><%=ttl4%></td>
								<td class="pie"><%=err4%></td>

							</tbody>
							<tfoot>
								<tr>
									<th colspan="7" style="text-align: right">Cumplimiento sector minatitlan:</th>
									<th></th>
								</tr>
							</tfoot>
						</table>


					</div>
				</div>
			</div>

			<!--Graficas  -->

			<div class="row">
			
			<!-- Operacion -->
			<div class="panel panel panel-success  col-md-offset-2  col-md-8 ">
				<div class="panel-heading">
					<h3>Operacion</h3>
				</div>
				<div  class="panel-body">
					<div id="canvas-operacion" align="center" style="width: 800px; height: 500px;">	
					</div>
					<br/>
					<div align="center">TOTAL : <%= ttl %> ORDENES</div>
					
				</div>

			</div>
			
			<!-- Mantenimiento -->
			<div class="panel panel panel-success col-md-offset-2 col-md-8  ">
				<div class="panel-heading">
					<h3>Mantenimiento</h3>
				</div>
				<div  class="panel-body">
					<div id="canvas-mantenimiento" style="width: 800px; height: 500px;" >
						
					</div>
					<br/>
					<div align="center">TOTAL : <%= ttl2 %> ORDENES</div>
					
				</div>

			</div>
			
			<!-- Sipa -->
			<div class="panel panel panel-success col-md-8 col-md-offset-2  ">
				<div class="panel-heading">
					<h3>Seguridad</h3>
				</div>
				<div  class="panel-body">
					<div id="canvas-sipa" style="width: 800px; height: 500px;">
						
					</div>
					<br/>
					<div align="center">TOTAL : <%= ttl3 %> ORDENES</div>
					
				</div>

			</div>
			
			<!-- UAT -->
			<div class="panel panel panel-success col-md-offset-2 col-md-8   ">
				<div class="panel-heading">
					<h3>UAT</h3>
				</div>
				<div  class="panel-body">
					<div id="canvas-uat" style="width: 800px; height: 500px;">
						
					</div>
					<br/>
					<div align="center">TOTAL : <%= ttl4 %> ORDENES</div>
					
				</div>

			</div>
			

			</div>


			<div class="row">
		
		<!-- panel error -->
		<div class="panel panel panel-danger col-md-8 col-md-offset-2  ">
		<!-- Default panel contents -->
		<div class="panel-heading">
			<h3>Errores</h3>
		</div>
		<div id="erros" class="panel-body">
		<!-- errores Tabla -->
	<table id="tblerror" class="table table-responsive  " >
		<thead>
			<tr>
				<th>Responsable</th>
				<th>Grupo planificador</th>
				<th>Costos 0</th>
				<th>Costos < 20%</th>
				<th>Falta texto en operacion</th>
				<th>incumplimiento</th>
			</tr>
		</thead>
		<tbody>
		<!-- Errores operacion -->
		 <%  for(Area a:tbl.getListArea() ) {  %>
		   <% if(a.getArea().endsWith("OPERACION")){ %>
			<tr>
				<td><%= a.getId() %></td>
				<td><%= tbl.errores_grupo(a.getId()) %></td>
				<td><%= tbl.error_costo(a.getId()) %></td>
				<td><%= tbl.error_20(a.getId()) %></td>
				<td><%= tbl.error_text(a.getId()) %></td>
				<td><%= tbl.error_incum(a.getId()) %></td>
			</tr>
			<% }; %>
			<% }; %>
		<td><%out.println("OPERACION"); %></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		
		<!-- Errores mantenimiento -->
		 <%  for(Area a:tbl.getListArea() ) {  %>
		   <% if(a.getArea().endsWith("MANTENIMIENTO")){ %>
			<tr>
				<td><%= a.getId() %></td>
				<td><%= tbl.errores_grupo(a.getId()) %></td>
				<td><%= tbl.error_costo(a.getId()) %></td>
				<td><%= tbl.error_20(a.getId()) %></td>
				<td><%= tbl.error_text(a.getId()) %></td>
				<td><%= tbl.error_incum(a.getId()) %></td>
			</tr>
			<% }; %>
			<% }; %>
		<td><%out.println("MANTENIMIENTO"); %></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		
		
		<!-- Errores sipa -->
		
		<%  for(Area a:tbl.getListArea() ) {  %>
		   <% if(a.getArea().endsWith("SEGURIDAD")){ %>
			<tr>
				<td><%= a.getId() %></td>
				<td><%= tbl.errores_grupo(a.getId()) %></td>
				<td><%= tbl.error_costo(a.getId()) %></td>
				<td><%= tbl.error_20(a.getId()) %></td>
				<td><%= tbl.error_text(a.getId()) %></td>
				<td><%= tbl.error_incum(a.getId()) %></td>
			</tr>
			<% }; %>
			<% }; %>
		<td><%out.println("SEGURIDAD"); %></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		
		<!-- Errores UAT -->
		
		<%  for(Area a:tbl.getListArea() ) {  %>
		   <% if(a.getArea().endsWith("UAT")){ %>
			<tr>
				<td><%= a.getId() %></td>
				<td><%= tbl.errores_grupo(a.getId()) %></td>
				<td><%= tbl.error_costo(a.getId()) %></td>
				<td><%= tbl.error_20(a.getId()) %></td>
				<td><%= tbl.error_text(a.getId()) %></td>
				<td><%= tbl.error_incum(a.getId()) %></td>
			</tr>
			<% }; %>
			<% }; %>
		<td><%out.println("UAT"); %></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		
		</tbody>
	</table>
		</div>
	</div>
		</div>
		
		
		
		
	</div>

</div>
	<div class="loader"></div>



	


	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="dist/js/bootstrap.min.js"></script>
	<script src="//cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
	<script src="Chart.js-master/Chart.min.js" type="text/javascript"></script>
	<script type="text/javascript">

	$(window).load(function() {
		$(".loader").fadeOut("slow");
	})
	
	$(document).ready(function() {
		
		$('#mixtas').DataTable({"paging":   false,"ordering": false,"info":     false,
			 "footerCallback": function ( row, data, start, end, display ) {
		            var api = this.api(), data;
		 
		            // Remove the formatting to get integer data for summation
		            var intVal = function ( i ) {
		                return typeof i === 'string' ?
		                    i.replace(/[\$,]/g, '')*1 :
		                    typeof i === 'number' ?
		                        i : 0;
		            };


		            // Total over all pages
		            SUBTOTAL_CERR = api
		                .column( 5 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                } );

		            ERROR = api
	                .column( 9 )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                } );

		            CERRADO = api
	                .column( 4 )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                } );

		            Total = (((CERRADO/2)-(ERROR/2))/(SUBTOTAL_CERR/2))*100;

                    if(Total>=90){
                    	color = "bien";
                        }
                    if(Total>=60 && Total<90)
                        {
                          color="regular";
                        }
                    if(Total>=0 && Total <60)
                        {
                        color = "mal";
                        }else{
                           color="mal";
                            }
		            
		 
		            // Update footer
		            $( api.column( 7 ).footer() ).html(

		            		'<div  class="'+color+'">'+Total.toFixed(2)+'%'+'</div>'
		            );

			 }

			});

		
		$('#tblerror').DataTable({"paging":   false,"ordering": false,"info":     false});
		
		$("#irError").click(function() {
				//alert("hello");   
				$("html, body").animate({
					scrollTop : $("#erros").offset().top
				}, 1000);
				// $("#erros").animatedScroll({easing: "easeOutExpo"});
			});

			$("#irMixtos").click(function() {
				//alert("hello");   
				$("html, body").animate({
					scrollTop : $("#ordeneshoy").offset().top
				}, 1000);
				// $("#erros").animatedScroll({easing: "easeOutExpo"});
			});
			$("#irMixto").click(function() {
				//alert("hello");   
				$("html, body").animate({
					scrollTop : $("#ordeneshoy").offset().top
				}, 1000);
				// $("#erros").animatedScroll({easing: "easeOutExpo"});
			});
		});

	
	
	</script>
	
	<!-- descargar a excel-->
	<script>
                var tableToExcel = (function() {                 var uri = 'data:application/vnd.ms-excel;base64,'
                                , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
                   , base64 = function(s) {
      return window.btoa(unescape(encodeURIComponent(s)))
                }
        , format = function(s, c) {
            return s.replace(/{(\w+)}/g, function(m, p) {
                return c[p];
            })
        }
        return function(table, name) {
            if (!table.nodeType)
                table = document.getElementById(table)
            var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
            window.location.href = uri + base64(format(template, ctx))
        }
    })()
</script>


	<!-- Chart Mantenimiento -->
	
	<script>

		var doughnutData2 = [
				{
					value: <%= ablib2 %>,
					color:"#F7464A",
					highlight: "#FF5A5E",
					label: "ABIE/LIB"
				},
				
				{
					value: <%= cet2 %>,
					color: "#FDB45C",
					highlight: "#FFC870",
					label: "CETEC"
				},
				{
					value: <%= ejec2 %>,
					color: "orange",
					highlight: "orange",
					label: "EJEC"
				},
				{
					value: <%= cerr2 %>,
					color: "green",
					highlight: "#A8B3C5",
					label: "CERR"
				}
				
			];

			
				var ctx2 = document.getElementById("mantenimiento-chart").getContext("2d");
				window.myDoughnut = new Chart(ctx2).Doughnut(doughnutData2, {responsive : true});
			



	</script>
	<!-- Chart sipa -->
	
	<script>

		var doughnutData3 = [
				{
					value: <%= ablib3 %>,
					color:"#F7464A",
					highlight: "#FF5A5E",
					label: "ABIE/LIB"
				},
				
				{
					value: <%= cet3 %>,
					color: "#FDB45C",
					highlight: "#FFC870",
					label: "CETEC"
				},
				{
					value: <%= ejec3 %>,
					color: "orange",
					highlight: "orange",
					label: "EJEC"
				},
				{
					value: <%= cerr3 %>,
					color: "green",
					highlight: "#A8B3C5",
					label: "CERR"
				}
				
			];

				var ctx3 = document.getElementById("sipa-chart").getContext("2d");
				window.myDoughnut = new Chart(ctx3).Doughnut(doughnutData3, {responsive : true});
			



	</script>
	
	<!-- Chart UAT -->
	
	<script>

		var doughnutData4 = [
				{
					value: <%= ablib4 %>,
					color:"#F7464A",
					highlight: "#FF5A5E",
					label: "ABIE/LIB"
				},
				
				{
					value: <%= cet4 %>,
					color: "#FDB45C",
					highlight: "#FFC870",
					label: "CETEC"
				},
				{
					value: <%= ejec4 %>,
					color: "orange",
					highlight: "orange",
					label: "EJEC"
				},
				{
					value: <%= cerr4 %>,
					color: "green",
					highlight: "#A8B3C5",
					label: "CERR"
				}
				
			];

			
				var ctx4 = document.getElementById("uat-chart").getContext("2d");
				window.myDoughnut = new Chart(ctx4).Doughnut(doughnutData4, {responsive : true});
			



	</script>
	<!-- chart operacion -->
	<script type="text/javascript">

      // Load the Visualization API and the piechart package.
      google.load('visualization', '1.0', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.setOnLoadCallback(drawChart);
      google.setOnLoadCallback(drawChart2);
      google.setOnLoadCallback(drawChart3);
      google.setOnLoadCallback(drawChart4);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['ABIE/LIB', <%= ablib %>],
          ['CETEC', <%= cet %>],
          ['EJEC', <%= ejec %>],
          ['CERR', <%= cerr %>]
         
        ]);

        // Set chart options
        var options = {'title':'Operacion',
        		       // sliceVisibilityThreshold:0,
        		        legend: {
        		            position: 'labeled'
        		        },
                       colors: ['#FF0000', '#FFC870', '#FF6A37', 'green']};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('canvas-operacion'));
        chart.draw(data, options);
      }

      function drawChart2() {

          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Topping');
          data.addColumn('number', 'Slices');
          data.addRows([
            ['ABIE/LIB', <%= ablib2 %>],
            ['CETEC', <%= cet2 %>],
            ['EJEC', <%= ejec2 %>],
            ['CERR', <%= cerr2 %>]
           
          ]);

          // Set chart options
           var options = {'title':'Operacion',
        		        //sliceVisibilityThreshold:0,
        		        legend: {
        		            position: 'labeled'
        		        },
                       colors: ['#FF0000', '#FDB45C', '#FF6A37', 'green']};

          // Instantiate and draw our chart, passing in some options.
          var chart = new google.visualization.PieChart(document.getElementById('canvas-mantenimiento'));
          chart.draw(data, options);
        }
      
      function drawChart3() {

          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Topping');
          data.addColumn('number', 'Slices');
          data.addRows([
            ['ABIE/LIB', <%= ablib3 %>],
            ['CETEC', <%= cet3 %>],
            ['EJEC', <%= ejec3 %>],
            ['CERR', <%= cerr3 %>]
           
          ]);

          // Set chart options
          var options = {'title':'Operacion',
        		        //sliceVisibilityThreshold:0,
        		        legend: {
        		            position: 'labeled'
        		        },
                       colors: ['#FF0000', '#FDB45C', '#FF6A37', 'green']};

          // Instantiate and draw our chart, passing in some options.
          var chart = new google.visualization.PieChart(document.getElementById('canvas-sipa'));
          chart.draw(data, options);
        }
      
      function drawChart4() {

          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Topping');
          data.addColumn('number', 'Slices');
          data.addRows([
            ['ABIE/LIB', <%= ablib4 %>],
            ['CETEC', <%= cet4 %>],
            ['EJEC', <%= ejec4 %>],
            ['CERR', <%= cerr4 %>]
           
          ]);

          var options = {'title':'Operacion',
  		       // sliceVisibilityThreshold:0,
  		      legend: {
		            position: 'labeled'
		        },
                 colors: ['#FF0000', '#FDB45C', '#FF6A37', 'green']};

          // Instantiate and draw our chart, passing in some options.
          var chart = new google.visualization.PieChart(document.getElementById('canvas-uat'));
          chart.draw(data, options);
        }
    </script>
    
    
   
	<style type="text/css">
.pie {
	color: white; background : rgba( 73, 155, 234, 1);
	background: -moz-linear-gradient(top, rgba(73, 155, 234, 1) 0%,
		rgba(32, 124, 229, 1) 100%);
	background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(73, 155, 234
		, 1)), color-stop(100%, rgba(32, 124, 229, 1)));
	background: -webkit-linear-gradient(top, rgba(73, 155, 234, 1) 0%,
		rgba(32, 124, 229, 1) 100%);
	background: -o-linear-gradient(top, rgba(73, 155, 234, 1) 0%,
		rgba(32, 124, 229, 1) 100%);
	background: -ms-linear-gradient(top, rgba(73, 155, 234, 1) 0%,
		rgba(32, 124, 229, 1) 100%);
	background: linear-gradient(to bottom, rgba(73, 155, 234, 1) 0%,
		rgba(32, 124, 229, 1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#499bea',
		endColorstr='#207ce5', GradientType=0);
	background: rgba(73, 155, 234, 1);
}

.mal{
color: white;
background: rgba(248,80,50,1);
background: -moz-linear-gradient(top, rgba(248,80,50,1) 0%, rgba(241,111,92,1) 49%, rgba(240,47,23,1) 82%, rgba(246,41,12,1) 92%, rgba(231,56,39,1) 100%);
background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(248,80,50,1)), color-stop(49%, rgba(241,111,92,1)), color-stop(82%, rgba(240,47,23,1)), color-stop(92%, rgba(246,41,12,1)), color-stop(100%, rgba(231,56,39,1)));
background: -webkit-linear-gradient(top, rgba(248,80,50,1) 0%, rgba(241,111,92,1) 49%, rgba(240,47,23,1) 82%, rgba(246,41,12,1) 92%, rgba(231,56,39,1) 100%);
background: -o-linear-gradient(top, rgba(248,80,50,1) 0%, rgba(241,111,92,1) 49%, rgba(240,47,23,1) 82%, rgba(246,41,12,1) 92%, rgba(231,56,39,1) 100%);
background: -ms-linear-gradient(top, rgba(248,80,50,1) 0%, rgba(241,111,92,1) 49%, rgba(240,47,23,1) 82%, rgba(246,41,12,1) 92%, rgba(231,56,39,1) 100%);
background: linear-gradient(to bottom, rgba(248,80,50,1) 0%, rgba(241,111,92,1) 49%, rgba(240,47,23,1) 82%, rgba(246,41,12,1) 92%, rgba(231,56,39,1) 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f85032', endColorstr='#e73827', GradientType=0 );
}
.regular{
color: black;
background: rgba(252,234,187,1);
background: -moz-linear-gradient(top, rgba(252,234,187,1) 0%, rgba(252,205,77,1) 68%, rgba(248,181,0,1) 89%, rgba(251,223,147,1) 100%);
background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(252,234,187,1)), color-stop(68%, rgba(252,205,77,1)), color-stop(89%, rgba(248,181,0,1)), color-stop(100%, rgba(251,223,147,1)));
background: -webkit-linear-gradient(top, rgba(252,234,187,1) 0%, rgba(252,205,77,1) 68%, rgba(248,181,0,1) 89%, rgba(251,223,147,1) 100%);
background: -o-linear-gradient(top, rgba(252,234,187,1) 0%, rgba(252,205,77,1) 68%, rgba(248,181,0,1) 89%, rgba(251,223,147,1) 100%);
background: -ms-linear-gradient(top, rgba(252,234,187,1) 0%, rgba(252,205,77,1) 68%, rgba(248,181,0,1) 89%, rgba(251,223,147,1) 100%);
background: linear-gradient(to bottom, rgba(252,234,187,1) 0%, rgba(252,205,77,1) 68%, rgba(248,181,0,1) 89%, rgba(251,223,147,1) 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fceabb', endColorstr='#fbdf93', GradientType=0 );
}
.bien{
color: black;
background: rgba(210,255,82,1);
background: -moz-linear-gradient(top, rgba(210,255,82,1) 0%, rgba(145,232,66,1) 100%);
background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(210,255,82,1)), color-stop(100%, rgba(145,232,66,1)));
background: -webkit-linear-gradient(top, rgba(210,255,82,1) 0%, rgba(145,232,66,1) 100%);
background: -o-linear-gradient(top, rgba(210,255,82,1) 0%, rgba(145,232,66,1) 100%);
background: -ms-linear-gradient(top, rgba(210,255,82,1) 0%, rgba(145,232,66,1) 100%);
background: linear-gradient(to bottom, rgba(210,255,82,1) 0%, rgba(145,232,66,1) 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d2ff52', endColorstr='#91e842', GradientType=0 );
}

#canvas-operacion{
				width:100%;
			}
</style>

</body>
</html>