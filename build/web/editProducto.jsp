

<%@page import="Bean.diseño"%>
<%@page import="DAO.diseñoDAO"%>
<%@page import="Bean.marca"%>
<%@page import="DAO.marcaDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="Bean.categoria"%>
<%@page import="java.util.List"%>
<%@page import="Bean.producto"%>
<%@page import="DAO.productoDAO"%>
<%@page import="DAO.categoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Producto</title>
    </head>
    <body>
        <div >
           <%
           productoDAO dao=new productoDAO();
           int id=Integer.parseInt((String)request.getAttribute("idpro"));
           producto p=(producto)dao.list(id);
           %>
          
          <div class="modal-content">
            <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Editar Producto</h4>
                        </div>
                       <form action="Productocontroller">
                          
                           <select name="txtidcategoria"  class="form-control">
                               <option  selected="<%= p.getIdcategoria()%>" value="<%= p.getIdcategoria()%>"><%=categoriaDAO.getCategoria(p.getIdcategoria())%> </option>
                                  <%categoriaDAO cdao=new categoriaDAO();
                                            List<categoria>list=cdao.Listado();
                                            Iterator<categoria>iter=list.iterator();
                                            categoria per=null;
                                            while (iter.hasNext()) {
                                            per = iter.next(); %>
                               <option value="<%= per.getCodigo()%>" ><%= per.getNombre()%></option>
                                  <%}%>
                           </select>
                           <br>
                                                           
                                                     <select name="txtmarca"  class="form-control" >
                                                         <option   value="<%= p.getIdmarca()%>" selected="<%= p.getIdmarca()%>"><%=marcaDAO.getmarca(p.getIdmarca())%></option>
                                                            <%
                                            marcaDAO daom=new marcaDAO();
                                            List<marca>listm=daom.ListadoEstadoActivos();
                                            Iterator<marca>iterm=listm.iterator();
                                            marca m=null;
                                            while (iterm.hasNext()) {
                                            m= iterm.next(); %>
                                                              
                                                                <option  value="<%= m.getId()%>" ><%= m.getNombre()%></option>
                                                         <%}%>
                                                        </select>
                                                       
                                          <br>
                                                           
                                                     <select name="txtdiseno"  class="form-control"  >
                                                         <option   selected="<%= p.getIddiseño()%>" value="<%= p.getIddiseño()%>" ><%=diseñoDAO.getdiseño(p.getIddiseño())%></option>
                                                            <%
                                            diseñoDAO daod=new diseñoDAO();
                                            List<diseño>listd=daod.ListadoEstadoActivos();
                                            Iterator<diseño>iterd=listd.iterator();
                                            diseño d=null;
                                            while (iterd.hasNext()) {
                                            d = iterd.next(); %>
                                                              
                                                                <option  value="<%= d.getId()%>" ><%= d.getNombre()%></option>
                                                         <%}%>
                                                        </select>
                           <br>
                               
                               
                              <input type="text" name="txtnombre" class="form-control" value="<%=p.getNombre()%>" placeholder="Nombre" required/><br> 
                              <input type="text" name="txttalla" class="form-control" value="<%=p.gettalla()%>" placeholder="Talla" required/><br> 
                              <input type="text" name="txtprecioventa" class="form-control" value="<%=p.getPrecio_venta()%>" placeholder="Precio venta" required/> <br> 
                              <input type="text" name="txtstock" class="form-control" value="<%=p.getStock()%>"  placeholder="stock" required/> <br> 
                              <input type="text" name="txtdescripcion" class="form-control" value="<%=p.getDescripcion()%> " placeholder="descripcion"/> <br> 
                                
                                 <input type="hidden" name="txtid" value="<%=p.getId()%>">
                  <div class="modal-footer">
                      <a href="productos.jsp" class="btn btn-default" >Cancelar</a>
                                       
                       <input type="submit" name="accion" value="actualizar" class="btn btn-primary"/>                      
                </div>
          </form>
        </div>
       </div>
    </body>
</html>
