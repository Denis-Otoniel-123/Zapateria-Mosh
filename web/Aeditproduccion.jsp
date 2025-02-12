

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.productoDAO"%>
<%@page import="Bean.producto"%>
<%@page import="Bean.pedidoprima"%>
<%@page import="Bean.produccion"%>
<%@page import="DAO.produccionDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Produccion</title>
    </head>
    <body>
        <div >
           <%
           produccionDAO dao=new produccionDAO();
           int id=Integer.parseInt((String)request.getAttribute("idpro"));
           produccion p=(produccion)dao.list(id);
           %>
          
          <div class="modal-content">
            <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Editar Registro</h4>
                        </div>
                       <form action="AProduccionController">
                          
                           <select name="txtidprima"  class="form-control">
                               <option  value="<%= p.getIdproducto()%>"selected="<%= p.getIdproducto()%>" ><%= productoDAO.getProducto(p.getIdproducto()) %></option>
                               <%productoDAO cdao=new productoDAO();
                                            List<producto>list=cdao.ListadoEstadoActivo();
                                            Iterator<producto>iter=list.iterator();
                                            producto per=null;
                                            while (iter.hasNext()) {
                                            per = iter.next(); %>
                                            <option value="<%= per.getId()%>" ><%= per.getNombre()%></option>
                                  <%}%>
                           </select>
                           <br>
                               
                               
                              <input type="text" name="txtcantidad" class="form-control" value="<%=p.getCantidad()%>" placeholder="Nombre" required/><br> 
                              <input type="hidden" name="txtfecha" value="<%=p.getFecha()%>" placeholder="Fecha" required/> <br> 
                              <input type="hidden" name="txtid" value="<%=p.getId()%>">
                  <div class="modal-footer">
                      <a href="AProduccion.jsp" class="btn btn-default" >Cancelar</a>
                                       
                       <input type="submit" name="accion" value="actualizar" class="btn btn-primary"/>                      
                </div>
          </form>
        </div>
       </div>
    </body>
</html>
