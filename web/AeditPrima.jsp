

<%@page import="Bean.Prima"%>
<%@page import="DAO.PrimaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Prima</title>
    </head>
    <body>
         <div >
           <%
           PrimaDAO dao=new PrimaDAO();
           int id=Integer.parseInt((String)request.getAttribute("idpri"));
           Prima p=(Prima)dao.list(id);
           %>
          
          <div class="modal-content">
            <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Editar Materia Prima</h4>
                        </div>
                       <form action="APrimacontroller">
                           <input type="text" name="txtnombre" class="form-control" value="<%=p.getNombre()%>" placeholder="Nombre" required/><br> 
                              <input type="text" name="txtprecio" class="form-control" value="<%=p.getPrecio()%>" placeholder="Precio venta" required/> <br> 
                              <input type="text" name="txtstock" class="form-control" value="<%=p.getStock()%>"  placeholder="stock" required/> <br> 
                              <input type="text" name="txtdescripcion" class="form-control" value="<%=p.getDescripcion()%> " placeholder="descripcion"/> <br> 
                                 <input type="hidden" name="txtid" value="<%=p.getId()%>">
                  <div class="modal-footer">
                      <a href="APrima.jsp" class="btn btn-default" >Cancelar</a>
                                       
                       <input type="submit" name="accion" value="actualizar" class="btn btn-primary"/>                      
                </div>
          </form>
        </div>
       </div>
    </body>
</html>
