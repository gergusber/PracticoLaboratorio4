/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controlador.ConexionJDBC;
import Model.Casa;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.jasper.tagplugins.jstl.ForEach;

/**
 *
 * @author German
 */
@WebServlet(name = "Busqueda", urlPatterns = {"/Busqueda"})
public class Busqueda extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Date fechaDesde = FormaterFecha(request.getParameter("fechaDesde"));
            Date fechaHasta = FormaterFecha(request.getParameter("fechaHasta"));
            ArrayList<Casa> casas = ConexionJDBC.getInstance().getCasasByFilter(fechaDesde, fechaHasta);
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<form action=\"ConsultaCasa.jsp\">");
            out.println("<head>");
            out.println("<title>Servlet de Busqueda</title>");            
            out.println("</head>");
            out.println("<body>");
            
            out.println("<ul>");
            // Declaramos el Iterador e imprimimos los Elementos del ArrayList
            Iterator It = casas.iterator();
            while(It.hasNext()){
               Casa c =(Casa) It.next();
               out.println("<input type=\"hidden\" name=\"idCasa\" value= "+c.getIdCasa()+">");
               out.println("<input type=\"hidden\" name=\"fechaDesdeAlquiler\" value= "+fechaDesde+">");
               out.println("<input type=\"hidden\" name=\"fechaHastaAlquiler\" value= "+fechaHasta+">");
               out.println("<li> Casa: "+c.getPrecioPorDia()+"- Valoracion: " + c.getValoracion()+ "<input type=\"submit\" value=\"Consultar\">"+"</li>");  
            }
            out.println("</ul>");
            out.println("</body>");
            out.println("</form >"); 
            out.println("</html>");
 
           
        }
    }
    public Date FormaterFecha(String fecha){
           Date FechaRet = null;
           
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
             try 
             {  
                  FechaRet = formatter.parse(fecha);
                
             }
             catch (Exception e)
             {
             }

         return FechaRet;
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
