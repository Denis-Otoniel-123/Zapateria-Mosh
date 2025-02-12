

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Bean.empleado"%>
<%@page import="DAO.empleadoDAO"%>
<%@page import="DAO.usuarioDAO"%>
<%@page import="Bean.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div >
           <%
          usuarioDAO dao=new usuarioDAO();
           int id=Integer.parseInt((String)request.getAttribute("idusu"));
           usuario p=(usuario)dao.list(id);
           %>
          
          <div class="modal-content">
            <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Editar Producto</h4>
                        </div>
                       <form action="Usuariocontroller">
                            <select name="txtidempleado" class="form-control" required="">
                                <option disabled="" selected="">Seleciona Empleado</option>
                                <%
                        empleadoDAO edao=new empleadoDAO();
                        List<empleado>lista=edao.Listado();
                        Iterator<empleado>itera=lista.iterator();
                        empleado empl=null;
                        while (itera.hasNext()) {
                        empl = itera.next(); %>

                        <option  value="<%= empl.getId()%>" ><%= empl.getNombre()%></option>
                                     <%}%>

                        </select>
                           <input type="text" name="txtusu" class="form-control" value="<%=p.getUsu()%>" placeholder="Usuario" required/><br> 
                          <input type="password" name="txtpassword" class="form-control" value="<%=p.getPassword()%>" placeholder="Password" required/><br> 
      
                          <select name="txtrol"  class="form-control" required="">
                               <option disabled="" selected="">Seleciona tipo de Rol</option>
                               <option>Administrador</option>
                               <option>Ventas</option>
                               <option>Almacen</option>
                               <option>Produccion</option>
                           </select>
                          
                           <br>
                           <input type="hidden" name="txtid" value="<%=p.getId()%>">
                  <div class="modal-footer">
                      <a href="usuarios.jsp" class="btn btn-default" >Cancelar</a>
                                       
                       <input type="submit" name="accion" value="actualizar" class="btn btn-primary"/>                      
                </div>
          </form>
        </div>
       </div>
    </body>
</html>
