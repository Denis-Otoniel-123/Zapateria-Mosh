

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="Bean.Prima"%>
<%@page import="DAO.PrimaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
     <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>producto</title>
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
        <%@include file="FrmAlmacen.jsp" %>
	<!-- pageContent -->
	<section class="full-width pageContent">
		
		<div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
			<div class="mdl-tabs__tab-bar">
				<a href="#tabNewPrima" class="mdl-tabs__tab is-active">NUEVO</a>
				<a href="#tabListPrima" class="mdl-tabs__tab">LISTA</a>
			</div>
			<div class="mdl-tabs__panel is-active" id="tabNewPrima">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-primary text-center tittles">
								Nuevo Material Prima
                        </div>
                        <div class="full-width panel-content">
                            <form action="APrimacontroller">
                                        <div class="mdl-grid">
                                                <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--6-col-desktop">
                                                          
                                                             <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                   <input name="txtnombre" class="mdl-textfield__input" type="text" pattern="-?[A-Za-z0-9áéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="NameProduct"required >
                                                                   <label class="mdl-textfield__label" for="NameProduct">Nombre</label>
                                                                   <span class="mdl-textfield__error">Invalido nombre</span>
                                                           </div>
                                                      <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                   <input name="txtprecio" class="mdl-textfield__input" type="text" pattern="-?[0-9.]*(\.[0-9]+)?" id="PriceProduct" required>
                                                                   <label class="mdl-textfield__label" for="PriceProduct">Precio</label>
                                                                   <span class="mdl-textfield__error">Invalido Precio</span>
                                                           </div>
                                                           <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                               <input name="txtstock" class="mdl-textfield__input" type="number" pattern="-?[0-9]*(\.[0-9]+)?" id="StrockProduct" required>
                                                                   <label class="mdl-textfield__label" for="StrockProduct">Stock</label>
                                                                   <span class="mdl-textfield__error">Invalido Stock</span>
                                                           </div>
                                                           <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                   <input name="txtdescripcion" class="mdl-textfield__input" type="text" id="NameProduct">
                                                                   <label class="mdl-textfield__label" for="NameProduct">Descripcion</label>
                                                                   <span class="mdl-textfield__error">Invalido Descripcion</span>
                                                           </div>


                                                   </div>

                                           </div>
                                           <p class="text-center">
                                           <input class="btn btn-success " type="submit" name="accion" value="add" />
                                           </p>


                                   </form>
                           </div>
                   </div>
           </div>
   </div>
</div>
<div class="mdl-tabs__panel" id="tabListPrima">
   <div class="mdl-grid">
           <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
                   <div class="full-width panel-tittle bg-success text-center tittles">
                                   lista Material Prima
                           </div>
                  <%PrimaDAO pdaost=new PrimaDAO();
                                            List<Prima>listSt=pdaost.ListadoEstockMin();
                                            Iterator<Prima>iterst=listSt.iterator();
                                         Prima prost=null;
                                            while (iterst.hasNext()) {
                                            prost = iterst.next(); %>

						  <div class="full-width panel-tittle bg-danger text-center tittles">
							Alerta Stock:<%=prost.getNombre()%>=<%= prost.getStock()%>
                                                    
                                                  </div>
						  <%}%>
                       
                           <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
                                   <label class="mdl-button mdl-js-button mdl-button--icon" for="buscar">
                                           <i class="zmdi zmdi-search"></i>
                                   </label>
                                   <div class="mdl-textfield__expandable-holder">
                                       <input type="text" onkeyup="doSearch()" class="mdl-textfield__input" type="text" id="buscar" >
                                           <label class="mdl-textfield__label"></label>
                                   </div>
                                        </div>
                                
                                  
                                <table id="datos" number-per-page="2" current-page="" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp full-width table-responsive">
                        <thead>
                                <tr>
                                        <th class="mdl-data-table__cell--non-numeric">Nombre</th>
                                        <th>precio de compra</th>
                                        <th>Stock</th>
                                         <th>Estado</th>
                                        <th>Opciones</th>
                                </tr>
                        </thead>
                        <tbody>
                                        <%PrimaDAO pdao=new PrimaDAO();
                                            List<Prima>listS=pdao.Listado();
                                            Iterator<Prima>iterr=listS.iterator();
                                         Prima pro=null;
                                            while (iterr.hasNext()) {
                                            pro = iterr.next(); %>

						<tr>
							<td class="mdl-data-table__cell--non-numeric"><%= pro.getNombre()%></td>
							<td>Q<%= pro.getPrecio()%></td>
                                                        <td><%= pro.getStock()%></td>
							 <% String Estado=pro.getEstado();
                                                         if(Estado.equalsIgnoreCase("Activo")){ %>
                                                             
                                                              <td><markactivo><%= Estado %></markactivo></td>   
                                                          <%   }else{ %>
                                                           
                                                                 <td><markdesactivado><%= Estado %></markdesactivado></td>    
                                                        <%     }
                                                        %>
							<td>
                                                            <a href="APrimacontroller?accion=editar&id=<%= pro.getId()%> " type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalEditPrima" ><img src="Imagen/editar.png" title="Modificar"/></a>
                                                         <a href="APrimacontroller?accion=estado&id=<%= pro.getId()%>" class="btn btn-danger" ><img src="Imagen/delete.png" title="Eliminar"/></a>
							</td>
						</tr>
						<%}%>
						
					</tbody>
				</table>
				</div>
			</div>
		</div>
	</section>
                                                
                                                
           <!--Formulario de Modificar-->
                 <div class="modal fade" id="myModalEditPrima" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                    <div class="modal-content">
                       
                        <div class="modal-body">
                           
                            
                        </div>
                    </div>                    
                </div>
                  </div>
                                              
</body>
</html>
