/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLADOR;

import Bean.Cliente;
import Bean.proveedor;
import DAO.clienteDAO;
import DAO.proveedorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *

 */
public class ProveedorControlador extends HttpServlet {
   int id;
  String listar="proveedor.jsp";
  String editar="editproveedor.jsp";
    proveedor p=new proveedor();
    proveedorDAO pdao=new proveedorDAO();
     String nombre,tipo_documento,num_documento,direccion,telefono,email,contacto,telefono_contacto;
   
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
            out.println("<title>Servlet ProveedorControlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProveedorControlador at " + request.getContextPath() + "</h1>");
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
          tipo_documento=request.getParameter("txttipo_documento");
          num_documento=request.getParameter("txtnum_documento");
         direccion=request.getParameter("txtdireccion");
         telefono=request.getParameter("txttelefono");
        email=request.getParameter("txtemail");
        contacto=request.getParameter("txtcontacto");
        telefono_contacto=request.getParameter("txttelefono_contacto");
           p.setNombre(nombre);
           p.setTipo_documento(tipo_documento);
           p.setNum_documento(num_documento);
           p.setDireccion(direccion);
           p.setTelefono(telefono);
           p.setEmail(email);
           p.setContato(contacto);
           p.setTelefono_contacto(telefono_contacto);
          pdao.add(p);
          acceso=listar;
      
      
      // editar inicio
      } else if(action.equalsIgnoreCase("editar")){
          request.setAttribute("idpro", request.getParameter("id"));
            acceso=editar;
      }else if(action.equalsIgnoreCase("actualizar")){
         id=Integer.parseInt(request.getParameter("txtid"));
             p.setId(id);
            p.setContato(request.getParameter("txtcontacto"));
           p.setTelefono_contacto(request.getParameter("txttelefono_contacto"));
          
           
          pdao.Edit(p);
       acceso=listar;
      }else if(action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
          pdao.Eliminar(id);
           acceso=listar;
      }
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
