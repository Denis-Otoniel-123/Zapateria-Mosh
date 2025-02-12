

<%@page import="Bean.diseño"%>
<%@page import="DAO.diseñoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Diseño</title>
    </head>
    <body>
       <div >
           <%
           diseñoDAO dao=new diseñoDAO();
           int id=Integer.parseInt((String)request.getAttribute("iddis"));
           diseño p=(diseño)dao.list(id);
           %>
          
          <div class="modal-content">
            <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Editar Diseño</h4>
                        </div>
                       <form action="ADiseControlador">
                              <input type="text" name="txtNom" class="form-control" value="<%=p.getNombre()%>" required/> 
                              
                                 <input type="hidden" name="txtid" value="<%=p.getId()%>">
                  <div class="modal-footer">
                       <a href="Adiseño.jsp" class="btn btn-default" >Cancelar</a>                  
                       <input type="submit" name="accion" value="actualizar" class="btn btn-primary"/>                      
                </div>
          </form>
        </div>
       </div>
                
                  
              
    </body>
</html>

