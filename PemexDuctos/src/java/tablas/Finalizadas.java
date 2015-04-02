/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tablas;

import conect_mysql.mysql_op;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author jose
 */
public class Finalizadas {
   mysql_op con = new mysql_op();
    private Connection conexion;
    private Statement datos;
    private Statement ejecu;
    private Statement horaphoto;
    private Statement idAreas;
   private String[] palabras = null; 
 
   // private String estado;
    private int abierto,CTEC,CERRADO,ENejec;
    private String responsable;
    private String fecha;
    private ArrayList <String> Abierto = new ArrayList<String>();
    private ArrayList <String> ctec = new ArrayList<String>();
    private ArrayList <String> cerrado = new ArrayList<String>();
    private ArrayList <String> enejec = new ArrayList<String>();
    
    public Finalizadas(String responsable ,String fecha) throws SQLException
    {
       
        this.responsable = responsable;
        this.fecha = fecha;
        
            String sql = "SELECT PemexQBs.Proyectos2.Orden ,PemexQBs.Proyectos2.Estado\n" +
"FROM PemexQBs.Proyectos2 inner join PemexQBs.Areas\n" +
"ON PemexQBs.Proyectos2.PtoTrbRes = PemexQBs.Areas.Id\n" +
"where pemexqbs.proyectos2.PtoTrbRes = '"+responsable+"' and  pemexqbs.proyectos2.Finextr < '"+fecha+"'  \n" +
"\n" +
"GROUP BY 1;";
            String sql2 ="SELECT * FROM pemexqbs.areas ;";
            String sqlejec = "SELECT PemexQBs.Proyectos2.Orden ,PemexQBs.Proyectos2.Estado\n" +
"FROM PemexQBs.Proyectos2 inner join PemexQBs.Areas\n" +
"ON PemexQBs.Proyectos2.PtoTrbRes = PemexQBs.Areas.Id\n" +
"where pemexqbs.proyectos2.PtoTrbRes = '"+responsable+"' and  pemexqbs.proyectos2.Finextr >= '"+fecha+"'  \n" +
"\n" +
"GROUP BY 1;";
           
            
            conexion = con.getConexion();
            datos = conexion.createStatement();
           
            idAreas = conexion.createStatement();
            idAreas.executeQuery(sql2);
            ejecu = conexion.createStatement();
            ejecu.executeQuery(sqlejec);
            datos.executeQuery(sql);
           
            while(datos.getResultSet().next())
            {
                String word = datos.getResultSet().getString("Estado").trim();
                palabras = word.split(" ");
                
                if(palabras[0].equals("CTEC")  )
                {
                    ctec.add(datos.getResultSet().getString("Estado"));
                }else
                if(palabras[0].equals("ABIE"))
                {
                    Abierto.add(datos.getResultSet().getString("Estado") );
                } else
                if( palabras[0].equals("LIB.")  )
                {
                    Abierto.add(datos.getResultSet().getString("Estado"));
                }else
                if(palabras[0].equals("CERR")  )
                {
                    cerrado.add(datos.getResultSet().getString("Estado"));
                }
                
            }
            
            while(ejecu.getResultSet().next())
            {
                ENejec++;
            }
       
            abierto = Abierto.size();
            
            CERRADO = cerrado.size();
            CTEC = ctec.size();
            
    }
    
    

    public int getAbierto() {
        return abierto;
    }

    public Connection getConexion() {
        return conexion;
    }

    public Statement getDatos() {
        return datos;
    }

    public Statement getIdAreas() {
        return idAreas;
    }

    public int getCTEC() {
        return CTEC;
    }

    public ArrayList<String> getABierto() {
        return Abierto;
    }

    public ArrayList<String> getCtec() {
        return ctec;
    }

    public int getCERRADO() {
        return CERRADO;
    }

    public ArrayList<String> getCerrado() {
        return cerrado;
    }

    public int getENejec() {
        return ENejec;
    }

    public ArrayList<String> getEnejec() {
        return enejec;
    }

    

   
    
    
}