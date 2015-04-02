<%-- 
    Document   : TablaDatos
    Created on : 26/07/2014, 07:24:08 PM
    Author     : jose
--%>

<%@page import="mixtas.statusmixtas"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="tablas.Finalizadas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat t = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
    DateTime hoy = new DateTime();
    String FECHA_HOY = f.format(hoy.toDate()).toString();

    statusmixtas SCOR00 = new statusmixtas("SCOR00", FECHA_HOY);
    statusmixtas SCOR02 = new statusmixtas("SCOR00", FECHA_HOY);
    statusmixtas SCOR03 = new statusmixtas("SCOR00", FECHA_HOY);
    statusmixtas SCOR04 = new statusmixtas("SCOR00", FECHA_HOY);
    String FECHA_TITULO = t.format(SCOR00.getHoraphoto()).toString();
    statusmixtas dtos = null, err = null;
    int OPsumAb = 0, OPsumctc = 0, OPsumSubt = 0, OPsumCerr = 0, OPsumEjec = 0, OPsumErr = 0;
    int MANsumAb = 0, MANsumctc = 0, MANsumSubt = 0, MANsumCerr = 0, MANsumEjec = 0, MANsumErr = 0;
    int SEGsumAb = 0, SEGsumctc = 0, SEGsumSubt = 0, SEGsumCerr = 0, SEGsumEjec = 0, SEGsumErr = 0;
    int UATsumAb = 0, UATsumctc = 0, UATsumSubt = 0, UATsumCerr = 0, UATsumEjec = 0, UATsumErr = 0;
    // Errores
    statusmixtas ERROR00 = new statusmixtas("SCOR00", FECHA_HOY);
    statusmixtas ERROR01 = new statusmixtas("SCOR00", FECHA_HOY);
    statusmixtas ERROR02 = new statusmixtas("SCOR00", FECHA_HOY);
    statusmixtas ERROR03 = new statusmixtas("SCOR00", FECHA_HOY);
    
    

%>



<html lang="es">
<head>
	<meta charset="UTF-8">
<a href="../../pemex_dise/index.html"></a>
	<title>Pemex|Ductos</title>
	<link rel="stylesheet" type="text/css" href="../../pemex_dise/dist/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="../../pemex_dise/estilo.css">
	<link href="../../pemex_dise/style.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="../../pemex_dise/iconic.css" media="screen" rel="stylesheet" type="text/css" />
	<script src="../../pemex_dise/prefix-free.js"></script>
        
        
</head>
<body>
	<div class="content-box-blue"></div>
	<div class="container-fluid">
		<div class="row">
			<div id="header" class="col-md-12">
				<div class="col-md-8 col-md-offset-2" id="logo" ><div  id="lo"><img src="../../pemex_dise/logo1.png"></div></div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8 col-md-offset-2" >
				<div align="center" >
					<div class="wrap">

						<nav>
							<ul class="menu">
								<li><a href="#"><span class="iconic home"></span> Inicio</a></li>
								<li><a href="#"><span class="iconic plus-alt"></span>Planeación sap </a>
									<ul>
                                                                           
										<li><a id="irMixtos" href="#">Mixto</a></li>
										<li><a href="../../fullcalendar-2.2.5/demos/agenda-views.html">Original</a></li>
										<li><a href="../../fullcalendar-2.2.5/demos/agenda-views_1.html">Planeacion</a></li>
									</ul>
								</li>
								<li><a href="#"><span class="iconic magnifying-glass"></span> Confiabilidad operacional</a>
									<ul>
                                                                           
										<li><a href="../confiabilidad.jsp">Confiabilidad</a></li>
									</ul>
								</li>
								<li><a href="#"><span class="iconic map-pin"></span> Admin de los procesos</a>
									<ul>
										<li><a href="../../../PemexSASP-/">SASP</a></li>
										
										
									</ul>
								</li>
								<li><a href="#"><span class="iconic mail"></span> PSV Calibracion</a>
									<ul>
										<li><a href="../../../Valvulas/ERMs.xhtml">ERM´S</a></li>
										<li><a href="../../../Valvulas/chinameca.xhtml">Chinameca</a></li>
									</ul>
								</li>
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
          <img src="../../pemex_dise/img1.jpg" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              
              <p>Una de las verdaderas pruebas del liderazgo,es la habilidad de reconocer un problema antes de que se convierta en una emergencia</p>
              <p><a class="btn btn-lg btn-primary" id="irMixto" href="#mixtos" role="button">Datos de ordenes</a></p>
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
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->
			</div>
		</div>
			

		</div>
            <div class="row">
                <div style="padding-top: 18px" class=" col-md-8 col-md-offset-2">
    <button type="button" onclick="tableToExcel('ordeneshoy', 'W3C Example Table')" class="btn btn-success btn-lg">
        <span class="glyphicon  glyphicon-floppy-disk"></span> Copiar a excel
    </button>
    
    <!-- <input type="button" onclick="tableToExcel('ordeneshoy', 'W3C Example Table')" value="Export to Excel"value=" Export Table data into Excel " />--->
    <%
        if (session.getAttribute("Rol").equals(1) || session.getAttribute("Rol").equals(3)) {
    %>
    <button  id="enviar_errores" class="btn btn-danger btn-lg">
        <span class="fa fa-minus-circle"></span> Enviar errores
    </button>
    <% }%>
