

<%@page import="Bean.pedidoprima"%>
<%@page import="DAO.pedidoprimaDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Prima"%>
<%@page import="DAO.PrimaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
     <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Produccion</title>
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
				<a href="#tabnewpedido" class="mdl-tabs__tab is-active">NUEVO</a>
				<a href="#tabListpedido" class="mdl-tabs__tab">LISTA</a>
			</div>
                    
                    <!--modal para agregar-->
			<div class="mdl-tabs__panel is-active" id="tabnewpedido">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-primary text-center tittles">
								Nuevo Pedido de Materia Prima
							</div>
                                                   
                                                
							<div class="full-width panel-content">
                                                              <form action="Pedidoprimacontroller">
                                        <div class="mdl-grid">
                                                <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--6-col-desktop">
                                                          

                                                 <div class="mdl-textfield mdl-js-textfield">
                                                    
                                                         
                                                     <select  name="txtidprima" class="form-control" required="">
                                                         <option value="" disabled="" selected="">Seleciona Materia prima</option>
                                                            <%
                                            PrimaDAO dao=new PrimaDAO();
                                            List<Prima>list=dao.ListadoPrimaActivo();
                                            Iterator<Prima>iter=list.iterator();
                                            Prima per=null;
                                            while (iter.hasNext()) {
                                            per = iter.next(); %>        
                                            <option  value="<%= per.getId()%>"><%= per.getNombre()%></option>
                                                         <%}%>
                                                        </select>
                                                       
                                                </div>
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input name="txtcantidad" class="mdl-textfield__input" type="number" pattern="-?[0-9]*(\.[0-9]+)?" id="txtcantidad" required>
                                                    <label class="mdl-textfield__label" for="txtcantidad">Stock</label>
                                                    <span class="mdl-textfield__error">Invalido Cantidad</span>
                                            </div>
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input name="txtdescripcion" class="mdl-textfield__input" type="text"  id="descripcion" required>
                                                    <label class="mdl-textfield__label" for="descripcion">descripcion</label>
                                            </div>             
                                                         <% Date date = new Date();
                                                        SimpleDateFormat formato = new SimpleDateFormat ("dd/MM/yyyy - hh:mm:ss");
                                                        String fechahora = formato.format(date);
                                                     %>
                                                     <input type="hidden" name="txtfecha" value="<%=fechahora%>"/>        
                                                         
                                                   </div>

                                           </div>
                                           <p class="text-center">
                                           <input class="btn btn-success " type="submit" name="accion" value="agregar" />
                                           </p>


                                   </form>
                                </div>
                        </div>
                </div>
				</div>
			</div>
                   
                    <!--modal listar-->
			<div class="mdl-tabs__panel" id="tabListpedido">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-success text-center tittles">
								 Lista de Pedido de Materia Prima
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
								
                                                            
                                                     <table id="datos" number-per-page="5" current-page="" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp full-width table-responsive">
                                          <thead>
                                        <tr>
                                                <th >Materia Prima</th>
                                                <th>Cantidad</th>
                                                 <th>Fecha</th>
                                                 <th>Descripcion</th>
                                                  <th>Estado</th>
                                                  <th>Opciones</th>
                                        </tr>
                        </thead>
                        <tbody>
                            <%pedidoprimaDAO pdao=new pedidoprimaDAO();
                                            List<pedidoprima>listS=pdao.Listado();
                                            Iterator<pedidoprima>iterr=listS.iterator();
                                         pedidoprima pro=null;
                                            while (iterr.hasNext()) {
                                            pro = iterr.next(); %>

						<tr>
                                                    <td><%= PrimaDAO.getPrima(pro.getIdprima())%></td>
                                                        <td><%= pro.getCantidad()%></td>
                                                        <td><%= pro.getFecha()%></td>
                                                         <td><%= pro.getDescripcion()%></td>
                                                          <% String Estado=pro.getEstado();
                                                         if(Estado.equalsIgnoreCase("Activo")){ %>
                                                             
                                                              <td><markactivo><%= Estado %></markactivo></td>   
                                                          <%   }else{ %>
                                                           
                                                                 <td><markdesactivado><%= Estado %></markdesactivado></td>    
                                                        <%     }
                                                        %>
                                                        <td>
                                                             <% 
                                                         if(Estado.equalsIgnoreCase("Activo")){ %>
                                                             
                                                            <a href="Pedidoprimacontroller?accion=estado&id=<%= pro.getId()%>" class="btn btn-danger" ><img src="Imagen/delete.png" title="Eliminar"/></a>
							 
                                                          <%   }else{ %>
                                                           
                                                        <%     }
                                                        %>
                                                            
                                                           <a href="Pedidoprimacontroller?accion=editar&id=<%= pro.getId()%> " type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalEditpedidoprima" ><img src="Imagen/editar.png" title="Modificar"/></a>
                                                          
                                                        </td>
						</tr>
						<%}%>
						
					</tbody>
				</table>

                                        </div>
                                </div>

                                </div>
				</div>
			</div>                                                             
	</div>
	</section>
         <!--Formulario de Modificar-->
                 <div class="modal fade" id="myModalEditpedidoprima" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                    <div class="modal-content">
                       
                        <div class="modal-body">
                           
                            
                        </div>
                    </div>                    
                </div>
                  </div>
                              
                                              
</body>
</html>