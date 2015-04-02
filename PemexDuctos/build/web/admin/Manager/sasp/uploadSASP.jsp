<%@page import="conect_mysql.mysqlSASP"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
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
     SimpleDateFormat t = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Calendar cal = Calendar.getInstance();
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

                File archivo_server = new File(pathServer + item.getName());
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
    mysqlSASP mysql = new mysqlSASP();

    Statement stri;
    String consultas = "load data local infile '" + pathServer + "" + archivo + "'   into table datos  fields terminated by ',' lines terminated by '\n' IGNORE 1 ROWS (iddatos,centro_de_trabajo,guia_Tecnica,indicador,descripsion,periodo,enero,febrero,marzo,abril,mayo,junio,julio,agosto,septiembre,octubre,noviembre,diciembre);";
    stri = mysql.getConexion().createStatement();
%> 

<%
    
       try{
        if (error != false) {
            stri.executeUpdate("DELETE FROM datos ");
            stri.execute(consultas);
            
            
        }
       }catch(SQLException ex){
  
             
           %>
           
           <script>
              alert("mal");
           </script>
           <%
       }
    

    mysql.getConexion().close();

%>


 