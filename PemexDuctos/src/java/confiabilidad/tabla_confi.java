/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package confiabilidad;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author jose_l
 */
public class tabla_confi {
Connection conexion;
mysql_conf mysql = new mysql_conf();
String sql;
Statement stmnt;
ArrayList<Double> planeado = new ArrayList<Double>();
ArrayList<Double> realizado = new ArrayList<Double>();
    public tabla_confi() {
        
      
       conexion = mysql.getConexion();
       sql = "SELECT planeado , realizado FROM confiabilidad.confiabilidad;";
       try{
       stmnt = conexion.createStatement();
       stmnt.executeQuery(sql);
       while(stmnt.getResultSet().next())
       {
           planeado.add(stmnt.getResultSet().getDouble("planeado"));
           realizado.add(stmnt.getResultSet().getDouble("realizado"));
       }
       }catch(SQLException e){}
       
    }

    public Connection getConexion() {
        return conexion;
    }

    public ArrayList<Double> getPlaneado() {
        return planeado;
    }

    public ArrayList<Double> getRealizado() {
        return realizado;
    }
    
    
    
    
    
    
}
