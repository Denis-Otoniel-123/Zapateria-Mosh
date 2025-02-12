/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLADOR;


import Bean.marca;
import DAO.diseñoDAO;
import DAO.marcaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Angel Albinagorta
 */
public class MarcaControlador extends HttpServlet {

     int id;
  String listar="marca.jsp";
String editar="editmarca.jsp";
    marca c=new marca();
    marcaDAO cdao=new marcaDAO();
    
    
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
            out.println("<title>Servlet MarcaControlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MarcaControlador at " + request.getContextPath() + "</h1>");
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
       if(action.equalsIgnoreCase("add")){
           String nombre=request.getParameter("txtNom");
           c.setNombre(nombre);
             c.setEstado("Activo");
          cdao.add(c);
          acceso=listar;
      
      
      // editar inicio
      } else if(action.equalsIgnoreCase("editar")){
          request.setAttribute("idmar", request.getParameter("id"));
            acceso=editar;
      }else if(action.equalsIgnoreCase("actualizar")){
         id=Integer.parseInt(request.getParameter("txtid"));
           String nombre=request.getParameter("txtNom");
             c.setId(id);
           c.setNombre(nombre);
          cdao.Edit(c);
            acceso=listar;
      }

// fin editar
 // inicio Estado      
      else if(action.equalsIgnoreCase("estado")) {
           id=Integer.parseInt(request.getParameter("id"));
       String estado=marcaDAO.getmarcaEstado(id);
       if(estado.equalsIgnoreCase("Activo")){
           c.setEstado("Desactivado");
       }else{
       c.setEstado("Activo");
        
       }
        cdao.Estado(c,id);
          acceso=listar;  
      }
      // fin Estado
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
