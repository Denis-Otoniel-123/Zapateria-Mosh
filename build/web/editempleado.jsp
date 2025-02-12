
<%@page import="Bean.empleado"%>
<%@page import="DAO.empleadoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit Empleado</title>
    </head>
    <body>
         <div >
           <%
           empleadoDAO dao=new empleadoDAO();
           int id=Integer.parseInt((String)request.getAttribute("idper"));
           empleado p=(empleado)dao.list(id);
           %>
          
          <div class="modal-content">
            <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Editar Empleado</h4>
                        </div>
                       <form action="Empleadocontroller">
                          <input type="text" name="txtnombre" class="form-control" value="<%=p.getNombre()%>" placeholder="Nombre" required/><br> 
                          <input type="text" name="txtdni" class="form-control" value="<%=p.getDni()%>" placeholder="Dpi" required/><br> 
                           <input type="text" name="txtsueldo" class="form-control" value="<%=p.getSueldo()%>" placeholder="sueldo" required/> <br> 
                           <input type="text" name="txttelefono" class="form-control" value="<%=p.getTelefono()%> " placeholder="telefono"/> <br> 
                           <input type="text" name="txtdireccion" class="form-control" value="<%=p.getDireccion()%>"  placeholder="Direccion" required/> <br> 
                        <input type="text" name="txtemail" class="form-control" value="<%=p.getEmail()%>"  placeholder="Email" required/> <br> 
                       <input type="hidden" name="txtid" value="<%=p.getId()%>">
                  <div class="modal-footer">
                      <a href="empleado.jsp" class="btn btn-default" >Cancelar</a>
                                       
                       <input type="submit" name="accion" value="actualizar" class="btn btn-primary"/>                      
                </div>
          </form>
        </div>
       </div>
    </body>
</html>
