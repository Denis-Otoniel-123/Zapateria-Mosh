

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Prima"%>
<%@page import="DAO.PrimaDAO"%>
<%@page import="Bean.pedidoprima"%>
<%@page import="DAO.pedidoprimaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Pedido Prima</title>
    </head>
    <body>
        <div >
           <%
           pedidoprimaDAO dao=new pedidoprimaDAO();
           int id=Integer.parseInt((String)request.getAttribute("idped"));
           pedidoprima p=(pedidoprima)dao.list(id);
           %>
          
          <div class="modal-content">
            <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Editar Pedido Prima</h4>
                        </div>
                       <form action="PPedidocontroller">
                          
                           <select name="txtidprima"  class="form-control">
                               <option  value="<%= p.getIdprima()%>" selected="<%= p.getIdprima()%>"><%= PrimaDAO.getPrima(p.getIdprima())%></option>
                               <%PrimaDAO cdao=new PrimaDAO();
                                            List<Prima>list=cdao.ListadoPrimaActivo();
                                            Iterator<Prima>iter=list.iterator();
                                            Prima per=null;
                                            while (iter.hasNext()) {
                                            per = iter.next(); %>
                                            <option value="<%= per.getId()%>" ><%= per.getNombre()%></option>
                                  <%}%>
                           </select>
                           <br>
                               
                               
                              <input type="text" name="txtcantidad" class="form-control" value="<%=p.getCantidad()%>" placeholder="Nombre" required/><br> 
                              <input type="hidden" name="txtfecha" value="<%=p.getFecha()%>" placeholder="Fech" required/> <br> 
                              <input type="text" name="txtdescripcion" class="form-control" value="<%=p.getDescripcion()%> " placeholder="descripcion"/> <br> 
                                 <input type="hidden" name="txtid" value="<%=p.getId()%>">
                  <div class="modal-footer">
                      <a href="PPedidoPrima.jsp" class="btn btn-default" >Cancelar</a>
                                       
                       <input type="submit" name="accion" value="actualizar" class="btn btn-primary"/>                      
                </div>
          </form>
        </div>
       </div>
    </body>
</html>
