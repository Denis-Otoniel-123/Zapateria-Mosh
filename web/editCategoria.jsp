

<%@page import="DAO.categoriaDAO"%>
<%@page import="Bean.categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Categoria</title>
    </head>
    <body>
       <div >
           <%
           categoriaDAO dao=new categoriaDAO();
           int id=Integer.parseInt((String)request.getAttribute("idcat"));
           categoria p=(categoria)dao.list(id);
           %>
          
          <div class="modal-content">
            <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Editar Categoria</h4>
                        </div>
                       <form action="Categoriacontroller">
                              <input type="text" name="txtNom" class="form-control" value="<%=p.getNombre()%>" required/> 
                              
                                 <input type="hidden" name="txtid" value="<%=p.getCodigo()%>">
                  <div class="modal-footer">
                       <a href="categoria.jsp" class="btn btn-default" >Cancelar</a>                  
                       <input type="submit" name="accion" value="actualizar" class="btn btn-primary"/>                      
                </div>
          </form>
        </div>
       </div>
                
                  
              
    </body>
</html>
