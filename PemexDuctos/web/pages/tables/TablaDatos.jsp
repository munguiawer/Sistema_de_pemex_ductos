<%-- 
    Document   : TablaDatos
    Created on : 26/07/2014, 07:24:08 PM
    Author     : jose
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="tablas.Finalizadas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat t = new SimpleDateFormat("dd-MM-yyyy");
    DateTime hoy = new DateTime();
    String FECHA_HOY = f.format(hoy.toDate()).toString();
    String FECHA_TITULO = t.format(hoy.toDate()).toString();
    Finalizadas SCOR00 = new Finalizadas("SCOR00", FECHA_HOY);
    Finalizadas SCOR02 = new Finalizadas("SCOR00", FECHA_HOY);
    Finalizadas SCOR03 = new Finalizadas("SCOR00", FECHA_HOY);
    Finalizadas SCOR04 = new Finalizadas("SCOR00", FECHA_HOY);
    Finalizadas dtos = null;
    int OPsumAb = 0, OPsumctc = 0, OPsumSubt = 0, OPsumCerr = 0, OPsumEjec = 0;
    int MANsumAb = 0, MANsumctc = 0, MANsumSubt = 0, MANsumCerr = 0, MANsumEjec = 0;
    int SEGsumAb = 0, SEGsumctc = 0, SEGsumSubt = 0, SEGsumCerr = 0, SEGsumEjec = 0;
    int UATsumAb = 0, UATsumctc = 0, UATsumSubt = 0, UATsumCerr = 0, UATsumEjec = 0;   %>



    <div id="ordeneshoy" class="panel panel panel-primary col-md-10   ">
    <!-- Default panel contents -->
    <div class="panel-heading"> <h3>Actualizada al: &nbsp; <%= FECHA_TITULO %></h3> </div>
    <div class="panel-body">
         <!-- Table -->
         <table id="customers" class="table" >


        <thead>
            <tr>

                <th>Responsable</th>
                <th>ABIE/LIB</th>
                <th>CTEC</th>
                <th>SUBTOTAL</th>
                <th>CERR</th>
                <th>EN EJECUCION</th>
                <th>TOTAL</th>
            </tr>
        </thead>

        <tbody>
            <!-- OPERACION SECCION -->
            <%while(SCOR00.getIdAreas().getResultSet().next()){ %>
            <% if(SCOR00.getIdAreas().getResultSet().getString("AREA").trim().equals("OPERACION")){ %>
            <tr>
                <td><%= SCOR00.getIdAreas().getResultSet().getString("Id") %></td>
                <% dtos = new Finalizadas(SCOR00.getIdAreas().getResultSet().getString("Id").toString(),FECHA_HOY); %>
                <td><%= dtos.getAbierto()%></td>
                <% OPsumAb +=dtos.getAbierto(); %>
                <td><%= dtos.getCTEC() %></td>
                <% OPsumctc +=dtos.getCTEC(); %>
                <td><%= dtos.getCTEC() + dtos.getAbierto()  %></td>
                <% OPsumSubt += dtos.getCTEC() + dtos.getAbierto(); %>
                <td><%= dtos.getCERRADO() %></td>
                <% OPsumCerr += dtos.getCERRADO(); %>
                <td> <%= dtos.getENejec() %> </td> 
                <% OPsumEjec += dtos.getENejec();  %>
                <td> <%= dtos.getENejec() + dtos.getCTEC() + dtos.getAbierto()+dtos.getCERRADO() %> </td> 
            </tr> 
            <%}%>
            <% } %>
        <td class="success"><h4>OPERACION</h4></td>
        <td class="success"><%= OPsumAb %></td>
        <td class="success"><%=OPsumctc%></td>
        <td class="success"><%= OPsumSubt %></td>
        <td class="success"><%= OPsumCerr %></td>
        <td class="success"><%= OPsumEjec %></td>
        <td class="success"><%= OPsumSubt+OPsumEjec+OPsumCerr %></td>
        <!-- MANTENIMIENTO SECCION -->
        <%while(SCOR02.getIdAreas().getResultSet().next()){ %>
       
            <% if(SCOR02.getIdAreas().getResultSet().getString("AREA").trim().equals("MANTENIMIENTO")){ %>
        <tr>
            <td><%= SCOR02.getIdAreas().getResultSet().getString("Id") %></td>
            <% dtos = new Finalizadas(SCOR02.getIdAreas().getResultSet().getString("Id").toString(),FECHA_HOY); %>
            <td><%= dtos.getAbierto()%></td>
            <% MANsumAb +=dtos.getAbierto(); %>
            <td><%= dtos.getCTEC() %></td>
            <% MANsumctc +=dtos.getCTEC(); %>
            <td><%= dtos.getCTEC() + dtos.getAbierto()  %></td>
            <% MANsumSubt += dtos.getCTEC() + dtos.getAbierto(); %>
            <td><%= dtos.getCERRADO() %></td>
            <% MANsumCerr += dtos.getCERRADO(); %>
            <td> <%= dtos.getENejec() %> </td>  
            <% MANsumEjec += dtos.getENejec();  %>
            <td> <%= dtos.getENejec() + dtos.getCTEC() + dtos.getAbierto()+dtos.getCERRADO() %>  </td>
        </tr>
        <%}%>
        </tr>
        <%}%>
        <td class="success"><h4>MANTENIMIENTO</h4></td>
        <td class="success"><%= MANsumAb %></td>
        <td class="success"><%=MANsumctc%></td>
        <td class="success"><%= MANsumSubt %></td>
        <td class="success"><%= MANsumCerr %></td>
        <td class="success"><%= MANsumEjec %></td>
        <td class="success"><%= MANsumSubt+MANsumEjec+MANsumCerr %></td>
        <!-- SEGURIDAD SECCION -->
        <%while(SCOR03.getIdAreas().getResultSet().next()){ %>
        
            <% if(SCOR03.getIdAreas().getResultSet().getString("AREA").trim().equals("SEGURIDAD")){ %>
        <tr>
            <td><%= SCOR03.getIdAreas().getResultSet().getString("Id") %></td>
            <% dtos = new Finalizadas(SCOR03.getIdAreas().getResultSet().getString("Id").toString(),FECHA_HOY); %>
            <td><%= dtos.getAbierto()%></td>
            <% SEGsumAb +=dtos.getAbierto(); %>
            <td><%= dtos.getCTEC() %></td>
            <% SEGsumctc +=dtos.getCTEC(); %>
            <td><%= dtos.getCTEC() + dtos.getAbierto()  %></td>
            <% SEGsumSubt += dtos.getCTEC() + dtos.getAbierto(); %>
            <td><%= dtos.getCERRADO() %></td>
            <% SEGsumCerr += dtos.getCERRADO(); %>
            <td> <%= dtos.getENejec() %> </td>  
            <% SEGsumEjec += dtos.getENejec();  %>
           <td> <%= dtos.getENejec() + dtos.getCTEC() + dtos.getAbierto()+dtos.getCERRADO() %>  </td>
        </tr>
        <%}%>
        </tr>
        <%}%>
        <td class="success"><h4>SIPA</h4></td>
        <td class="success"><%= SEGsumAb %></td>
        <td class="success"><%=SEGsumctc%></td>
        <td class="success"><%= SEGsumSubt %></td>
        <td class="success"><%= SEGsumCerr %></td>
        <td class="success"><%= SEGsumEjec %></td>
        <td class="success"><%= SEGsumSubt+SEGsumEjec+SEGsumCerr %></td>
        <!-- UAT SECCION -->
        <%while(SCOR04.getIdAreas().getResultSet().next()){ %>
        
            <% if(SCOR04.getIdAreas().getResultSet().getString("AREA").trim().equals("UAT")){ %>
        <tr>
            <td><%= SCOR04.getIdAreas().getResultSet().getString("Id") %></td>
            <% dtos = new Finalizadas(SCOR04.getIdAreas().getResultSet().getString("Id").toString(),FECHA_HOY); %>
            <td><%= dtos.getAbierto()%></td>
            <% UATsumAb +=dtos.getAbierto(); %>
            <td><%= dtos.getCTEC() %></td>
            <% UATsumctc +=dtos.getCTEC(); %>
            <td><%= dtos.getCTEC() + dtos.getAbierto()  %></td>
            <% UATsumSubt += dtos.getCTEC() + dtos.getAbierto(); %>
            <td><%= dtos.getCERRADO() %></td>
            <% UATsumCerr += dtos.getCERRADO(); %>
            <td> <%= dtos.getENejec() %> </td> 
            <% UATsumEjec += dtos.getENejec();  %>
            <td> <%= dtos.getENejec() + dtos.getCTEC() + dtos.getAbierto()+dtos.getCERRADO() %>  </td>
        </tr>
        <%}%>
        </tr>
        <%}%>
        <td class="success"><h4>UAT</h4></td>
        <td class="success"><%= UATsumAb %></td>
        <td class="success"><%=UATsumctc%></td>
        <td class="success"><%= UATsumSubt %></td>
        <td class="success"><%= UATsumCerr %></td>
        <td class="success"><%= UATsumEjec %></td>
        <td class="success"><%= UATsumSubt+UATsumEjec+UATsumCerr %></td>
        </tbody>   




    </table>
    </div>
        

   

