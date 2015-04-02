/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package json;

import Calendar.CalendarDates2;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.joda.time.DateTime;

/**
 *
 * @author jose_l
 */
@WebServlet(name = "operacionesServlet", urlPatterns = {"/operacionesServlet"})
public class operacionesServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        CalendarDates2 cal; 
        
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat nor =new SimpleDateFormat("dd-MM-yyyy");
        DateTime fin;
        CalendarDTO  c[] = new CalendarDTO[1344]; //  capasidad de 1344
        int t = 0;
        List l = new ArrayList();
        
        try {
            cal = new CalendarDates2("OPERACION");
            
             while ( cal.getDatos().getResultSet().next() ) {
            
            c[t] = new CalendarDTO();
            c[t].setId(t);
            c[t].setStart(""+cal.getDatos().getResultSet().getDate("Incextr"));
            fin= DateTime.parse(cal.getDatos().getResultSet().getDate("Finextr").toString());
            fin = fin.plusDays(1);
            c[t].setEnd(""+f.format(fin.toLocalDate().toDate()));
            c[t].setTitle(""+cal.getDatos().getResultSet().getInt("Orden")+" "+cal.getDatos().getResultSet().getString("Responsable").trim());
            if(!f.format(cal.getDatos().getResultSet().getDate("Finreal")).equals("2001-01-01")){
            c[t].setDescription("<h2 align='center'>"+cal.getDatos().getResultSet().getString("AREA").trim()+" </h2>"+
                             "<h4> Ubicacion Tecnica  : </h4>"+ cal.getDatos().getResultSet().getString("Denominacion").trim()+
                             "<h4> Responsable  : </h4>" +  cal.getDatos().getResultSet().getString("PtoTrbRes").trim()+
                             "<h4> Operarios  :</h4>"+ cal.getDatos().getResultSet().getString("ayudantes").trim()+
                             "<h4> TextoBreveOperacion : </h4> <p>"+  cal.getDatos().getResultSet().getString("TextoOperacion")+ "</p>"+
                             "<h4> TextoBreve : </h4> <p> "+cal.getDatos().getResultSet().getString("Textobreve").trim() +"</p>"+
                             "<h4> Periodo: </h4> <p> "+nor.format(cal.getDatos().getResultSet().getDate("Incextr")) +" AL  "+ nor.format(cal.getDatos().getResultSet().getDate("Finextr"))  + "</p>"+
                             "<h4> Estado : </h4>"+  cal.getDatos().getResultSet().getString("Estado").trim() +
                             "<h4> Finalizó el : </h4> <p>" + nor.format(cal.getDatos().getResultSet().getDate("Finreal")) +"</p>" );
            } else {
            c[t].setDescription("<h2 align='center'>"+cal.getDatos().getResultSet().getString("AREA").trim()+" </h2>"+
                             "<h4> Ubicacion Tecnica  : </h4>"+ cal.getDatos().getResultSet().getString("Denominacion").trim()+
                             "<h4> Responsable  : </h4>" +  cal.getDatos().getResultSet().getString("PtoTrbRes").trim()+
                             "<h4> Operarios  :</h4>"+ cal.getDatos().getResultSet().getString("ayudantes").trim()+
                             "<h4> TextoBreveOperacion : </h4> <p>"+  cal.getDatos().getResultSet().getString("TextoOperacion")+ "</p>"+
                             "<h4> TextoBreve : </h4> <p> "+cal.getDatos().getResultSet().getString("Textobreve").trim() +"</p>"+
                             "<h4> Periodo: </h4> <p> "+nor.format(cal.getDatos().getResultSet().getDate("Incextr")) +" AL  "+ nor.format(cal.getDatos().getResultSet().getDate("Finextr"))  + "</p>"+
                             "<h4> Estado : </h4>"+  cal.getDatos().getResultSet().getString("Estado").trim() +
                             "<h4> Finalizó el : </h4> <p> </p>" );
            
            }
            if(!f.format(cal.getDatos().getResultSet().getDate("Finreal")).equals("2001-01-01"))
            {
                 c[t].setColor("white");
                 c[t].setBorderColor("skyblue");
                 c[t].setTextColor("black");
            }else
            if(cal.getDatos().getResultSet().getString("AREA").equals("MANTENIMIENTO"))
            {
                c[t].setColor("skyblue");
                c[t].setBorderColor("skyblue");
                c[t].setTextColor("black");
            }else 
                if(cal.getDatos().getResultSet().getString("AREA").equals("OPERACION"))
                {
                   c[t].setColor("black");
                    c[t].setBorderColor("skyblue");
                    c[t].setTextColor("white");
                }  else
                    if(cal.getDatos().getResultSet().getString("AREA").equals("SEGURIDAD"))
                    {
                        c[t].setColor("#ff6347");
                        c[t].setBorderColor("skyblue");
                        c[t].setTextColor("black");
                    } else
                        if(cal.getDatos().getResultSet().getString("AREA").equals("UAT"))
                        {
                            c[t].setColor("gray");
                            c[t].setBorderColor("skyblue");
                           c[t].setTextColor("black");
                        }
            
               l.add(c[t]);
            t++;
            
        } // fin while
              
                cal.getConexion().close();
            
        } catch (SQLException ex) {
            Logger.getLogger(CalendarJsonServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
     
        
        
     
       
       
       
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.write(new Gson().toJson(l));
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
