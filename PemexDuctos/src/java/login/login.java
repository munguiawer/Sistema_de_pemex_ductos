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
public class login {
   private String nombre;
   private String Rol;
   private String error = "";
   private int IdRol;
   private Connection conexion;
   private String sql;
   private PreparedStatement pstatement = null;
   private mysql_login cnx = new mysql_login();
   public login()
   {
       
   }
    public login(String nombre, String password){
        
        
        try{
         conexion = cnx.getConexion();
         sql= "SELECT administrador.usuarios.Nombre , administrador.roles.Tipo , administrador.roles.idRoles FROM administrador.usuarios inner join administrador.roles\n" +
"on administrador.usuarios.Rol = administrador.roles.idRoles\n" +
"where administrador.usuarios.Nombre = ? and  administrador.usuarios.password = ?;";
         
         
             
             pstatement = conexion.prepareStatement(sql);
            pstatement.setString(1, nombre);
            pstatement.setString(2, password);
             pstatement.executeQuery();
            while( pstatement.getResultSet().next())
            {
                this.nombre = pstatement.getResultSet().getString("Nombre");
                this.Rol    = pstatement.getResultSet().getString("Tipo");
                this.IdRol  = pstatement.getResultSet().getInt("idRoles");
            }
         
        }catch (SQLException e){
           this.error = e.toString();
        }
        
        
    }

    public String getNombre() {
        return nombre;
    }

  

    public String getRol() {
        return Rol;
    }


    public int getIdRol() {
        return IdRol;
    }

    public String getError() {
        return error;
    }

   

  
    
}
