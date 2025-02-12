

<%@page import="java.util.Date"%>
<%@page import="DAO.produccionDAO"%>
<%@page import="Bean.produccion"%>
<%@page import="Bean.producto"%>
<%@page import="DAO.productoDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="Bean.categoria"%>
<%@page import="java.util.List"%>
<%@page import="DAO.categoriaDAO"%>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat"%>
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
				<a href="#tabnewproduccion" class="mdl-tabs__tab is-active">NUEVO</a>
				<a href="#tabListproduccion" class="mdl-tabs__tab">LISTA</a>
			</div>
                    
                    <!--modal para agregar-->
			<div class="mdl-tabs__panel is-active" id="tabnewproduccion">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-primary text-center tittles">
								Nuevo Envio de Productos
							</div>
                                                   
                                                
							<div class="full-width panel-content">
                                                              <form action="ProduController">
                                        <div class="mdl-grid">
                                                <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--6-col-desktop">
                                                          

                                                 <div class="mdl-textfield mdl-js-textfield">
                                                    
                                                         
                                                     <select  name="txtidproducto" class="form-control" required="">
                                                         <option   value="" disabled=""selected >Seleciona Producto</option>
                                                            <%
                                            productoDAO dao=new productoDAO();
                                            List<producto>list=dao.ListadoEstadoActivo();
                                            Iterator<producto>iter=list.iterator();
                                            producto per=null;
                                            while (iter.hasNext()) {
                                            per = iter.next(); %>        
                                            <option  value="<%= per.getId()%>"><%= per.getNombre()%></option>
                                                         <%}%>
                                                        </select>
                                                       
                                                </div>
                                                           <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                               <input name="txtcantidad" class="mdl-textfield__input" type="number" pattern="-?[1-9]*(\.[1-9]+)?" id="txtcantidad" required>
                                                                   <label class="mdl-textfield__label" for="txtcantidad">Stock</label>
                                                                   <span class="mdl-textfield__error">Invalido Cantidad</span>
                                                           </div>
                                                        <% Date dNow = new Date();
                                                        SimpleDateFormat ft = 
                                                        new SimpleDateFormat ("dd/MM/yyyy - hh:mm:ss");
                                                        String currentDate = ft.format(dNow);
                                                     %>
                                                     <input type="hidden" name="txtfecha" value="<%=currentDate%>"/>        
                                                         
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
			<div class="mdl-tabs__panel" id="tabListproduccion">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-success text-center tittles">
								 Lista de Productos Enviados
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
                                        <th >Producto</th>
                                        <th>Cantidad</th>
                                         <th>Fecha</th>
                                             <th>Estado</th>
                                              <th>Opciones</th>
                                </tr>
                        </thead>
                        <tbody>
                             <%produccionDAO pdao=new produccionDAO();
                                            List<produccion>listS=pdao.Listado();
                                            Iterator<produccion>iterr=listS.iterator();
                                         produccion pro=null;
                                            while (iterr.hasNext()) {
                                            pro = iterr.next(); %>

						<tr>
                                                    <td><%= productoDAO.getProducto(pro.getIdproducto())%></td>
                                                        <td><%= pro.getCantidad()%></td>
                                                        <td><%= pro.getFecha()%></td>
                                                       
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
                                                             
                                                            <a href="ProduController?accion=estado&id=<%= pro.getId()%>" class="btn btn-danger" ><img src="Imagen/delete.png" title="Anular"/></a>
							   
                                                          <%   }else{ %>
                                                           
                                                        <%     }
                                                        %>
                                                          <a href="ProduController?accion=editar&id=<%= pro.getId()%> " type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalEditProduccion" ><img src="Imagen/editar.png" title="Modificar"/></a>
                                                      
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
                 <div class="modal fade" id="myModalEditProduccion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                    <div class="modal-content">
                       
                        <div class="modal-body">
                           
                            
                        </div>
                    </div>                    
                </div>
                  </div>                                   
</body>
</html>