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

    
  


<!-- Main content -->


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
           
                

              
  <script type="text/javascript">
      
   
      var todas = "Calendar2Servlet"; // area que se modificara esta cambia conforme se elige una inicia en todas cambian ente mantenimiento , operaciones etc dependiendo cual elijamos
      var count = 0, resetear = 1;
      var sources = new Array();
          sources[0] = "Calendar2Servlet";
          sources[1] = "operacionesServlet";
          sources[2] = "mantenimientoServlet";
          sources[3] = "sipaServlet";
          sources[4] = "uatServlet";
       var source = "Calendar2Servlet";
       var bandera = false;
       var permiso = false;
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
                            
                           
                           
                         
                                 
                            
        
                            
                            
                           
                          
                           
            // Modal dates callback -------------------------    
         //  $('#myModalLabel').html("<h2>"+calEvent.title+"</h2>");   
          //gert start date --------------
             var inicio = new Date(calEvent.start.format());   
             var inmes= ((inicio.getMonth().length+1) === 1)? (inicio.getMonth()+1) : '0' + (inicio.getMonth()+1);
             var ordene = calEvent.title;
             var inicDate = (inicio.getDate()+1) + "-" + inmes + "-" + inicio.getFullYear(); // reult
           //get find date------------------------------
             var fin = new Date(calEvent.end.format());   
             var twoDigitMonth = ((fin.getMonth().length+1) === 1)? (fin.getMonth()+1) : '0' + (fin.getMonth()+1);
             var finDate = fin.getDate() + "-" + twoDigitMonth + "-" + fin.getFullYear(); // reult
             //
             //fin date -----------
             
             var firn =calEvent.end.format('DD-MM-YYYY');
             var finfech = firn.split('-');
             var fchad = (finfech[0].split('-')-1)+"-"+finfech[1].split('-')+"-"+finfech[2].split('-');
           
         $("#titu").html("<div id='pie' class='modal-footer'>"+
                     "<div class='input-group'>"+
                        "<div class='input-group-addon'>"+
                             "<i class='fa fa-calendar'></i>"+
                         "</div>"+
                        " <input type='text' class='form-control pull-right' id='reservation' value='"+calEvent.start.format('DD-MM-YYYY')+" Hasta "+fchad+"'/>"+
                    " </div>"+
                    "<br>"+
                    " <button id='btn' type='button' class='btn btn-success' data-dismiss='modal'>Guardar</button>"+
                   // "<button id='btn-cancel' type='button' class='btn btn-danger' data-dismiss='modal'>Cancelar</button>"+
                 "</div>");
           $('#external-events').html("<h3>"+calEvent.title+"</h3>"+"<p>"+calEvent.description+"</p>");
      
                         
                                    $('#reservation').dateRangePicker();
                                    var inid;
                                    var endf;
                                     $("#btn").click(function(){
                                        
                                         var ifd = $('#reservation').val();
                                          var ind = ifd.split(" Hasta ");
                                         //var fnd = ind(0);
                                        //calEvent.start = ind;
                                       
                                       
                                       var partin =ind[0].split('-');                                       
                                       var partfin =ind[1].split('-');
                                       var diaf = partfin[0];
                                       var df = (diaf*1)+1;
                                       
                                       inid = partin[2]+"-"+partin[1]+"-"+partin[0];
                                       if(df>32)
                                       {
                                           df-=1;
                                       }
                                       
                                       endf = partfin[2]+"-"+partfin[1]+"-"+df;
                                       alert(inid)
                                        
                                        
                                        calEvent.start = inid;
                                        calEvent.end = endf;
                                          $('#calendar').fullCalendar('updateEvent', calEvent);
                                           var ini = new Date(calEvent.start.format());   
                                            var fn = new Date(calEvent.end.format()); 
                                             
                                          $.ajax({
        type: "POST",
        url: "admin/changerManagerCalendar.jsp",
        data: {"orden":ordene,
                "inicio":ini,
                "fin":fn
            },
        success: function(response){ 
            alert(response);     
        },
        error: function(result) {
                    alert(result);
                }
    });
     
                                                         
                                    });
                          
         //  $('#myModal').modal('show');
      
           // end modal ----------------------------------------
       }, //when click end ------------------------------------------------------------>>
       editable: true,
       events: sources[0],
             eventDrop: function(event, delta, revertFunc) {
         
            //gert start date --------------
             var inicio = new Date(event.start.format());   
             var ordene = event.title;
             var inmes= ((inicio.getMonth().length+1) === 1)? (inicio.getMonth()+1) : '0' + (inicio.getMonth()+1);
             var inicDate = (inicio.getDate()+1) + "-" + inmes + "-" + inicio.getFullYear(); // reult
           //get find date------------------------------
             var fin = new Date(event.end.format());   
             var twoDigitMonth = ((fin.getMonth().length+1) === 1)? (fin.getMonth()+1) : '0' + (fin.getMonth()+1);
             var finDate = fin.getDate() + "-" + twoDigitMonth + "-" + fin.getFullYear(); // reult
             //fin date -----------
         $('#myModalLabel').html("<h2>"+event.title+"</h2>");               
           $('#Description').html("<p id='cuerpo'> <h4>La Orden se ha movido :</h4>  <h3>"+event.start.format('DD-MM-YYYY')+"  hasta  " + finDate+ "</h3> </p>"+
                                "<br><br>"+
                               "<div class='modal-footer'>"+
                               "<button id='cancelar' type='button' class='btn btn-danger' data-dismiss='modal'>Cancelar</button>"+
                               "<button id='continuar' type='button' class='btn btn-primary'>Continuar</button></div>");
           $('#myModal').modal('show');
           $("#cancelar").click(function(){
                
              revertFunc();
              $('#myModal').modal('hide');
        
           });
           
           $('#continuar').click(function(){
               
          
               $('#myModal').modal('hide');
                 $.ajax({
        type: "POST",
        url: "admin/changerManagerCalendar.jsp",
        data: {"orden":ordene,
                "inicio":inicio,
                "fin":fin},
        success: function(response){ 
            alert(response);     
        },
        error: function(result) {
                    alert(result);
                }
    });

           });
     
       
         // Make your ajax post here
  
         //$("#external-events").html(" <input type='text' class='form-control pull-right' id='reservation'/>" );
        
    

        

    },eventResize: function(event, delta, revertFunc) {
        
        
        //gert start date --------------
             var inicio = new Date(event.start.format());   
             var ordene = event.title;
             var inmes= ((inicio.getMonth().length+1) === 1)? (inicio.getMonth()+1) : '0' + (inicio.getMonth()+1);
             var inicDate = (inicio.getDate()+1) + "-" + inmes + "-" + inicio.getFullYear(); // reult
           //get find date------------------------------
             var fin = new Date(event.end.format());   
             var twoDigitMonth = ((fin.getMonth().length+1) === 1)? (fin.getMonth()+1) : '0' + (fin.getMonth()+1);
             var finDate = fin.getDate() + "-" + twoDigitMonth + "-" + fin.getFullYear(); // reult
             //fin date -----------
             
         $('#myModalLabel').html("<h2>"+event.title+"</h2>");               
           $('#Description').html("<p id='cuerpo'> <h4>La Orden se ha movido :</h4>  <h3>"+event.start.format('DD-MM-YYYY')+"  hasta  " + finDate+ "</h3> </p>"+
                                "<br><br>"+
                               "<div class='modal-footer'>"+
                               "<button id='cancelar' type='button' class='btn btn-danger' data-dismiss='modal'>Cancelar</button>"+
                               "<button id='continuar' type='button' class='btn btn-primary'>Continuar</button></div>");
           $('#myModal').modal('show');
           $("#cancelar").click(function(){
                
              revertFunc();
              $('#myModal').modal('hide');
        
           });
           
           $('#continuar').click(function(){
               
               $('#myModal').modal('hide');
                 $.ajax({
        type: "POST",
        url: "admin/changerManagerCalendar.jsp",
        data: {"orden":ordene,
                "inicio":inicio,
                "fin":fin},
        success: function(response){ 
            alert(response);     
        },
        error: function(result) {
                    alert(result);
                }
    });
    
           });
        
          /*
        alert(event.title + " Alterado en:  " + event.end.format());
       
        if (!confirm("¿Es correcto?")) {
            revertFunc();
        }
        */

  

    
    }			
			

		});
            
          var posicion = $("#caja_flotante").offset();
         var posicion2 = $("#caja_flotante2").offset();
         
	    var margenSuperior = 15;
	     $(window).scroll(function() {
	         if ($(window).scrollTop() > posicion.top) {
	             $("#caja_flotante").stop().animate({
	                 marginTop: $(window).scrollTop() - posicion.top + margenSuperior
	             });
                     $("#caja_flotante2").stop().animate({
	                 marginTop: $(window).scrollTop() - posicion.top + margenSuperior
	             });
	         } else {
	             $("#caja_flotante").stop().animate({
	                 marginTop: 0
	             });
                    $("#caja_flotante2").stop().animate({
	                 marginTop: 0
	             });
	         };
                 
                 
                 
	     });  
             
             
                    </script>
 

                    <style>
                        #calendar {
                            width: 700px;
                            margin: 40px auto;
                        }
                        #descripcion{
                            font-size: 0.075em;
                        }
        
                    </style>
 
                    <script>
      
          
           $("#op").click(function(){
                        count += 1;
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
                            $("#caja_flotante2").hide();
                        });
                        //manita 
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
