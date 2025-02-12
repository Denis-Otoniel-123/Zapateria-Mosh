/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLADOR;

import Bean.empleado;
import DAO.empleadoDAO;
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
public class Empleadocontroller extends HttpServlet {
 int id;
  String listar="empleado.jsp";
  String editar="editempleado.jsp";
    empleado p=new empleado();
    empleadoDAO pdao=new empleadoDAO();
    double sueldo;
     String nombre,dni,direccion,telefono,email;
     
     
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
            out.println("<title>Servlet Empleadocontroller</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Empleadocontroller at " + request.getContextPath() + "</h1>");
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
       // inicio agregar
       if(action.equalsIgnoreCase("agregar")){
          nombre=request.getParameter("txtnombre");
          dni=request.getParameter("txtdni");
          sueldo=Double.parseDouble(request.getParameter("txtsueldo"));
         telefono=request.getParameter("txttelefono");
         direccion=request.getParameter("txtdireccion");
        email=request.getParameter("txtemail");
           p.setNombre(nombre);
           p.setDni(dni);
           p.setSueldo(sueldo);
           p.setTelefono(telefono);
           p.setDireccion(direccion);
           p.setEmail(email);
          pdao.add(p);
          acceso=listar;
      
      
      // editar inicio
      } else if(action.equalsIgnoreCase("editar")){
          request.setAttribute("idper", request.getParameter("id"));
            acceso=editar;
      }else if(action.equalsIgnoreCase("actualizar")){
         id=Integer.parseInt(request.getParameter("txtid"));
            nombre=request.getParameter("txtnombre");
          dni=request.getParameter("txtdni");
          sueldo=Double.parseDouble(request.getParameter("txtsueldo"));
         telefono=request.getParameter("txttelefono");
         direccion=request.getParameter("txtdireccion");
        email=request.getParameter("txtemail");
            p.setId(id);  
            p.setNombre(nombre);
           p.setDni(dni);
           p.setSueldo(sueldo);
           p.setTelefono(telefono);
           p.setDireccion(direccion);
           p.setEmail(email);
          pdao.Edit(p);
       acceso=listar;
      }

// fin editar
 // inicio eliminar      
      else if(action.equalsIgnoreCase("eliminar")) {
           id=Integer.parseInt(request.getParameter("id"));
        p.setId(id);
         pdao.Eliminar(id);
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
