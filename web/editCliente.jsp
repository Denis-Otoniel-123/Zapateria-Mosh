

<%@page import="Bean.Cliente"%>
<%@page import="Bean.producto"%>
<%@page import="DAO.clienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Cliente</title>
    </head>
    <body>
      <div >
           <%
           clienteDAO dao=new clienteDAO();
           int id=Integer.parseInt((String)request.getAttribute("idper"));
           Cliente p=(Cliente)dao.list(id);
           %>
          
          <div class="modal-content">
            <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Editar Producto</h4>
                        </div>
                       <form action="Clientecontroller">
                          <input type="text" name="txtnombre" class="form-control" value="<%=p.getNombre()%>" placeholder="Nombre" required/><br> 
                           
                          <select name="txttipo_documento"  class="form-control" required="">
                              <option selected="<%= p.getTipo_documento()%>"><%= p.getTipo_documento()%></option>
                               <option>RUC</option>
                               <option>DPI</option>
                           </select>
                           <br>
                           <input type="text" name="txtnum_documento" class="form-control" value="<%=p.getNum_documento()%>" placeholder="Numero de documento" required/> <br> 
                              <input type="text" name="txtdireccion" class="form-control" value="<%=p.getDireccion()%>"  placeholder="Direccion" required/> <br> 
                              <input type="text" name="txttelefono" class="form-control" value="<%=p.getTelefono()%> " placeholder="telefono"/> <br> 
                               <input type="text" name="txtemail" class="form-control" value="<%=p.getEmail()%>"  placeholder="Email" required/> <br> 
                              
                              <input type="hidden" name="txtid" value="<%=p.getId()%>">
                  <div class="modal-footer">
                      <a href="clientes.jsp" class="btn btn-default" >Cancelar</a>
                                       
                       <input type="submit" name="accion" value="actualizar" class="btn btn-primary"/>                      
                </div>
          </form>
        </div>
       </div>
    </body>
</html>