</div>
            </div>
		<div  class="row">
                    <div style="padding-top: 18px" class="col-md-8 col-md-offset-2" id="contenido">
                        
                        <div class="row">
                 
    
<div id="ordeneshoy" class="panel panel panel-primary col-md-12  ">
               
    
    <!-- Default panel contents -->
    <div class="panel-heading"> <h3>Actualizada al: &nbsp; <%= FECHA_TITULO%></h3> </div>
    <div class="panel-body">
        <!-- Table -->
        <table id="customers"  class="table table-bordered" >


            <thead>
                <tr>

                    <th>Responsable</th>
                    <th>ABIE/LIB</th>
                    <th>CTEC</th>
                    <th>SUBTOTAL</th>
                    <th>CERR</th>
                    <th>EN EJECUCION</th>
                    <th>TOTAL</th>
                    <th><a id="irError" class="btn btn-danger " href="#error">Errores</a></th>

                </tr>
            </thead>

            <tbody>
                <!-- OPERACION SECCION -->
                <%while (SCOR00.getIdAreas().getResultSet().next()) { %>
                <% if (SCOR00.getIdAreas().getResultSet().getString("AREA").trim().equals("OPERACION")) {%>
                <tr>
                    <td><%= SCOR00.getIdAreas().getResultSet().getString("Id")%></td>
                    <% dtos = new statusmixtas(SCOR00.getIdAreas().getResultSet().getString("Id").toString(), FECHA_HOY);%>
                    <% err = new statusmixtas(SCOR00.getIdAreas().getResultSet().getString("Id").toString());%>
                    <td><%= dtos.getAbierto()%></td>
                    <% OPsumAb += dtos.getAbierto();%>
                    <td><%= dtos.getCTEC()%></td>
                    <% OPsumctc += dtos.getCTEC();%>
                    <td><%= dtos.getCTEC() + dtos.getAbierto()%></td>
                    <% OPsumSubt += dtos.getCTEC() + dtos.getAbierto();%>
                    <td><%= dtos.getCERRADO()%></td>
                    <% OPsumCerr += dtos.getCERRADO();%>
                    <td> <%= dtos.getENejec()%> </td> 
                    <% OPsumErr += err.getError().size();  %>
                    <% OPsumEjec += dtos.getENejec();%>
                    <td> <%= dtos.getENejec() + dtos.getCTEC() + dtos.getCERRADO() + dtos.getAbierto()%> </td> 
                    <td> <%= err.getError().size()%> </td> 
                </tr> 
                <%}%>
                <% }%>
            <td class="success"><h4>OPERACION</h4></td>
            <td class="success"><%= OPsumAb%></td>
            <td class="success"><%=OPsumctc%></td>
            <td class="success"><%= OPsumSubt%></td>
            <td class="success"><%= OPsumCerr%></td>
            <td class="success"><%= OPsumEjec%></td>
            <td class="success"><%= OPsumSubt + OPsumCerr + OPsumEjec%></td>
            <td class="success"><%= OPsumErr%></td>

            <!-- MANTENIMIENTO SECCION -->
            <%while (SCOR02.getIdAreas().getResultSet().next()) { %>

            <% if (SCOR02.getIdAreas().getResultSet().getString("AREA").trim().equals("MANTENIMIENTO")) {%>
            <tr>
                <td><%= SCOR02.getIdAreas().getResultSet().getString("Id")%></td>
                <% dtos = new statusmixtas(SCOR02.getIdAreas().getResultSet().getString("Id").toString(), FECHA_HOY);%>
                <% err = new statusmixtas(SCOR02.getIdAreas().getResultSet().getString("Id").toString());%>
                <td><%= dtos.getAbierto()%></td>
                <% MANsumAb += dtos.getAbierto();%>
                <td><%= dtos.getCTEC()%></td>
                <% MANsumctc += dtos.getCTEC();%>
                <td><%= dtos.getCTEC() + dtos.getAbierto()%></td>
                <% MANsumSubt += dtos.getCTEC() + dtos.getAbierto();%>
                <td><%= dtos.getCERRADO()%></td>
                <% MANsumCerr += dtos.getCERRADO();%>
                <td> <%= dtos.getENejec()%> </td>  

                <% MANsumErr += err.getError().size();  %>
                <% MANsumEjec += dtos.getENejec();%>
                <td> <%= dtos.getENejec() + dtos.getCTEC() + dtos.getCERRADO() + dtos.getAbierto()%> </td>
                <td> <%= err.getError().size()%> </td> 
            </tr>
            <%}%>
            </tr>
            <%}%>
            <td class="success"><h4>MANTENIMIENTO</h4></td>
            <td class="success"><%= MANsumAb%></td>
            <td class="success"><%=MANsumctc%></td>
            <td class="success"><%= MANsumSubt%></td>
            <td class="success"><%= MANsumCerr%></td>
            <td class="success"><%= MANsumEjec%></td>
            <td class="success"><%= MANsumSubt + MANsumCerr + MANsumEjec%></td>
            <td class="success"><%= MANsumErr%></td>

            <!-- SEGURIDAD SECCION -->
            <%while (SCOR03.getIdAreas().getResultSet().next()) { %>

            <% if (SCOR03.getIdAreas().getResultSet().getString("AREA").trim().equals("SEGURIDAD")) {%>
            <tr>
                <td><%= SCOR03.getIdAreas().getResultSet().getString("Id")%></td>
                <% dtos = new statusmixtas(SCOR03.getIdAreas().getResultSet().getString("Id").toString(), FECHA_HOY);%>
                <% err = new statusmixtas(SCOR03.getIdAreas().getResultSet().getString("Id").toString());%>
                <td><%= dtos.getAbierto()%></td>
                <% SEGsumAb += dtos.getAbierto();%>
                <td><%= dtos.getCTEC()%></td>
                <% SEGsumctc += dtos.getCTEC();%>
                <td><%= dtos.getCTEC() + dtos.getAbierto()%></td>
                <% SEGsumSubt += dtos.getCTEC() + dtos.getAbierto();%>
                <td><%= dtos.getCERRADO()%></td>
                <% SEGsumCerr += dtos.getCERRADO();%>
                <td> <%= dtos.getENejec()%> </td>  

                <% SEGsumErr += err.getError().size();  %>
                <% SEGsumEjec += dtos.getENejec();%>
                <td> <%= dtos.getENejec() + dtos.getCTEC() + dtos.getCERRADO() + dtos.getAbierto()%> </td>
                <td> <%= err.getError().size()%> </td> 
            </tr>
            <%}%>
            </tr>
            <%}%>
            <td class="success"><h4>SIPA</h4></td>
            <td class="success"><%= SEGsumAb%></td>
            <td class="success"><%=SEGsumctc%></td>
            <td class="success"><%= SEGsumSubt%></td>
            <td class="success"><%= SEGsumCerr%></td>
            <td class="success"><%= SEGsumEjec%></td>
            <td class="success"><%= SEGsumSubt + SEGsumCerr + SEGsumEjec%></td>
            <td class="success"><%= SEGsumErr%></td>

            <!-- UAT SECCION -->
            <%while (SCOR04.getIdAreas().getResultSet().next()) { %>

            <% if (SCOR04.getIdAreas().getResultSet().getString("AREA").trim().equals("UAT")) {%>
            <tr>
                <td><%= SCOR04.getIdAreas().getResultSet().getString("Id")%></td>
                <% dtos = new statusmixtas(SCOR04.getIdAreas().getResultSet().getString("Id").toString(), FECHA_HOY);%>
                <% err = new statusmixtas(SCOR04.getIdAreas().getResultSet().getString("Id").toString());%>
                <td><%= dtos.getAbierto()%></td>
                <% UATsumAb += dtos.getAbierto();%>
                <td><%= dtos.getCTEC()%></td>
                <% UATsumctc += dtos.getCTEC();%>
                <td><%= dtos.getCTEC() + dtos.getAbierto()%></td>
                <% UATsumSubt += dtos.getCTEC() + dtos.getAbierto();%>
                <td><%= dtos.getCERRADO()%></td>
                <% UATsumCerr += dtos.getCERRADO();%>
                <td> <%= dtos.getENejec()%> </td> 

                <% UATsumErr += err.getError().size();  %>
                <% UATsumEjec += dtos.getENejec();%>
                <td> <%= dtos.getENejec() + dtos.getCTEC() + dtos.getCERRADO() + dtos.getAbierto()%></td>
                <td> <%= err.getError().size()%> </td> 
            </tr>
            <%}%>
            </tr>
            <%}%>
            <td class="success"><h4>UAT</h4></td>
            <td class="success"><%= UATsumAb%></td>
            <td class="success"><%=UATsumctc%></td>
            <td class="success"><%= UATsumSubt%></td>
            <td class="success"><%= UATsumCerr%></td>
            <td class="success"><%= UATsumEjec%></td>
            <td class="success"><%= UATsumSubt + UATsumCerr + UATsumEjec%></td>
            <td class="success"><%= UATsumErr%></td>

            </tbody>   




        </table>
    </div>




