<%-- 
    Document   : uploadFile
    Created on : 3/06/2014, 05:00:07 PM
    Author     : jose
--%>

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
    mysql_op mysql = new mysql_op();

    Statement stri, tim;
    String consultas = "load data local infile '" + pathServer + "" + archivo + "'   into table mixtasordenes  fields terminated by ',' lines terminated by '\n' IGNORE 1 ROWS (idmixtasordenes,Centro,Orden,clase_de_orden,Aviso,plan_mant_prev,@Fecha_entrada,@fecha_ini_ext,@fecha_in_real,@fecha_fin_extr,Fin_real_hora,pto_trab_res,grupo_plan_mant,ubicacion_tecnica,Equipo,Texto_breve,Estado,Total_coste_plan,Cost_total_real) set Fecha_entrada = STR_TO_DATE(@Fecha_entrada, '%d/%m/%Y') , fecha_ini_ext = STR_TO_DATE(@fecha_ini_ext, '%d/%m/%Y') ,fecha_in_real = STR_TO_DATE(@fecha_in_real, '%d/%m/%Y'),fecha_fin_extr = STR_TO_DATE(@fecha_fin_extr, '%d/%m/%Y');";
 // String consultas = "load data local infile '" + pathServer + "" + archivo + "'   into table mixtasordenes  fields terminated by ',' lines terminated by '\n' IGNORE 1 ROWS (idmixtasordenes,Centro,Orden,clase_de_orden,Aviso,plan_mant_prev,@Fecha_entrada,@fecha_ini_ext,@fecha_in_real,@fecha_fin_extr,Fin_real_hora,pto_trab_res,grupo_plan_mant,ubicacion_tecnica,Equipo,Texto_breve,Estado,Total_coste_plan,Cost_total_real) set Fecha_entrada = STR_TO_DATE(@Fecha_entrada, '%m/%d/%Y') , fecha_ini_ext = STR_TO_DATE(@fecha_ini_ext, '%m/%d/%Y') ,fecha_in_real = STR_TO_DATE(@fecha_in_real, '%m/%d/%Y'),fecha_fin_extr = STR_TO_DATE(@fecha_fin_extr, '%m/%d/%Y');";
    stri = mysql.getConexion().createStatement();
    tim = mysql.getConexion().createStatement();
    int x =0;
%> 

<%
    
       try{
        if (error != false) {
            stri.executeUpdate("DELETE FROM mixtasordenes ");
            stri.execute(consultas);
            tim.executeUpdate("DELETE FROM hora_actu");
            tim.execute("INSERT INTO pemexqbs.hora_actu (idhora_actu,hora) VALUES (null, '"+ t.format(cal.getTime())+"');");
            
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


 