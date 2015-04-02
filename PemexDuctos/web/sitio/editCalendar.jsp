<%-- 
    Document   : editCalendar
    Created on : 22/01/2015, 04:56:00 PM
    Author     : jose_l
--%>

<%@page import="org.joda.time.DateTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Calendar.calendarDates"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
        <% calendarDates cal = new calendarDates(); 
        
        DateTime inicio;
        DateTime fin;
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat nor =new SimpleDateFormat("dd-MM-yyyy");
	%>
        <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="css/fullcalendar.css"> 
	<link rel="stylesheet" type="text/css" href="css/fullcalendar.print.css" media='print'>
	<link rel="stylesheet" type="text/css" href="css/jquery-ui.theme.css">
        <link href="../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="js/moment.min.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	<script type="text/javascript" src="js/fullcalendar.js" ></script>
        <script src="../bootstrap/js/bootstrap.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/lang-all.js"></script>

	  	<script type="text/javascript">
            $(window).load(function() {
	$(".loader").fadeOut("slow");
});
	$(document).ready(function(){
		
		$("#calendar").fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			eventRender: function (event, element) {
            element.attr('href', 'javascript:void(0);');
            element.attr('onclick', 'openModal("' + event.title + '","' + event.description + '","' + event.url + '");');
        },  lang: 'es',
			selectable: true,
			selectHelper: true,
			eventClick: function(calEvent, jsEvent, view) { 
           $('#myModalLabel').html(calEvent.title);
           $('#Description').html(calEvent.description);
           $('#myModal').modal('show');
       },editable: false,
       events:"../CalendarJsonServlet"
    
			
			

		});
		/*
		{
					title: 'All Day Event',
					description: 'todo lo que se describe',
					color: 'skyblue',
					borderColor: 'blue',   // an option!
                    textColor: 'black', // an option!
					start: '2014-07-02'
					//end:    '2014-07-14'
				}
		*/

	});
      
	</script>
        <style>

	body {
		margin: 0;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		width: 900px;
		margin: 40px auto;
	}
        .loader {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url('img/page-loader.gif') 50% 50% no-repeat rgb(249,249,249);
}

</style> 
	<title>Document</title>
</head>
<body>
    
    <div class=" container" align="center" >
    
  <!--
  <button type="button" class="btn btn-large btn-success">
     <span class="glyphicon glyphicon-search"></span> Atras</button>
-->  

</div>
    
	<div id="calendar"></div>
	<div id="cal_event"></div>
        <div class="loader"></div>

<!-- Modal -->
<div class="row">
    <div  class="col-md-3">
        <div id="caja_flotante" class="box box-primary">
            <div id="titu" class="box-header">
                <h4 class="box-title"> Datos : </h4>
            </div>

            <div class="box-body">
                <!-- the events -->
                <div id='external-events'>
                    <!-- <a class='btn btn-primary'>Guardar</a>
                     <a id="reiniciar" class='btn btn-danger'>Revertir</a> -->


                </div>


            </div><!-- /.box-body -->
        </div><!-- /. box -->

    </div><!-- /.col -->
    <!-- THE CALENDAR -->
    <div class="col-md-7">


        <!-- THE CALENDAR -->
        <div id="calendar"></div>

    </div>  
    
 <div class="col-md-2">
                        <div id="caja_flotante2" class="box box-primary">
                            <div class=" box-header">
                                <h3 class="box-title">Areas</h3>
                            </div>
                            <div class="box-body">
                                <!-- the events -->
                                <div id='external-events'>
                                    <div id="op" class='external-event bg-black'  >Operacion</div>
                                    <div id="mante" class='external-event bg-aqua' >Mantenimiento</div>
                                    <div  id="sipa" class='external-event bg-red ' > SIPA</div>
                                    <div id="uat" class='external-event bg-yellow' >UAT</div>
                                    <div id="cerr" class='external-event ' >Cerradas , CTEC</div>


                                </div>
                            </div><!-- /.box-body -->
                            <div class=" box-footer">
                                <button  id="reset" class="btn  btn-success">Reset</button>
                                <button  id="quit" class="btn  btn-warning">Quitar</button>
                            </div>
                        </div><!-- /. box -->
                    </div><!-- /.col -->
</div><!-- /.row -->

                 
               

                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                            </div>
                            <div class="modal-body" id="Description">
                               Cambiar rango de fechas
                               <br>
                                 <div class='form-group'>
                                        <label>Rango:</label>
                                        <div class='input-group'>
                                            <div class='input-group-addon'>
                                                <i class='fa fa-calendar'></i>
                                            </div>
                                            <input type='text' class='form-control pull-right' id='reservation'/>
                                       </div>
                                    </div>
                            </div>
                            <div class='modal-footer'>
                              
                            </div>
                            
                        </div>
                    </div>
                </div>
           
<style>
    #titule{
        background: #4c4c4c; /* Old browsers */
background: -moz-linear-gradient(top, #4c4c4c 0%, #595959 12%, #666666 25%, #474747 39%, #2c2c2c 50%, #000000 51%, #111111 60%, #2b2b2b 76%, #1c1c1c 91%, #131313 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#4c4c4c), color-stop(12%,#595959), color-stop(25%,#666666), color-stop(39%,#474747), color-stop(50%,#2c2c2c), color-stop(51%,#000000), color-stop(60%,#111111), color-stop(76%,#2b2b2b), color-stop(91%,#1c1c1c), color-stop(100%,#131313)); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(top, #4c4c4c 0%,#595959 12%,#666666 25%,#474747 39%,#2c2c2c 50%,#000000 51%,#111111 60%,#2b2b2b 76%,#1c1c1c 91%,#131313 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(top, #4c4c4c 0%,#595959 12%,#666666 25%,#474747 39%,#2c2c2c 50%,#000000 51%,#111111 60%,#2b2b2b 76%,#1c1c1c 91%,#131313 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(top, #4c4c4c 0%,#595959 12%,#666666 25%,#474747 39%,#2c2c2c 50%,#000000 51%,#111111 60%,#2b2b2b 76%,#1c1c1c 91%,#131313 100%); /* IE10+ */
background: linear-gradient(to bottom, #4c4c4c 0%,#595959 12%,#666666 25%,#474747 39%,#2c2c2c 50%,#000000 51%,#111111 60%,#2b2b2b 76%,#1c1c1c 91%,#131313 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#4c4c4c', endColorstr='#131313',GradientType=0 ); /* IE6-9 */

    }

</style>
     

</body>
</html>
