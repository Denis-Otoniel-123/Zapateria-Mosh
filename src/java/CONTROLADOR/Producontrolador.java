/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLADOR;

import Bean.produccion;
import DAO.produccionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * 
 */
public class Producontrolador extends HttpServlet {

int id;
String listar="PProdu.jsp";
String editar="PeditProduccion.jsp";
    produccion p=new produccion();
    produccionDAO pdao=new produccionDAO();
    
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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Producontrolador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Producontrolador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
         String acceso="";
       String action=request.getParameter("accion");
       if(action.equalsIgnoreCase("agregar")){
           int idproducto=Integer.parseInt(request.getParameter("txtidproducto"));
           int cantidad=Integer.parseInt(request.getParameter("txtcantidad"));
           String  fecha=(request.getParameter("txtfecha"));
           p.setIdproducto(idproducto);
           p.setCantidad(cantidad);
            p.setFecha(fecha);
            p.setEstado("Activo");
          pdao.add(p);
          acceso=listar;
      // editar inicio
      }
       
       else if(action.equalsIgnoreCase("editar")){
          request.setAttribute("idpro", request.getParameter("id"));
            acceso=editar;
      }else if(action.equalsIgnoreCase("actualizar")){
         id=Integer.parseInt(request.getParameter("txtid"));
          int idprima=Integer.parseInt(request.getParameter("txtidprima"));
           int cantidad=Integer.parseInt(request.getParameter("txtcantidad"));
           String  fecha=(request.getParameter("txtfecha"));
           p.setId(id);
            p.setIdproducto(idprima);
           p.setCantidad(cantidad);
            p.setFecha(fecha);
        
          pdao.Edit(p);
            acceso=listar;
      }

// fin editar
 // inicio eliminar      
      else if(action.equalsIgnoreCase("estado")) {
           id=Integer.parseInt(request.getParameter("id"));
        p.setId(id);
        String estado=produccionDAO.getProduccionEstado(id);
        if(estado.equalsIgnoreCase("Activo")){
            p.setEstado("Anulado");
         }
        pdao.Editestado(p,id);
          acceso=listar;
      }
      // fin eliminar
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
        vista.forward(request, response); 
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