</div>



</div>


<hr>

<div class="panel panel panel-default col-md-4">
    <div class="panel-heading"> OPERACION</div>
    <div class="panel-body">
        <div id="Opera"></div>

        </pre>
    </div>
    <div class="panel-footer">
        <h4>Total: &nbsp; <%= OPsumSubt + OPsumCerr + OPsumEjec%> &nbsp; Ordenes</h4> 
    </div>
</div>
<div class="panel panel panel-default col-md-4">
    <div class="panel-heading"> MANTENIMIENTO</div>
    <div class="panel-body">
        <div id="graph" ></div>
        <!--  <pre id="code" class="prettyprint linenums">
          Morris.Donut({
    element: 'graph',
    data: [
      {value: 70, label: 'foo'},
      {value: 15, label: 'bar'},
      {value: 10, label: 'baz'},
      {value: 5, label: 'A really really long label'}
    ],
    backgroundColor: '#ccc',
    labelColor: '#060',
    colors: [
      '#0BA462',
      '#39B580',
      '#67C69D',
      '#95D7BB'
    ],
    formatter: function (x) { return x + "%"}
  });
          </pre> -->

    </div>
    <div class="panel-footer">
        <h4>Total: &nbsp; <%= MANsumSubt + MANsumCerr + MANsumEjec%> &nbsp; Ordenes</h4> 
    </div>