</div>
        
        
        <div class="col-xs-1">
            <button type="button" onclick="tableToExcel('ordeneshoy', 'W3C Example Table')" class="btn btn-success btn-lg">
                <span class="glyphicon  glyphicon-floppy-disk"></span> Copiar a excel
            </button>
           <!-- <input type="button" onclick="tableToExcel('ordeneshoy', 'W3C Example Table')" value="Export to Excel"value=" Export Table data into Excel " />--->
        </div>
         
    
          
               
            
            
        </table>
    </div>
    </div>
    <br>
    <br>
    <br>
     <div class="panel panel panel-default col-md-3">
        <div class="panel-heading"> OPERACION</div>
    <div class="panel-body">
        <div id="Opera"></div>
     
        </pre>
    </div>
        <div class="panel-footer">
            <h4>Total: &nbsp; <%= OPsumSubt+OPsumEjec%> &nbsp; Ordenes</h4> 
        </div>
    </div>
    <div class="panel panel panel-default col-md-3">
        <div class="panel-heading"> MANTENIMIENTO</div>
    <div class="panel-body">
        <div id="graph"></div>
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
            <h4>Total: &nbsp; <%= MANsumSubt+MANsumEjec%> &nbsp; Ordenes</h4> 
        </div>
    </div>
        
         <div class="panel panel panel-default col-md-3">
        <div class="panel-heading"> SIPA</div>
    <div class="panel-body">
        <div id="sipa"></div>
     
        </pre>
    </div>
        <div class="panel-footer">
            <h4>Total: &nbsp; <%= SEGsumSubt+SEGsumEjec%> &nbsp; Ordenes</h4> 
        </div>
    </div>
   
        <div class="panel panel panel-default col-md-3">
        <div class="panel-heading"> UAT</div>
    <div class="panel-body">
        <div id="uat"></div>
     
        </pre>
    </div>
        <div class="panel-footer">
            <h4>Total: &nbsp; <%= UATsumSubt+UATsumEjec%> &nbsp; Ordenes</h4> 
        </div>
    </div>


   


