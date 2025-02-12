

<%@page import="java.util.Iterator"%>
<%@page import="Bean.marca"%>
<%@page import="java.util.List"%>
<%@page import="DAO.marcaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Marca</title>
        
         <%@include file="css-js.jsp" %>
        
         
</head>
<style>
     /* estado descactivado */
 markdesactivado{
   
    background-color: #ff1744;
    color: black;
    border-radius: 71px 69px 72px 71px;
-moz-border-radius: 71px 69px 72px 71px;
-webkit-border-radius: 71px 69px 72px 71px;
}
/* estado activo */
 markactivo{
    
    background-color: #00FF00;
    color: black;
    border-radius: 71px 69px 72px 71px;
-moz-border-radius: 71px 69px 72px 71px;
-webkit-border-radius: 71px 69px 72px 71px;
}
</style>

<body>
	
	<!--cabecera de Menu -->
        <%@include file="FrmAdmin.jsp" %>
	
	<!-- pageContent -->
	<section class="full-width pageContent">
		
		<div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
			<div class="mdl-tabs__tab-bar">
				<a href="#tabNewCategory" class="mdl-tabs__tab is-active">NUEVO</a>
				<a href="#tabListCategory" class="mdl-tabs__tab">LISTA</a>
			</div>
                    <!--modal para agregar-->
			<div class="mdl-tabs__panel is-active" id="tabNewCategory">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-primary text-center tittles">
								Nueva marca
							</div>
                                                   
                                                
							<div class="full-width panel-content">
                                                            <form  action="MarcaControlador" >
									
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                            
                                                                            <input  name="txtNom"  class="mdl-textfield__input" type="text" pattern="-?[A-Za-z0-9áéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" required>
									 	
                                                                            <label class="mdl-textfield__label" for="NameCategory" >Nombre </label>
                                                                                
										<span class="mdl-textfield__error">Invalid Nombre</span>
                                                                                
									</div>
									 
									   <p class="text-center" >
                                                                               
                                                                               <input  class="btn btn-success "   type="submit" name="accion" value="add" />
                                                                         
                                                                           </p>
                                                                           
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
                   
                    <!--modal listar-->
			<div class="mdl-tabs__panel" id="tabListCategory">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-success text-center tittles">
								Lista Marca
							</div>
							<div class="full-width panel-content">
								
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
										<label class="mdl-button mdl-js-button mdl-button--icon" for="buscar">
											<i class="zmdi zmdi-search"></i>
										</label>
										<div class="mdl-textfield__expandable-holder">
											<input type="text" onkeyup="doSearch()" class="mdl-textfield__input" type="text" id="buscar">
											<label class="mdl-textfield__label"></label>
										</div>
									</div>
								
                                                            
                                                    <table id="datos" number-per-page="2" current-page="" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp full-width table-responsive">
                                                    <thead>
                                                            <tr>
                                                                    <th>Codigo</th>
                                                                    <th>Nombre</th>
                                                                    <th>Estado</th>
                                                                    <th>Opciones</th>
                                                            </tr>
                                                    </thead>
                                                       <%
                                                        marcaDAO dao=new marcaDAO();
                                                        List<marca>list=dao.Listado();
                                                        Iterator<marca>iter=list.iterator();
                                                        marca per=null;
                                                        while (iter.hasNext()) {
                                                                per = iter.next();

                                                        %>
                                                    <tbody>
						<tr>
                                                    <td><%= per.getId()%> </td>
                                                    <td><%= per.getNombre()%></td>
                                                     <% String Estado=marcaDAO.estado(per.getId());
                                                         if(Estado.equalsIgnoreCase("Activo")){ %>
                                                             
                                                              <td><markactivo><%= Estado %></markactivo></td>   
                                                          <%   }else{ %>
                                                           
                                                                 <td><markdesactivado><%= Estado %></markdesactivado></td>    
                                                        <%     }
                                                        %> 
                                                    <td>
                                                       <a href="MarcaControlador?accion=editar&id=<%= per.getId()%> " type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalEdit" ><img src="Imagen/editar.png" title="Modificar"/></a>
                                                       <a href="MarcaControlador?accion=estado&id=<%= per.getId()%>"  class="btn btn-danger" ><img src="Imagen/delete.png" title="Eliminar"/></a>  
                                                    </td>
						</tr>
						
						
					      </tbody>
                                               <%}%>
				         </table>

                                        </div>
                                </div>

                                </div>
				</div>
			</div>                                                             
	</div>
	</section>
                                                                           
           <!--Formulario de Modificar-->
                 <div class="modal fade" id="myModalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                    <div class="modal-content">
                       
                        <div class="modal-body">
                           
                            
                        </div>
                    </div>                    
                </div>
                  </div>
           
          
                                                                  
</body>

</html>