</div>

<div class="panel panel panel-default col-md-4">
    <div class="panel-heading"> SIPA</div>
    <div class="panel-body">
        <div id="sipa"></div>

        </pre>
    </div>
    <div class="panel-footer">
        <h4>Total: &nbsp; <%= SEGsumSubt + SEGsumCerr + SEGsumEjec%> &nbsp; Ordenes</h4> 
    </div>
</div>

<div class="panel panel panel-default col-md-4">
    <div class="panel-heading"> UAT</div>
    <div class="panel-body">
        <div id="uat"></div>

        </pre>
    </div>
    <div class="panel-footer">
        <h4>Total: &nbsp; <%= UATsumSubt + UATsumCerr + UATsumEjec%> &nbsp; Ordenes</h4> 
    </div>
</div>
    
    
    
    
<!-- Calculo de errores -->
<div   class="panel panel panel-danger col-md-12   ">
    <!-- Default panel contents -->
    <div  class="panel-heading"> <h3>Errores</h3> </div>
    <div id="erros" class="panel-body">
        <!-- Table -->
        <table  id="customers"  class="table table-bordered" >

            <thead>
                <tr>

                    <th>Responsable</th>
                    <th>Grupo planificador</th>
                    <th>Costos  0</th>
                    <th>Costos < 20%</th>
                    <th>Falta texto en Operaciones</th>
                    <th> Status Incumplimiento</th>


                </tr>

            </thead>
            <tbody>
                <!-- OPERACIONES -->
                <%while (ERROR00.getIdAreas().getResultSet().next()) { %>
                <% if (ERROR00.getIdAreas().getResultSet().getString("AREA").trim().equals("OPERACION")) {%>
                <tr>
                    <td> <%= ERROR00.getIdAreas().getResultSet().getString("Id")%></td>
                    <% dtos = new statusmixtas(ERROR00.getIdAreas().getResultSet().getString("Id").toString());%>
                    <!-- Errores de grupo de planificacion -->
                    <% if (dtos.getErrorGrup().size() >= 1) { %>
                    <td> <%for (int i = 0; i < dtos.getErrorGrup().size(); i++) {%>
                        <%= "|" + dtos.getErrorGrup().get(i) + "|"%>
                        <% } %></td> 
                        <%} else {%>
                    <td>  </td>
                    <% } %>
                    <!-- Errores de coste cero -->
                    <% if (dtos.getErrorCero().size() >= 1) { %>
                    <td> <%for (int i = 0; i < dtos.getErrorCero().size(); i++) {%>
                        <%= "|" + dtos.getErrorCero().get(i) + "|"%>
                        <% } %></td> 
                        <%} else {%>
                    <td> </td>
                    <% } %>
                    <!-- menor 20%>-->
                    <% if (dtos.getErrorCosto20().size() >= 1) { %>
                    <td> <%for (int i = 0; i < dtos.getErrorCosto20().size(); i++) {%>
                        <%= "|" + dtos.getErrorCosto20().get(i) + "|"%>
                        <% } %></td> 
                        <%} else {%>
                    <td>  </td>
                    <% } %>
                    <!-- Errores tecto vacio -->
                    <% if (dtos.getErrorTextobrev().size() >= 1) { %>
                    <td> <%for (int i = 0; i < dtos.getErrorTextobrev().size(); i++) {%>
                        <%= "|" + dtos.getErrorTextobrev().get(i) + "|"%>
                        <% } %></td> 
                        <%} else {%>
                    <td>  </td>
                    <% } %>
                    
                    <!-- Errores de incumplimiento -->
                    <% if (dtos.getErrorIncum().size() >= 1) { %>
                    <td> <%for (int i = 0; i < dtos.getErrorIncum().size(); i++) {%>
                        <%= "|" + dtos.getErrorIncum().get(i) + "|"%>
                        <% } %></td> 
                        <%} else {%>
                    <td>  </td>
                    <% } %>
                </tr>
                <% } %>
                <% } %>
            <td class="success"><h4>OPERACION</h4></td>

            <!-- mantenimiento -->
            <%while (ERROR01.getIdAreas().getResultSet().next()) { %>
            <% if (ERROR01.getIdAreas().getResultSet().getString("AREA").trim().equals("MANTENIMIENTO")) {%>
            <tr>
                <td> <%= ERROR01.getIdAreas().getResultSet().getString("Id")%></td>
                <% dtos = new statusmixtas(ERROR01.getIdAreas().getResultSet().getString("Id").toString());%>
                <!-- Errores de grupo de planificacion -->
                <% if (dtos.getErrorGrup().size() >= 1) { %>
                <td> <%for (int i = 0; i < dtos.getErrorGrup().size(); i++) {%>
                    <%= "|" + dtos.getErrorGrup().get(i) + "|"%>
                    <% } %></td> 
                    <%} else {%>
                <td>  </td>
                <% } %>
                <!-- Errores de coste cero -->
                <% if (dtos.getErrorCero().size() >= 1) { %>
                <td> <%for (int i = 0; i < dtos.getErrorCero().size(); i++) {%>
                    <%= "|" + dtos.getErrorCero().get(i) + "|"%>
                    <% } %></td> 
                    <%} else {%>
                <td>  </td>
                <% } %>
                <!-- menor 20%>--> 
                <% if (dtos.getErrorCosto20().size() >= 1) { %>
                <td> <%for (int i = 0; i < dtos.getErrorCosto20().size(); i++) {%>
                    <%= "|" + dtos.getErrorCosto20().get(i) + "|"%>
                    <% } %></td> 
                    <%} else {%>
                <td>  </td>
                <% } %>
                <!-- Errores tecto vacio -->
                <% if (dtos.getErrorTextobrev().size() >= 1) { %>
                <td> <%for (int i = 0; i < dtos.getErrorTextobrev().size(); i++) {%>
                    <%= "|" + dtos.getErrorTextobrev().get(i) + "|"%>
                    <% } %></td> 
                    <%} else {%>
                <td>  </td>
                <% } %>
                
                <!-- Errores de incumplimiento -->
                <% if (dtos.getErrorIncum().size() >= 1) { %>
                <td> <%for (int i = 0; i < dtos.getErrorIncum().size(); i++) {%>
                    <%= "|" + dtos.getErrorIncum().get(i) + "|"%>
                    <% } %></td> 
                    <%} else {%>
                <td>  </td>
                <% } %>
            </tr>
            <% } %>
            <% } %>
            <td class="success"><h4>MANTENIMIENTO</h4></td>

            <!-- SIPA -->
            <%while (ERROR02.getIdAreas().getResultSet().next()) { %>
            <% if (ERROR02.getIdAreas().getResultSet().getString("AREA").trim().equals("SEGURIDAD")) {%>
            <tr>
                <td> <%= ERROR02.getIdAreas().getResultSet().getString("Id")%></td>
                <% dtos = new statusmixtas(ERROR02.getIdAreas().getResultSet().getString("Id").toString());%>
                <!-- Errores de grupo de planificacion -->
                <% if (dtos.getErrorGrup().size() >= 1) { %>
                <td> <%for (int i = 0; i < dtos.getErrorGrup().size(); i++) {%>
                    <%= "|" + dtos.getErrorGrup().get(i) + "|"%>
                    <% } %></td> 
                    <%} else {%>
                <td>  </td>
                <% } %>
                <!-- Errores de coste cero -->
                <% if (dtos.getErrorCero().size() >= 1) { %>
                <td> <%for (int i = 0; i < dtos.getErrorCero().size(); i++) {%>
                    <%= "|" + dtos.getErrorCero().get(i) + "|"%>
                    <% } %></td> 
                    <%} else {%>
                <td>  </td>
                <% } %>
                <!-- menor 20%>--> 
                <% if (dtos.getErrorCosto20().size() >= 1) { %>
                <td> <%for (int i = 0; i < dtos.getErrorCosto20().size(); i++) {%>
                    <%= "|" + dtos.getErrorCosto20().get(i) + "|"%>
                    <% } %></td> 
                    <%} else {%>
                <td> </td>
                <% } %>
                <!-- Errores tecto vacio -->
                <% if (dtos.getErrorTextobrev().size() >= 1) { %>
                <td> <%for (int i = 0; i < dtos.getErrorTextobrev().size(); i++) {%>
                    <%= "|" + dtos.getErrorTextobrev().get(i) + "|"%>
                    <% } %></td> 
                    <%} else {%>
                <td>  </td>
                <% } %>
                
                <!-- Errores de incumplimiento -->
                <% if (dtos.getErrorIncum().size() >= 1) { %>
                <td> <%for (int i = 0; i < dtos.getErrorIncum().size(); i++) {%>
                    <%= "|" + dtos.getErrorIncum().get(i) + "|"%>
                    <% } %></td> 
                    <%} else {%>
                <td>  </td>
                <% } %>
            </tr>
            <% } %>
            <% } %>
            <td class="success"><h4>SIPA</h4></td>
            <!-- UAT-->
            <%while (ERROR03.getIdAreas().getResultSet().next()) { %>
            <% if (ERROR03.getIdAreas().getResultSet().getString("AREA").trim().equals("UAT")) {%>
            <tr>
                <td> <%= ERROR03.getIdAreas().getResultSet().getString("Id")%></td>
                <% dtos = new statusmixtas(ERROR03.getIdAreas().getResultSet().getString("Id").toString());%>
                <!-- Errores de grupo de planificacion -->
                <% if (dtos.getErrorGrup().size() >= 1) { %>
                <td> <%for (int i = 0; i < dtos.getErrorGrup().size(); i++) {%>
                    <%= "|" + dtos.getErrorGrup().get(i) + "|"%>
                    <% } %></td> 
                    <%} else {%>
                <td>  </td>
                <% } %>
                <!-- Errores de coste cero -->
                <% if (dtos.getErrorCero().size() >= 1) { %>
                <td> <%for (int i = 0; i < dtos.getErrorCero().size(); i++) {%>
                    <%= "|" + dtos.getErrorCero().get(i) + "|"%>
                    <% } %></td> 
                    <%} else {%>
                <td>  </td>
                <% } %>
                <!-- menor 20%>--> 
                <% if (dtos.getErrorCosto20().size() >= 1) { %>
                <td> <%for (int i = 0; i < dtos.getErrorCosto20().size(); i++) {%>
                    <%= "|" + dtos.getErrorCosto20().get(i) + "|"%>
                    <% } %></td> 
                    <%} else {%>
                <td>  </td>
                <% } %>
                <!-- Errores tecto vacio -->
                <% if (dtos.getErrorTextobrev().size() >= 1) { %>
                <td> <%for (int i = 0; i < dtos.getErrorTextobrev().size(); i++) {%>
                    <%= "|" + dtos.getErrorTextobrev().get(i) + "|"%>
                    <% } %></td> 
                    <%} else {%>
                <td>  </td>
                <% } %>
                
                <!-- Errores de incumplimiento -->
                <% if (dtos.getErrorIncum().size() >= 1) { %>
                <td> <%for (int i = 0; i < dtos.getErrorIncum().size(); i++) {%>
                    <%= "|" + dtos.getErrorIncum().get(i) + "|"%>
                    <% } %></td> 
                    <%} else {%>
                <td>  </td>
                <% } %>
            </tr>
            <% } %>
            <% }%>
            <td class="success"><h4>UAT</h4></td>
            </tbody>   
        </table>
    </div>
            
                        </div>