<script>
 var tableToExcel = (function() {
      var uri = 'data:application/vnd.ms-excel;base64,'
        , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
        , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
        , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
      return function(table, name) {
        if (!table.nodeType) table = document.getElementById(table)
        var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
        window.location.href = uri + base64(format(template, ctx))
      }
    })()
</script>
<script>
    Morris.Donut({
  element: 'graph',
  data: [
    {value: ('<%= MANsumAb %>'), label: 'Lib,Abier '},
    {value: ('<%= MANsumctc  %>'), label: 'Ctec'},
    {value: ('<%= MANsumEjec  %>'), label: 'Ejecucion'}
   
  ],
  backgroundColor: '#ccc',
  labelColor: '#060',
  colors: [
    '#0BA462',
    '#39B580',
    '#67C69D'
    
  ],
  formatter: function (x) { return x + " Ordenes"}
});
Morris.Donut({
  element: 'Opera',
  data: [
    {value: ('<%= OPsumAb %>'), label: 'Lib,Abier '},
    {value: ('<%= OPsumctc  %>'), label: 'Ctec'},
    {value: ('<%= OPsumEjec  %>'), label: 'Ejecucion'}
   
  ],
  backgroundColor: '#ccc',
  labelColor: '#060',
  colors: [
    '#0BA462',
    '#39B580',
    '#67C69D'
    
  ],
  formatter: function (x) { return x + " Ordenes"}
});
Morris.Donut({
  element: 'sipa',
  data: [
    {value: ('<%= SEGsumAb %>'), label: 'Lib,Abier '},
    {value: ('<%= SEGsumctc  %>'), label: 'Ctec'},
    {value: ('<%= SEGsumEjec  %>'), label: 'Ejecucion'}
   
  ],
  backgroundColor: '#ccc',
  labelColor: '#060',
  colors: [
    '#0BA462',
    '#39B580',
    '#67C69D'
    
  ],
  formatter: function (x) { return x + " Ordenes"}
});

Morris.Donut({
  element: 'uat',
  data: [
    {value: ('<%= UATsumAb %>'), label: 'Lib,Abier '},
    {value: ('<%= UATsumctc  %>'), label: 'Ctec'},
    {value: ('<%= UATsumEjec  %>'), label: 'Ejecucion'}
   
  ],
  backgroundColor: '#ccc',
  labelColor: '#060',
  colors: [
    '#0BA462',
    '#39B580',
    '#67C69D'
    
  ],
  formatter: function (x) { return x + " Ordenes"}
});
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



    <% SCOR00.getConexion().close(); %>  
    <% SCOR02.getConexion().close(); %>
    <% SCOR03.getConexion().close(); %> 
    <% SCOR04.getConexion().close(); %> 
    <% dtos.getConexion().close(); %>      


