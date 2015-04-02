/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Calendar;

import conect_mysql.mysql_op;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author jose
 */
public class CalendarDates2 {
    mysql_op con = new mysql_op();
    private Connection conexion;
    private Statement datos;
    public CalendarDates2()throws SQLException
    {
         String sql = "SELECT PemexQBs.Proyectos2.Orden ,pemexqbs.ubicaciones.Denominacion, PemexQBs.Proyectos2.PtoTrbRes,PemexQBs.Areas.AREA,PemexQBs.Areas.Responsable,\n" +
"group_concat(distinct PemexQBs.Proyectos2.PtoTbjoOp) as ayudantes ,PemexQBs.Proyectos2.Textobreve,group_concat(distinct PemexQBs.Proyectos2.Textbreveoperacion) as TextoOperacion,\n" +
"PemexQBs.Proyectos2.Feentrada,PemexQBs.Proyectos2.Finprogr,PemexQBs.proyectos2.Incextr,PemexQBs.Proyectos2.Finextr,PemexQBs.Proyectos2.Finreal,PemexQBs.Proyectos2.UbicacionTecnica,PemexQBs.Proyectos2.Estado\n" +
"FROM PemexQBs.Proyectos2 inner join PemexQBs.Areas\n" +
"ON PemexQBs.Proyectos2.PtoTrbRes = PemexQBs.Areas.Id\n" + 
"inner join pemexqbs.ubicaciones\n"+  
"ON PemexQBs.Proyectos2.UbicacionTecnica = pemexqbs.ubicaciones.idUbicacion\n"+                 
"GROUP BY 1;";
            conexion = con.getConexion();
            datos = conexion.createStatement();
            datos.executeQuery(sql);
           /* while(datos.getResultSet().next()){
            ubicacion = datos.getResultSet().getString("UbicacionTecnica");
            }
                   */
    }
    public CalendarDates2(String area) throws SQLException
    {
        
            String sql = "SELECT PemexQBs.Proyectos2.Orden,pemexqbs.ubicaciones.Denominacion,PemexQBs.Proyectos2.PtoTrbRes,PemexQBs.Areas.AREA,PemexQBs.Areas.Responsable,\n" +
"group_concat(distinct PemexQBs.Proyectos2.PtoTbjoOp) as ayudantes ,PemexQBs.Proyectos2.Textobreve,group_concat(distinct PemexQBs.Proyectos2.Textbreveoperacion) as TextoOperacion,\n" +
"PemexQBs.Proyectos2.Feentrada,PemexQBs.Proyectos2.Finprogr,PemexQBs.proyectos2.Incextr,PemexQBs.Proyectos2.Finextr,PemexQBs.Proyectos2.Finreal,PemexQBs.Proyectos2.UbicacionTecnica,PemexQBs.Proyectos2.Estado\n" +
"FROM PemexQBs.Proyectos2 inner join PemexQBs.Areas\n" +
"ON PemexQBs.Proyectos2.PtoTrbRes = PemexQBs.Areas.Id\n" +
"inner join pemexqbs.ubicaciones\n"+  
"ON PemexQBs.Proyectos2.UbicacionTecnica = pemexqbs.ubicaciones.idUbicacion\n"+                    
" WHERE PemexQBs.Areas.AREA = '"+area+"'\n"+                      
"GROUP BY 1;";
            conexion = con.getConexion();
            datos = conexion.createStatement();
            datos.executeQuery(sql);
           /* while(datos.getResultSet().next()){
            ubicacion = datos.getResultSet().getString("UbicacionTecnica");
            }
                   */
            
            
       
    }

    public Connection getConexion() {
        return conexion;
    }

    public Statement getDatos() {
        return datos;
    }

   
}