<!-- envion de errores -->
<script>
    
    $("#enviar_errores").click(function(){
         window.location ="../ManejodeErrores/G%26PQB/index.xhtml";
    });
    
</script>



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

<style>
    #customers {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        width: 100%;
        border-collapse: collapse;
    }

    #customers td, #customers th {
        font-size: 1em;
        border: 1px solid #98bf21;
        padding: 3px 7px 2px 7px;
    }

    #customers th {
        font-size: 1.1em;
        text-align: left;
        padding-top: 5px;
        padding-bottom: 4px;
        background-color: #A7C942;
        color: #ffffff;
    }

    #customers tr.alt td {
        color: #000000;
        background-color: #EAF2D3;
    }
    
    
    
</style>
                        
                        
                    </div>
		</div>

		</div>




		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<!-- Morris.js charts -->
                <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.2/raphael-min.js"></script>
  <script src="../../morris.js-0.5.1/morris.min.js" type="text/javascript"></script>
  <a href="../../morris.js-0.5.1/Gruntfile.js"></a>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/prettify/r224/prettify.min.js"></script>
		<script type="text/javascript" src="../../pemex_dise/dist/js/bootstrap.js"></script>
<scrip src="https://raw.githubusercontent.com/yevhentiurin/animatedscrolljs/master/releases/jquery.animatedscroll-1.1.5.min.js"></scrip>
                
                

 
 <script>
                                Morris.Donut({
                                element: 'graph',
                                        data: [
                                        {value: ('<%= MANsumAb%>'), label: 'Lib,Abier '},
                                        {value: ('<%= MANsumctc%>'), label: 'Ctec'},
                                        {value: ('<%= MANsumCerr%>'), label: 'CERR'},
                                        {value: ('<%= MANsumEjec%>'), label: 'Ejecucion'}

                                        ],
                                        backgroundColor: '#ccc',
                                        labelColor: '#060',
                                        colors: [
                                                'red',
                                                '#EFF23A',
                                                '#6EC24F',
                                                '#F77930'


                                        ],
                                        formatter: function(x) {
                                        return x + " Ordenes"
                                        }
                                });
                                Morris.Donut({
                                element: 'Opera',
                                        data: [
                                        {value: ('<%= OPsumAb%>'), label: 'Lib,Abier '},
                                        {value: ('<%= OPsumctc%>'), label: 'Ctec'},
                                        {value: ('<%= OPsumCerr%>'), label: 'CERR'},
                                        {value: ('<%= OPsumEjec%>'), label: 'Ejecucion'}

                                        ],
                                        backgroundColor: '#ccc',
                                        labelColor: '#060',
                                        colors: [
                                                'red',
                                                '#EFF23A',
                                                '#6EC24F',
                                                '#F77930'

                                        ],
                                        formatter: function(x) {
                                        return x + " Ordenes"
                                        }
                                });
                                Morris.Donut({
                                element: 'sipa',
                                        data: [
                                        {value: ('<%= SEGsumAb%>'), label: 'Lib,Abier '},
                                        {value: ('<%= SEGsumctc%>'), label: 'Ctec'},
                                        {value: ('<%= SEGsumCerr%>'), label: 'CERR'},
                                        {value: ('<%= SEGsumEjec%>'), label: 'Ejecucion'}

                                        ],
                                        backgroundColor: '#ccc',
                                        labelColor: '#060',
                                        colors: [
                                                'red',
                                                '#EFF23A',
                                                '#6EC24F',
                                                '#F77930'

                                        ],
                                        formatter: function(x) {
                                        return x + " Ordenes"
                                        }
                                });
                                Morris.Donut({
                                element: 'uat',
                                        data: [
                                        {value: ('<%= UATsumAb%>'), label: 'Lib,Abier '},
                                        {value: ('<%= UATsumctc%>'), label: 'Ctec'},
                                        {value: ('<%= UATsumCerr%>'), label: 'CERR'},
                                        {value: ('<%= UATsumEjec%>'), label: 'Ejecucion'}

                                        ],
                                        backgroundColor: '#ccc',
                                        labelColor: '#060',
                                        colors: [
                                                'red',
                                                '#EFF23A',
                                                '#6EC24F',
                                                '#F77930'

                                        ],
                                        formatter: function(x) {
                                        return x + " Ordenes"
                                        }
                                });
