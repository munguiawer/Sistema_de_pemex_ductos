
<%@page import="confiabilidad.tabla_confi"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang    ="es">
<head>
	<meta charset ="UTF-8">
	<title>Confiabilidad operacional</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="../bootstrap/css/estilo.css" rel="stylesheet" type="text/css"/>

</head>

<body>
	<%  SimpleDateFormat t = new SimpleDateFormat("dd-MMMM-yyyy"); 
	DateTime hoy = new DateTime();
	String FECHA_HOY = t.format(hoy.toDate()).toString();
                Calendar  calendar  = Calendar .getInstance(); // HOY
                //calculando los dias sin accidentes
                calendar.set( Calendar .HOUR_OF_DAY , 0 );
                calendar.set( Calendar .MINUTE , 0 );
                calendar.set( Calendar .SECOND , 0 );
        Date  fechaDeNacimiento = new SimpleDateFormat ("dd/MM/yy").parse("06/09/1996"); // ultimo accidente le resto 1 dia por que el dia de hoy aun no termina
        long dias = ( calendar.getTime().getTime() - fechaDeNacimiento.getTime()  )  / 86400000; // dias sin accidente
        //fin del calculo

        %>

        <div class="container-fluid">
        	<div id="cabeza"  align="center">
        		<div class="row">
        			<!--cabezera -->
        			<div class="row">
        				<!-- logo -->
        				<div  class="col-xs-2 col-md-2 col-sm-2 " id="lgo" align="center"  ></div>
        				<!-- titulo -->
        				<div id="title" class=" col-xs-2 col-md-5 col-sm-5  col-md-offset-2 ">
        					<div align="center" >
        						<p>PEMEX CONFIABILIDAD </p>
        						<div id="subtitle" class="center"><h3>SECTOR MINATITLAN</h3></div>
        					</div>
        				</div>
        				<!--logo3 -->
        				<div class="col-md-2 col-sm-2 col-xs-2 col-md-offset-1">
        					<div id="logo3" align="right"></div>
        				</div>

        			</div>

        			<!-- btn regresar y bienvenida -->
        			<div class="row">
        				<!-- boton regresar -->
        				<div   class="col-md-7 col-xs-7 col-sm-7 ">
        					<div  align="left" id="boton_back" >
                                                    
        						<form action="../../tblMixtas/index.jsp">
        							<button   type="submit" class="btn btn-default btn-lg ">
        								<span class="glyphicon glyphicon-circle-arrow-left"></span> Atras
        							</button>
        						</form>
        						<div id="welcome"  align="left">Bienvenido </div> 
        					</div>
        				</div>
        				

        				<!--  fecha	-->
        				<div class=" col-md-offset-1 col-md-4 col-xs-4 col-sm-4"><div align="right" id="fecha_welcome"> <%= FECHA_HOY %> </div></div>
        				
        				<!-- linea -->	
        				<div id="linea" class="col-xs-12 col-sm-12 col-md-12"><hr/></div>

        			</div>

        			

        			


        		</div>
        	</div>
        </div>


        <!--cuerpo de la pagina -->

        <div  class="container-fluid">
        	<!--logo2 y accidentes -->
        	<div class="row">
        		<div class="col-md-5 col-xs-5 col-sm-10 col-md-offset-1" >
        		<div id="accidentes" align="left">
        			<div id="accLetr1"  > Dias sin accidentes: </div>
        			<div id="accDias">  <%= dias %>   </div>
        			<div id="accLetr2"> <p>Fecha del ultimo accidente:<br/></p> </div>
        			<div id="accLetr3">05-septiembre-1996</div>
        		</div>
        			

        		</div>
        		<div class="col-xs-4 col-sm-4 col-md-offset-1 col-md-4"><div id="lgo2" align="center"></div></div>
        		<div class="col-md-1 col-xs-1 col-sm-1"></div>

                 <!-- politica -->
        		<div class="col-xs-10 col-sm-10 col-md-10 col-md-offset-1 ">
        		<div class="div" align="left">
        			<h3 id="subtl">Politica</h3>
        			<p><h4>"En petróleos mexicanos la confiabilidad operacional  es un valor fundamental de la organización que contribuye a una operación confiable, segura y sostenible a lo largo de siclo de vida de los activos, con igual de prioridad que la seguridad , la producción , la calidad y las ventas en la empresa".</h4></p>
        		</div>
        		</div>
        		<div class="col-md-1 col-xs-1 col-sm-1"></div>
        		<!-- mision -->
        		<div class="col-xs-5 col-xs-5 col-sm-5 col-md-offset-1">

        			<h3 id="subtl">Misión</h3>
        			<p>
        				<h4>Creación de valor atreves de activos que operen en forma eficiente, segura y confiable, de manera que se optimicen los costos y se eliminen las pérdidas asociadas a fallas, mediante la eficiente y eficaz aplicación de los recursos disponibles.</h4>
        			</p>
        		</div>
        		<!-- vision ---->
        		<div class="col-xs-5">
        			<h3 id="subtl">visión</h3>
        			<p>
        				<h4>La subdirección de ductos de PGPB  a través de la implantación y ejecución del modelo "Pemex confiablidad" es un negocio integral, sustentado en la excelencia y mejora continua de su personal, diseño, proceso y tecnología, dando máxima seguridad en sus instalaciones con absoluto respeto a su entorno.</h4>
        			</p>
        		</div>
        		<div class="col-md-1"></div>

                 <!-- espaciado--> 
        		<div class="col-md-12"><br/><br/></div>

        		<!-- grafica -->
        		<div  class=" col-md-offset-5 col-md-7 col-sm-7 col-xs-7"  id="seccion_title" align="left">GRAFICÓ CONFIABILIDAD OPERACIONAL</div>
        		<div  class="col-md-3 col-sm-12 col-xs-3" align="right" >
        			<div id="graf_claves">

        				<div id="planeado">
        					<div id="pl_lettr"><h4>REALIZADO</h4></div>
        				</div>

        				<div id="realizado">
        					<div id="pl_lettr2"><h4>PLANEADO</h4></div>

        				</div>
        			</div>
        		</div>

        		<div class=" col-md-8 col-sm-12 col-xs-8 col-md-offset-1">
        			<div id="grafica1" align="left"  >
        				<canvas id="canvas" height="250px" width="900px" ></canvas>
        			</div>
        		</div>
        	</div>

        	



        	<footer>
        	
        		
        	</footer>

        </div>
        <!-- jQuery Version 1.11.0 -->
        <script src="../bootstrap/js/jquery.js" type="text/javascript"></script>
        
      <% tabla_confi tbl = new tabla_confi(); %>
        <!--boostrap.js-->
        <script src="../js/bootstrap.js" type="text/javascript"></script>
        <!--GRAFICA -->
        <script src="../js/Chart.js-master/Chart.js" type="text/javascript"></script>
        <script src="../js/Chart.min.js" type="text/javascript"></script>
        <script>
            var planeado = "planeado";
           
        	var barChartData = {
        		labels : ["CMCV","M","CCH","CYL","OYL","PP","VO","FPI","ALRM","AT","CET","MCC","IBR","AYS"],
        		datasets : [
        		{
        			fillColor : "rgba(156,156,152,1)",
        			strokeColor : "rgba(220,220,220,0.8)",
                                
                               data : [<% int b =0;  
                                        while(b < tbl.getPlaneado().size()){ // imprimos uno a uno los datos con el formato "1","2",..."n"
               
                                          out.print(""+tbl.getPlaneado().get(b)+",");
                                          b++;
                                         } %>]

                               },
        		{
        			fillColor : "rgba(151,187,205,1)",
        			strokeColor : "rgba(151,187,205,0.8)",

        			data : [
                                    <% int n =0;  
                                        while(n < tbl.getPlaneado().size()){
               
                                          out.print(""+tbl.getRealizado().get(n)+",");
                                          n++;
                                         } %>
                                ]
        		}
        		]

        	}
        	window.onload = function(){

        		var ctx = document.getElementById("canvas").getContext("2d");
        		window.myBar = new Chart(ctx).Bar(barChartData, {
        			responsive : true
        		});
        	}
                                
                                
                                

                

        </script>
        

        
    </body>

    </html>