/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package correo;

import conect_mysql.mysql_op;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author jose_l
 */
public class calendarmixto {
    mysql_op con = new mysql_op();
    private Connection conexion;
    private Statement datos;
    private Statement ejecu;
    private Statement horaP;
    private Statement idAreas;
    private String[] palabras = null;
    private String variable;
    private Timestamp horaphoto;
    String grupo_res;
    String grupo_com;
    String gpo;
    // private String estado;
    private int abierto, CTEC, CERRADO, ENejec;
    private String responsable;
    private String fecha;
    private ArrayList<String> Abierto = new ArrayList<String>();
    private ArrayList<String> Error = new ArrayList<String>(); //ya
    private ArrayList<String> ctec = new ArrayList<String>();
    private ArrayList<String> cerrado = new ArrayList<String>();
    private ArrayList<String> Errorestatus = new ArrayList<String>();
    private ArrayList<String> ErrorCosto20 = new ArrayList<String>();
    private ArrayList<String> ErrorTextobrev = new ArrayList<String>();//ya
    private ArrayList<String> ErrorsinAvisoA1 = new ArrayList<String>();
    private ArrayList<String> ErrorGrup = new ArrayList<String>(); //  ya
    private ArrayList<String> ErrorCero = new ArrayList<String>();  // ya
    private ArrayList<String> ErrorIncum = new ArrayList<String>(); // ya
    private ArrayList<String> enejec = new ArrayList<String>();

     public calendarmixto(String responsable) throws SQLException {

        this.responsable = responsable;
     

        String sql = "SELECT PemexQBs.mixtasordenes.Orden,PemexQBs.mixtasordenes.Cost_total_real,PemexQBs.mixtasordenes.Total_coste_plan,PemexQBs.mixtasordenes.Texto_breve,PemexQBs.mixtasordenes.pto_trab_res,pemexqbs.mixtasordenes.Total_coste_plan,PemexQBs.mixtasordenes.grupo_plan_mant,PemexQBs.mixtasordenes.Estado\n"
                + "FROM PemexQBs.mixtasordenes inner join PemexQBs.Areas\n"
                + "ON PemexQBs.mixtasordenes.pto_trab_res = PemexQBs.Areas.Id\n"
                + "where pemexqbs.mixtasordenes.pto_trab_res = '" + responsable + "' \n"
                + "GROUP BY 1;";

        String sql2 = "SELECT * FROM pemexqbs.areas ;";

        String sqlejec = "SELECT PemexQBs.mixtasordenes.Orden ,PemexQBs.mixtasordenes.Estado\n"
                + "FROM PemexQBs.mixtasordenes inner join PemexQBs.Areas\n"
                + "ON PemexQBs.mixtasordenes.pto_trab_res = PemexQBs.Areas.Id\n"
                + "where pemexqbs.mixtasordenes.pto_trab_res = '" + responsable + "' \n"
                + "\n"
                + "GROUP BY 1;";
        String sqlHP = "SELECT * FROM pemexqbs.hora_actu;";
        conexion = con.getConexion();
        datos = conexion.createStatement();
        idAreas = conexion.createStatement();
        idAreas.executeQuery(sql2);
        ejecu = conexion.createStatement();
        ejecu.executeQuery(sqlejec);
        datos.executeQuery(sql);
        horaP = conexion.createStatement();
        horaP.executeQuery(sqlHP);

        while (datos.getResultSet().next()) {
            String word = datos.getResultSet().getString("Estado").trim();
            String ptoRes = datos.getResultSet().getString("pto_trab_res");
            grupo_res = datos.getResultSet().getString("grupo_plan_mant").trim();
            grupo_com = gpopln(ptoRes).trim();
            variable = grupo_com + " " + grupo_res;
            palabras = word.split(" ");
            //detectar errores para Grupo planificador
            if (!grupo_res.equals(grupo_com) && !grupo_com.equals("NAN")) { // diferente de NAN por que utc no no tiene grupo planificador y saldria error si no lo consideramos

                Error.add(datos.getResultSet().getString("Orden"));
                ErrorGrup.add(datos.getResultSet().getString("Orden"));

            }
            if (palabras[0].equals("CTEC")) {
                ctec.add(datos.getResultSet().getString("Estado"));
            }
            if (palabras[0].equals("ABIE")) {
                Abierto.add(datos.getResultSet().getString("Estado"));
            }
            if (palabras[0].equals("LIB.")) {
                Abierto.add(datos.getResultSet().getString("Estado"));
            }
            if (palabras[0].equals("CERR")) {
                cerrado.add(datos.getResultSet().getString("Estado"));
            }  // detectar errores para incumplimientos
            if (palabras[1].equals("NOTP") || palabras[1].equals("NEJE") || palabras[1].equals("PTBO")) {
                Error.add(datos.getResultSet().getString("Orden"));
                ErrorIncum.add(datos.getResultSet().getString("Orden"));
                
                
            }  // detectar errores para coste total 0
            if (datos.getResultSet().getString("Total_coste_plan").equals("0")) {
                Error.add(datos.getResultSet().getString("Orden"));
                ErrorCero.add(datos.getResultSet().getString("Orden"));
            }

            // detectar errores de >20%
            if((datos.getResultSet().getFloat("Total_coste_plan")*.20) < (datos.getResultSet().getFloat("Total_coste_plan") - datos.getResultSet().getFloat("Cost_total_real")) && datos.getResultSet().getFloat("Cost_total_real") != 0)
            {
                 Error.add(datos.getResultSet().getString("Orden"));
                ErrorCosto20.add(datos.getResultSet().getString("Orden"));
            }
            // texto_breve error
           if(datos.getResultSet().getString("Texto_breve").trim().equals(""))
            {
                
                 ErrorTextobrev.add(datos.getResultSet().getString("Orden"));
                  Error.add(datos.getResultSet().getString("Orden"));
            } 
            // detectar errores por avisos
            
            // detectar errores de fecha lib/abier
            
        }

        while (ejecu.getResultSet().next()) {
            ENejec++;
        }

        abierto = Abierto.size();

        CERRADO = cerrado.size();
        CTEC = ctec.size();

        while (horaP.getResultSet().next()) {
            horaphoto = horaP.getResultSet().getTimestamp("hora");
        }

    }
    public String gpopln(String ptores) {
        gpo = null;
        String errplan = "SELECT PemexQBs.areas.GRUPO_PLAN FROM pemexqbs.areas WHERE PemexQBs.areas.Id = '" + ptores + "';";
        try {
            Statement Errplan = conexion.createStatement();
            Errplan.executeQuery(errplan);
            while (Errplan.getResultSet().next()) {
                gpo = Errplan.getResultSet().getString("GRUPO_PLAN");

            }
        } catch (SQLException e) {
            variable = e.toString();
        }

        return gpo;
    }
}
