
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.categoriaDAO"%>
<%@page import="Bean.categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Categoria</title>
        
         <%@include file="css-js.jsp" %>
    
</head>


<body>
	
	<!-- InicioCaberacera de Menu -->
        <%@include file="FrmAlmacen.jsp" %>
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
								Nuevo categoria
							</div>
                                                   
                                                
							<div class="full-width panel-content">
                                                            <form  action="ACategoriacontroller" >
									
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
								Lista categorias
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
                                                                    <th>codigo</th>
                                                                    <th>Nombre</th>
                                                                    <th>Opciones</th>
                                                            </tr>
                                                    </thead>
                                                       <%
                                                        categoriaDAO dao=new categoriaDAO();
                                                        List<categoria>list=dao.Listado();
                                                        Iterator<categoria>iter=list.iterator();
                                                        categoria per=null;
                                                        while (iter.hasNext()) {
                                                                per = iter.next();

                                                        %>
                                                    <tbody>
						<tr>
                                                    <td><%= per.getCodigo()%> </td>
                                                    <td><%= per.getNombre()%></td>
                                                    <td>
                                                       <a href="ACategoriacontroller?accion=editar&id=<%= per.getCodigo()%> " type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalEdit" ><img src="Imagen/editar.png" title="Modificar"/></a>
                                                       <a   href="ACategoriacontroller?accion=eliminar&id=<%= per.getCodigo()%>" class="btn btn-danger" ><img src="Imagen/delete.png" title="Eliminar"/></a> 
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
