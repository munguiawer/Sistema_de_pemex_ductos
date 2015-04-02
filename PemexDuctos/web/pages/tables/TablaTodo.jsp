

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="Calendar.calendarDates"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <% calendarDates cal = new calendarDates(); 
        
       
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat nor =new SimpleDateFormat("dd-MMMM-yyyy");
	%> 
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Tabla de todo el mes </h3>
                    </div><!-- /.box-header -->
                    <div class="box-body table-responsive">
                        <table id="example2" class="table table-bordered table-hover">
                           

                                <thead>
                                    <tr>

                                        <th>Orden</th>
                                        <th>PtoTrbRes</th>
                                        <th>Area</th>
                                        <th>Operarios</th>
                                        <th>Textobreve</th>
                                        <th>TextoOperacion</th>
                                        <th>Feentrada</th>
                                        <th>Incextr</th>
                                        <th>Finextr</th>
                                        <th>Finreal</th>
                                        <th>Fiprogra</th>
                                        <th>UbicacionTecnica</th>
                                        <th>Estatus</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% while (cal.getDatos().getResultSet().next()) {%>
                                    <tr>
                             
                                        <td><%= cal.getDatos().getResultSet().getInt("Orden")%></td>
                                        <td><%= cal.getDatos().getResultSet().getString("PtoTrbRes")%></td>
                                        <td><%= cal.getDatos().getResultSet().getString("Responsable")%></td>
                                        <td><%= cal.getDatos().getResultSet().getString("ayudantes")%></td>
                                        <td style="width: 10px" class=" sorting_asc"><%= cal.getDatos().getResultSet().getString("Textobreve")%></td>
                                        <td style="width: 10px" class=" sorting_asc" ><%= cal.getDatos().getResultSet().getString("TextoOperacion")%></td>
                                        <td><%= nor.format(cal.getDatos().getResultSet().getDate("Feentrada"))%></td>
                                        <td><%= nor.format(cal.getDatos().getResultSet().getDate("Incextr"))%></td>
                                        <td><%= nor.format(cal.getDatos().getResultSet().getDate("Finextr"))%></td>
                                        <% if(!f.format(cal.getDatos().getResultSet().getDate("Finreal")).toString().equals("0001-01-01")){ %>
                                        <td><%= nor.format(cal.getDatos().getResultSet().getDate("Finreal")) %></td>
                                        <% } else { %>
                                        <td></td>
                                        <% } %>
                                        <td><%= nor.format(cal.getDatos().getResultSet().getDate("Finprogr"))%></td>
                                        <td style="width: 10px" class=" sorting_asc"><%= cal.getDatos().getResultSet().getString("UbicacionTecnica")%></td>
                                         <td style="width: 10px" class=" sorting_asc"><%= cal.getDatos().getResultSet().getString("Estado")%></td> 
                                    </tr>
                                    <%}%>
                                </tbody>   



                            
                        </table>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->


            </div>
        </div>

        
        
  <% cal.getConexion().close(); %>
  <script type="text/javascript">
        
                $("#example1").dataTable();
                $('#example2').dataTable({
                    "bPaginate": true,
                    "bLengthChange": true,
                    "bFilter": true,
                    "bSort": true,
                    "bInfo": true,
                    "bAutoWidth": false
                
                   
                });
            
  </script>


