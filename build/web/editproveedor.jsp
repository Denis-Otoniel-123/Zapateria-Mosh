

<%@page import="DAO.proveedorDAO"%>
<%@page import="Bean.proveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>proovedor</title>
    </head>
    <body>
        <div >
           <%
           proveedorDAO dao=new proveedorDAO();
           int id=Integer.parseInt((String)request.getAttribute("idpro"));
           proveedor p=(proveedor)dao.list(id);
           %>
          
          <div class="modal-content">
            <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Editar Proveedor</h4>
                        </div>
                       <form action="ProveedorControlador">
                           <input type="text" name="txtcontacto" class="form-control" value="<%=p.getContato()%>" placeholder="Nombre" required/><br> 
                              <input type="text" name="txttelefono_contacto" class="form-control" value="<%=p.getTelefono_contacto()%>" placeholder="Precio venta" required/> <br> 
                                          <input type="hidden" name="txtid" value="<%=p.getId()%>">
                  <div class="modal-footer">
                      <a href="proveedor.jsp" class="btn btn-default" >Cancelar</a>
                                       
                       <input type="submit" name="accion" value="actualizar" class="btn btn-primary"/>                      
                </div>
          </form>
        </div>
       </div>
    </body>
</html>
