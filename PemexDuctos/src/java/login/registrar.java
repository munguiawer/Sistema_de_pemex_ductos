/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author jose_l
 */
public class registrar {
    private Connection con;
    private mysql_login cx;
    private String sql;
    private int error;
    private PreparedStatement ps = null;
    public registrar(){
     
      
    
}
     public registrar(String nombre,String password){
    
        sql= "INSERT INTO usuarios  VALUES (null, ?, ?, ?);";
        try{
            cx = new mysql_login();
            con = cx.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2,password);
            ps.setInt(3, 2);
            ps.executeUpdate();
             
            
            
            
        }catch(SQLException e){
           error = e.getErrorCode();
            
    }
        
    
    }

    public int getError() {
        return error;
    }
     
     
}
