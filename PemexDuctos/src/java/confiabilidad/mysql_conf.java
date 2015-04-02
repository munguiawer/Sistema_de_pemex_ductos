/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package confiabilidad;

import conect_mysql.mysql_op;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jose_l
 */
public class mysql_conf {
private Connection conexion = null;
    public mysql_conf() {
        try {
            Class.forName("com.mysql.jdbc.Driver"); 
            try {
              conexion =  DriverManager.getConnection("jdbc:mysql://localhost:3306/confiabilidad?useUnicode=yes&characterEncoding=UTF-8&zeroDateTimeBehavior=round", "root", "Alvar0");
            } catch (SQLException ex) {
                Logger.getLogger(mysql_op.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(mysql_op.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     public Connection getConexion() {
        
        return conexion;
    }
    
}
