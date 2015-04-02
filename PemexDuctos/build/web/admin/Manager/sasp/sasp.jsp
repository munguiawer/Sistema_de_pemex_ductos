<%-- 
    Document   : sasp
    Created on : 29/10/2014, 06:59:48 AM
    Author     : jose_l
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="subir" class="span12 ">

    <h3>Archivo: </h3>

    <br />
    <form id="upload" action="admin/Manager/sasp/uploadSASP.jsp" method="post"     enctype="multipart/form-data">
        <input class="button" class="btn btn-success" type="file" name="file" accept=".csv" />
        <br>
        <a  href="#" id="ir" class="btn btn-success" >
            <span class="fa  fa-upload"></span> Actualizar

        </a>
    </form>
</div>
<div id="respon" ></div>
<script>
    $("#ir").click(function(){
        
       $("#upload").submit(function(e)
{
 
    var formObj = $(this);
    var formURL = formObj.attr("action");
    var formData = new FormData(this);
    $.ajax({
        url: formURL,
    type: 'POST',
        data:  formData,
    mimeType:"multipart/form-data",
    contentType: false,
        cache: false,
        processData:false,
    success: function(data, textStatus, jqXHR)
    {
              $("#respon").html(data);
    },
     error: function(jqXHR, textStatus, errorThrown) 
     {
     }          
    });
    e.preventDefault(); //Prevent Default action. 
    e.unbind();
}); 

   $("#upload").submit();
 
});
</script>