/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLADOR;

import Bean.detalle_venta;
import Bean.venta;
import DAO.ventaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *

 */
public class DetalleVControlador extends HttpServlet {
int id;
    String listar="DetalleVenta.jsp";
     String venta="ventas.jsp";
     String ticket="ticketventa.jsp";
    ventaDAO pDAO;
    venta v=new venta();
    detalle_venta dv=new detalle_venta();
    // venta
    int idcliente;
    String tipo_comprobante;
    String Ruc;
    String num_comprobante;
    String fecha_hora;
    double total;
    String estado;
    // detalle _detalle
    int idproducto;
    int cantidad;
    double precio;
    double descuento;
    double subtotal; 
    String fintotal;
     int Nboleta;
 DecimalFormat formateador ;
    public DetalleVControlador() {
        pDAO=new ventaDAO();
       formateador = new DecimalFormat("000000");
    }

  
     
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
            out.println("<title>Servlet DetalleVControlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetalleVControlador at " + request.getContextPath() + "</h1>");
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
         idcliente=Integer.parseInt(request.getParameter("txtidcliente"));
    tipo_comprobante =request.getParameter("txttipocomprbante");
     Ruc = request.getParameter("txtruc");
     fecha_hora = request.getParameter("txtfecha");
       v.setIdcliente(idcliente);
        v.setTipo_comprobante(tipo_comprobante);
        v.setRuc(Ruc);
        if(tipo_comprobante.equalsIgnoreCase("Boleta")){
            Nboleta = pDAO.BuscarNBoleta();
        Nboleta = Nboleta + 1;
         String formatbol = formateador.format(Nboleta); 
            v.setNum_comprobante(formatbol);  
        }else{
            
        int Nfactura = pDAO.BuscarNfacturas();
        Nfactura = Nfactura + 1;
        String format = formateador.format(Nfactura);
             v.setNum_comprobante(format); 
        }
        
        v.setFecha_hora(fecha_hora);
        v.setTotal(0.00);
        v.setEstado("Vendido");
        pDAO.insertarventa(v);
          acceso=listar;
          
      }else if(action.equalsIgnoreCase("eliminar")){
          id=Integer.parseInt(request.getParameter("id"));
          pDAO.EliminarDetalle(id);
          acceso=listar;
          
      }else if(action.equalsIgnoreCase("anular")){
          id=Integer.parseInt(request.getParameter("id"));
          dv.setEstado("Anulado");
          pDAO.editaranulardetalle(dv,id);
          acceso=listar;
      }else if(action.equalsIgnoreCase("add")){
         idproducto = Integer.parseInt(request.getParameter("txtproducto"));
        cantidad = Integer.parseInt(request.getParameter("cantidad"));
        precio = Double.parseDouble(request.getParameter("precio"));
       descuento = Double.parseDouble(request.getParameter("descuento"));
        subtotal =Double.parseDouble(request.getParameter("txtsubtotal"));
           dv.setIdproducto(idproducto);
        dv.setCantidad(cantidad);
        dv.setPrecio(precio);
        dv.setDescuento(descuento);
        dv.setSubtotal(subtotal);
        dv.setEstado("Activo");
        pDAO.insertarventadetalle(dv);
          acceso=listar;
      }else if(action.equalsIgnoreCase("Vender")){
        id= Integer.parseInt(request.getParameter("txtid"));
      total =Double.parseDouble(request.getParameter("txttotal"));
     
         v.setId(id);
        v.setTotal(total);
        pDAO.editartotal(v);
          acceso=venta;
      }else if(action.equalsIgnoreCase("estado")){
       id=Integer.parseInt(request.getParameter("id"));
       String estado=ventaDAO.estado(id);
       if(estado.equalsIgnoreCase("Vendido")){
          
           v.setEstado("Anulado");
            dv.setEstado("Anulado");
       }else{
           v.setEstado("Anulado"); 
           dv.setEstado("Anulado");
       }
      
       pDAO.editarEstado(v,id);
       pDAO.editarestadodetalle_venta(dv, id);
          acceso=venta;
      }else if(action.equalsIgnoreCase("reporte")){
        request.setAttribute("idve", request.getParameter("id"));
               acceso=ticket;
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
