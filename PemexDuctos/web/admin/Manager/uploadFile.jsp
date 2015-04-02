<%-- 
    Document   : uploadFile
    Created on : 3/06/2014, 05:00:07 PM
    Author     : jose
--%>

<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="conect_mysql.mysql_op"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


    <%
        //nombre del archivo
        String archivo = "";
        String pathServer = "C:/Users/jose_l/Documents/servidorcsv/";
        boolean error = true;
        try {
            /*FileItemFactory es una interfaz para crear FileItem*/
            FileItemFactory file_factory = new DiskFileItemFactory();

            /*ServletFileUpload esta clase convierte los input file a FileItem*/
            ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
            /*sacando los FileItem del ServletFileUpload en una lista */
            List items = servlet_up.parseRequest(request);

            for (int i = 0; i < items.size(); i++) {
                /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
                FileItem item = (FileItem) items.get(i);
                /*item.isFormField() false=input file; true=text field*/
                if (!item.isFormField()) { 
                    /*cual sera la ruta al archivo en el servidor*/
                    
                    File archivo_server = new File(pathServer  + item.getName());
                    /*y lo escribimos en el servido*/
                    item.write(archivo_server);
                    out.print("<div class='alert alert-info alert-dismissable'>");
                    out.print("Nombre --> " + item.getName());
                    out.print("<br> Tipo --> " + item.getContentType());
                    out.print("<br> tamaño --> " + (item.getSize() / 1240) + "KB");
                    out.print("<br>");
                    out.print("</br>");
                    archivo = item.getName();
                }
            }
        
                
            
            
            

        } catch (Exception ex) {
         
            out.print("<div class='alert alert-warning alert-dismissables'>");
            out.println("error: ningun archivo seleccionado ");
            out.print("</br>");
            error = false;
        }
        mysql_op mysql = new mysql_op();

        Statement st,st2;
       String consulta = "load data local infile '"+pathServer+"" + archivo + "'   into table Proyectos  fields terminated by ',' lines terminated by '\n' IGNORE 1 ROWS (idProyectos,PlMantPrv,PosPM,PtoTrbRes,PtoTbjoOp,Orden,Cl,Textobreve,Textbreveoperacion,UbicacionTecnica,@Incextr,Feinreal,fecFinReal,@Feentrada,@Finextr,@Liber,@Finreal,@Finprogr,Estado) set Incextr = STR_TO_DATE(@Incextr, '%m/%d/%Y'),Feinreal=NULL,fecFinReal=NULL,Feentrada= STR_TO_DATE(@Feentrada, '%m/%d/%Y'), Finextr = STR_TO_DATE(@Finextr, '%m/%d/%Y') , Liber = STR_TO_DATE(@Liber, '%m/%d/%Y'),Finreal = STR_TO_DATE(@Finreal, '%m/%d/%Y') , Finprogr = STR_TO_DATE(@Finprogr, '%m/%d/%Y');";
       String consulta2 = "load data local infile '"+pathServer+""  + archivo + "'   into table Proyectos2  fields terminated by ',' lines terminated by '\n' IGNORE 1 ROWS (idProyectos,PlMantPrv,PosPM,PtoTrbRes,PtoTbjoOp,Orden,Cl,Textobreve,Textbreveoperacion,UbicacionTecnica,@Incextr,Feinreal,fecFinReal,@Feentrada,@Finextr,@Liber,@Finreal,@Finprogr,Estado) set Incextr = STR_TO_DATE(@Incextr, '%m/%d/%Y'),Feinreal=NULL,fecFinReal=NULL,Feentrada= STR_TO_DATE(@Feentrada, '%m/%d/%Y'), Finextr = STR_TO_DATE(@Finextr, '%m/%d/%Y') , Liber = STR_TO_DATE(@Liber, '%m/%d/%Y'),Finreal = STR_TO_DATE(@Finreal, '%m/%d/%Y') , Finprogr = STR_TO_DATE(@Finprogr, '%m/%d/%Y');";
       st = mysql.getConexion().createStatement();
       st2 = mysql.getConexion().createStatement();
    %> 

    <%
        try {
            
            if(error!=false){
                st.executeUpdate("DELETE FROM Proyectos ");
            st.execute(consulta);
           st2.executeUpdate("DELETE FROM Proyectos2");
            st2.execute(consulta2);
            }
           
          

        } catch (SQLException ex) {

    %>
    <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h2 class="modal-title" id="myModalLabel">Errores comunes</h2>
                            </div>
                           <div class="modal-body" id="Description">
                                <h1>1.- No son ordenes con plan!!</h1>
                                <br></br>
                                <h4><p>2.- Asegúrese que el formato original coincida con este documento (mismo número de columnas, que las columnas contengan el tipo de dato original las fechas donde van fechas números donde van números etc)</p></h4>
                            </div>

                        </div>
                    </div>
                </div>
    <div class="alert alert-danger alert-dismissable">

    <i class="fa fa-ban"></i>
    <button class="close" aria-hidden="true" data-dismiss="alert" type="button">

        cerrar

    </button>
    <b></b>
      
       <%= ex %>

</div>
    




    <%
           
        }

       mysql.getConexion().close();
    %>
    
    
    <script type="text/javascript">
        $('#myModal').modal('show');
    </script>