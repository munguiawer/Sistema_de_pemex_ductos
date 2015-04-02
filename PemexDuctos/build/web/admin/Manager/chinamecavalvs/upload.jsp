<%-- 
    Document   : upload
    Created on : 21/11/2014, 12:57:36 AM
    Author     : jose_l
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="conect_mysql.mysql_op"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
        //nombre del archivo
        String archivo = "";
        String pathServer = "C:/Users/jose_l/Documents/servidorcsv";
        String mes = request.getParameter("mes");
        String usuario = session.getAttribute("Usuario").toString();
        
        
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
           
        }
        mysql_op mysql = new mysql_op();

        PreparedStatement st;
        String consulta = "INSERT INTO chinapdf VALUES(null,?,?,?,?);";
       
       st = mysql.getConexion().prepareStatement(consulta);
       st.setString(1, mes);
       st.setString(2, archivo.trim());
       st.setString(3,pathServer+archivo.trim());
       st.setString(4, usuario);
    %> 

    <%
        try {
            
           
          
            st.executeUpdate();
           
          

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