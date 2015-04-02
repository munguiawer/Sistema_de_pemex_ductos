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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jose
 */
public class calendarDates {
    mysql_op con = new mysql_op();
    private Connection conexion;
    private Statement datos;
    public calendarDates() throws SQLException
    {
        
            String sql = "SELECT PemexQBs.Proyectos.Orden , PemexQBs.Proyectos.PtoTrbRes,PemexQBs.Areas.AREA,PemexQBs.Areas.Responsable,\n" +
"group_concat(distinct PemexQBs.Proyectos.PtoTbjoOp) as ayudantes ,PemexQBs.Proyectos.Textobreve,group_concat(distinct PemexQBs.Proyectos.Textbreveoperacion) as TextoOperacion,\n" +
"PemexQBs.Proyectos.Feentrada,PemexQBs.Proyectos.Finprogr,PemexQBs.proyectos.Incextr,PemexQBs.Proyectos.Finextr,PemexQBs.Proyectos.Finreal,PemexQBs.Proyectos.UbicacionTecnica,PemexQBs.Proyectos.Estado \n" +
"FROM PemexQBs.Proyectos inner join PemexQBs.Areas\n" +
"ON PemexQBs.Proyectos.PtoTrbRes = PemexQBs.Areas.Id\n" +
//"inner join pemexqbs.ubicaciones\n" +
//"ON pemexqbs.proyectos.UbicacionTecnica = pemexqbs.ubicaciones.idUbicacion\n" +
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