</script>

<script>
        $("#irError").click(function() {
         //alert("hello");   
          $("html, body").animate({ scrollTop: $("#erros").offset().top }, 1000);
        // $("#erros").animatedScroll({easing: "easeOutExpo"});
        });
        
        $("#irMixtos").click(function() {
         //alert("hello");   
          $("html, body").animate({ scrollTop: $("#ordeneshoy").offset().top }, 1000);
        // $("#erros").animatedScroll({easing: "easeOutExpo"});
        });
        $("#irMixto").click(function() {
         //alert("hello");   
          $("html, body").animate({ scrollTop: $("#ordeneshoy").offset().top }, 1000);
        // $("#erros").animatedScroll({easing: "easeOutExpo"});
        });
       
    </script>
                   

	</body>
	</html>




<!-- elegir la casilla <script> 

     $("#tblerror  td").click(function(){
          var index = $('td', $(this).closest("#tblerror")).index(this);
          alert(index);
     });
  
   
 </script> -->


<% SCOR00.getConexion().close(); %>  
<% SCOR02.getConexion().close(); %> 
<% SCOR03.getConexion().close(); %> 
<% SCOR04.getConexion().close(); %> 
<% ERROR00.getConexion().close(); %>
<% ERROR01.getConexion().close(); %>
<% ERROR02.getConexion().close(); %>
<% ERROR03.getConexion().close(); %>
<% dtos.getConexion().close();%>      
<% err.getConexion().close();%>    

