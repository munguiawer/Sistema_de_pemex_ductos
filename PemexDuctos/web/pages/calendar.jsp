<%-- 
    Document   : calendar
    Created on : 12/07/2014, 12:32:45 PM
    Author     : jose
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="Calendar.calendarDates"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    
   


<!-- Main content -->




                <!-- THE CALENDAR -->
                <div id="calendar"></div>
                <div id="cal_event"></div>
                <div class="loader"></div>

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
           $('#myModalLabel').html(calEvent.title);               
           $('#Description').html(calEvent.description);
           $('#myModal').modal('show');
           // end modal ----------------------------------------
       }, //when click end ------------------------------------------------------------>>
       editable: false,
       events:"CalendarJsonServlet"
             
		});
                    </script>
 
                    <style>
                        #calendar {
                width: 900px;
                margin: 40px auto;
        }
                    </style>

 
                   