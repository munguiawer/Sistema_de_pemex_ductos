<%-- 
    Document   : calendar
    Created on : 12/07/2014, 12:32:45 PM
    Author     : jose
--%>

<%@page import="Calendar.CalendarDates2"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="org.joda.time.DateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    
   



 <div class="col-md-2">
                            <div id="caja_flotante" class="box box-primary">
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

<div class="col-md-10">
      <!-- THE CALENDAR -->
                <div id="calendar"></div>
                <div id="cal_event"></div>
                <div class="loader"></div>
                
</div>
              

                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                            </div>
                            <div class="modal-body" id="Description">
                                ...
                            </div>

                        </div>
                    </div>
                </div>
                
            
                       
                       
               
              
  <script type="text/javascript">
      var todas = "Calendar2Servlet"; // area que se modificara esta cambia conforme se elige una inicia en todas cambian ente mantenimiento , operaciones etc dependiendo cual elijamos
      var count = 0, resetear = 1;
      var bandera = false;
      var sources = new Array();
          sources[0] = "Calendar2Servlet";
          sources[1] = "operacionesServlet";
          sources[2] = "mantenimientoServlet";
          sources[3] = "sipaServlet";
          sources[4] = "uatServlet";
          
          
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
        // when click on event----------------------------------->>
			eventClick: function(calEvent, jsEvent, view) { 
                            
                             if(bandera === true)
                             {
                                 
                                $('#calendar').fullCalendar('removeEventSource', todas);
                                $('#calendar').fullCalendar('addEventSource', todas);
                                 bandera = false;
                                 permiso = false;
                             }else if(bandera === false)
                             {
                                 
                                calEvent.color = '#00FFFF';
                                 $('#calendar').fullCalendar( 'addEvent', calEvent);
                                 $('#calendar').fullCalendar('updateEvent', calEvent);
                                  $('#calendar').fullCalendar( 'unselect' );
                                bandera = true;
                                permiso = true;
                            }
                            
            // Modal dates callback -------------------------                
           $('#myModalLabel').html(calEvent.title);               
           $('#Description').html(calEvent.description);
           if(permiso === true)
           {
                $('#myModal').modal('show');
           }
          
           // end modal ----------------------------------------
       }, //when click end ------------------------------------------------------------>>
       editable: false,
       events:sources[0] //todas las ordenes se optiene de aqui

   

		});
                    </script>
                    <style>
                #calendar {
		width: 900px;
		margin: 40px auto;
	}
                    </style>
                    
                    <script>
                         var posicion = $("#caja_flotante").offset();
        
	    var margenSuperior = 15;
	     $(window).scroll(function() {
	         if ($(window).scrollTop() > posicion.top) {
	             $("#caja_flotante").stop().animate({
	                 marginTop: $(window).scrollTop() - posicion.top + margenSuperior
	             });
                    
	         } else {
	             $("#caja_flotante").stop().animate({
	                 marginTop: 0
	             });
                    
	         };
	     });  
                    </script>
                    
                    <script>
                       $("#op").click(function(){
                       count +=1;
                        
                        if(count===1){
                            $('#calendar').fullCalendar('removeEventSource',  sources[4]);
                            $('#calendar').fullCalendar('removeEventSource',  sources[3]);
                             $('#calendar').fullCalendar('removeEventSource', sources[2]);
                           $('#calendar').fullCalendar('removeEventSource', sources[0]);
                           $('#calendar').fullCalendar('addEventSource', sources[1]);
                            todas = sources[1];
                            $("#mante").hide();
                            $("#sipa").hide();
                            $("#uat").hide();
                            // $("#cerr").hide();
                        }
                        
                        resetear = 0;
                        
                        });
                        $("#mante").click(function(){
                            count += 1;
                        if(count===1){
                            $('#calendar').fullCalendar('removeEventSource',  sources[4]);
                            $('#calendar').fullCalendar('removeEventSource',  sources[3]);
                            $('#calendar').fullCalendar('removeEventSource',  sources[1]);
                           $('#calendar').fullCalendar('removeEventSource',  sources[0]);
                           $('#calendar').fullCalendar('addEventSource', sources[2]);
                           todas = sources[2];
                            $("#op").hide();
                            //$("#mante").hide();
                            $("#sipa").hide();
                            $("#uat").hide();
                             //$("#cerr").hide();
                         }
                          resetear = 0;
                        });
                        $("#sipa").click(function(){
                               count += 1;
                        if(count===1){
                            $('#calendar').fullCalendar('removeEventSource',  sources[4]);
                            $('#calendar').fullCalendar('removeEventSource',  sources[2]);
                            $('#calendar').fullCalendar('removeEventSource',  sources[1]);
                           $('#calendar').fullCalendar('removeEventSource',  sources[0]);
                           $('#calendar').fullCalendar('addEventSource', sources[3]);
                           todas = sources[3];
                            $("#op").hide();
                            $("#mante").hide();
                           // $("#sipa").hide();
                            $("#uat").hide();
                             //$("#cerr").hide();
                         }
                          resetear = 0;
                        });
                        $("#uat").click(function(){
                            count += 1;
                        if(count===1){
                            $('#calendar').fullCalendar('removeEventSource',  sources[3]);
                            $('#calendar').fullCalendar('removeEventSource',  sources[2]);
                            $('#calendar').fullCalendar('removeEventSource',  sources[1]);
                           $('#calendar').fullCalendar('removeEventSource',  sources[0]);
                           $('#calendar').fullCalendar('addEventSource', sources[4]);
                           todas = sources[4];
                           $("#op").hide();
                            $("#mante").hide();
                            $("#sipa").hide();
                            //$("#uat").hide();
                             //$("#cerr").hide();
                         }
                         resetear = 0;
                        });
                      
                        $("#reset").click(function(){
                             
                       resetear +=1;
                       if(resetear === 1){
                            $("#op").show();
                            $("#mante").show();
                            $("#sipa").show();
                            $("#uat").show();
                            $("#cerr").show();
                            $('#calendar').fullCalendar('removeEventSource',  sources[4]);
                             $('#calendar').fullCalendar('removeEventSource',  sources[3]);
                                $('#calendar').fullCalendar('removeEventSource', sources[2]);
                                  $('#calendar').fullCalendar('removeEventSource', sources[1]);
                                  $('#calendar').fullCalendar('addEventSource', sources[0]);
                             todas = sources[0];
                           count = 0;
                       }
                       
                        });
                         $("#quit").click(function(){
                            $("#caja_flotante").hide();
                        });
                        
                         $('#op').hover(function() {
                        $(this).css('cursor','pointer');
                             });
                             $('#mante').hover(function() {
                        $(this).css('cursor','pointer');
                             });
                             $('#sipa').hover(function() {
                        $(this).css('cursor','pointer');
                             });
                             $('#uat').hover(function() {
                        $(this).css('cursor','pointer');
                             });
                            
                        
                       // $("#calendar").fullCalendar('removeEventSource', source);
                    </script>
                   