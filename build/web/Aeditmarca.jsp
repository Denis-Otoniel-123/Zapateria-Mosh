

<%@page import="Bean.marca"%>
<%@page import="DAO.marcaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Marca</title>
    </head>
    <body>
       <div >
           <%
           marcaDAO dao=new marcaDAO();
           int id=Integer.parseInt((String)request.getAttribute("idmar"));
           marca p=(marca)dao.list(id);
           %>
          
          <div class="modal-content">
            <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Editar Marca</h4>
                        </div>
                       <form action="AMarcaControlador">
                              <input type="text" name="txtNom" class="form-control" value="<%=p.getNombre()%>" required/> 
                              
                                 <input type="hidden" name="txtid" value="<%=p.getId()%>">
                  <div class="modal-footer">
                       <a href="Amarca.jsp" class="btn btn-default" >Cancelar</a>                  
                       <input type="submit" name="accion" value="actualizar" class="btn btn-primary"/>                      
                </div>
          </form>
        </div>
       </div>
                
                  
              
    </body>
</html>