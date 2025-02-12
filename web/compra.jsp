

<%@page import="Bean.proveedor"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="Bean.compra"%>
<%@page import="DAO.compraDAO"%>
<%@page import="DAO.clienteDAO"%>
<%@page import="DAO.proveedorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
     <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Compra</title>
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
				<a href="#tabNewVenta" class="mdl-tabs__tab is-active">NUEVO</a>
				<a href="#tabListVenta" class="mdl-tabs__tab">LISTAR</a>
			</div>
			<div class="mdl-tabs__panel is-active" id="tabNewVenta">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-primary text-center tittles">
								Nuevo Compra
							</div>
							<div class="full-width panel-content">
								
									
						<form action="DetalleCCompra">
										   <div class="mdl-grid">
                                                <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--6-col-desktop">
                                                          

                                                 <div class="mdl-textfield mdl-js-textfield">
                                                           
                                                     <select name="txtidproveedor" class="mdl-textfield__input" required>
                                                         <option   value=""disabled="" selected="">Seleciona Proveedor</option>
                                                          <%
                                    proveedorDAO dao=new proveedorDAO();
                                    List<proveedor>list=dao.listado();
                                    Iterator<proveedor>iter=list.iterator();
                                    proveedor per=null;
                                    while (iter.hasNext()) {
                                    per = iter.next(); %>        


                                    <option  value="<%= per.getId()%>"><%= clienteDAO.getcliente(per.getId())%></option>
                         <%}%>
                                                        </select>
                                                         
                                                       
                                                </div>
                                               <select name="txttipocomprbante" class="mdl-textfield__input" required>
                                                   <option  value=""disabled="" selected="">Seleciona Tipo de Com.</option>
                                                            <option value="Boleta"> Boleta </option>
                                                            <option value="Factura">Factura</option>
                                                        </select>
                                              
                                                           <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                   <input name="txtseriecomprbante" class="mdl-textfield__input" type="text" pattern="-?[A-Za-z0-9áéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="NameProduct"required >
                                                                   <label class="mdl-textfield__label" for="NameProduct">Serie de Comprobante</label>
                                                                   <span class="mdl-textfield__error">Invalido Serie de Comprobante</span>
                                                           </div>
                                                      <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                   <input name="txtnum_comprobante" class="mdl-textfield__input" type="text" pattern="-?[0-9.]*(\.[0-9]+)?" id="PriceProduct" required>
                                                                   <label class="mdl-textfield__label" for="PriceProduct">Num.Comprobante </label>
                                                                   <span class="mdl-textfield__error">Invalido Num.Comprobante</span>
                                                           </div>
                                                          

                                                </div>
                                                   <% Date dNow = new Date();
                                                        SimpleDateFormat ft = 
                                                        new SimpleDateFormat ("dd/MM/yyyy - hh:mm:ss");
                                                        String currentDate = ft.format(dNow);
                                                     %>
                                                     <input type="hidden" name="txtfecha" value="<%=currentDate%>"/>     
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
			
		
		<div class="mdl-tabs__panel" id="tabListVenta">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
						<div class="full-width panel-tittle bg-success text-center tittles">
								lista de compras
							</div>
						<form action="#">
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
								<label class="mdl-button mdl-js-button mdl-button--icon" for="buscar">
									<i class="zmdi zmdi-search"></i>
								</label>
								<div class="mdl-textfield__expandable-holder">
									<input onkeyup="doSearch()" class="mdl-textfield__input" type="text" id="buscar">
									<label class="mdl-textfield__label"></label>
								</div>
							</div>
						</form>
						<table   id="datos" number-per-page="4" current-page="" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp full-width table-responsive">
					<thead>
										
						<tr>
						   
							
							<th class="mdl-data-table__cell--non-numeric">Proveedor</th>
							<th>Tipo Comprobante</th>
							<th>Serie Comprobante</th>
                                                        <th>Fecha</th>
                                                       <th>total</th>
                                                        <th>Estado</th>
							<th>opcion</th>
						</tr>
					</thead>
					<tbody>
						
                                            <%  compraDAO pdao=new compraDAO();
                                            List<compra>listS=pdao.Listadocompra();
                                            Iterator<compra>iterr=listS.iterator();
                                         compra pro=null;
                                           double total=0;
                                            while (iterr.hasNext()) {
                                            pro = iterr.next(); %>

						<tr>
                                                    <td class="mdl-data-table__cell--non-numeric"><%= clienteDAO.getcliente(pro.getIdproveedor())%></td>
							<td><%= pro.getTipo_comprobante()%></td>
                                                        <td><%= pro.getSerie_comprobante()%></td>
                                                           <td><%= pro.getFecha_hora()%></td>
                                                           <td>Q<%= pro.getTotal()%></td>
                                                            <% total=total+pro.getTotal();%>
                                                              <% String Estado=pro.getEstado();
                                                         if(Estado.equalsIgnoreCase("Comprado")){ %>
                                                             
                                                              <td><markactivo><%= Estado %></markactivo></td>   
                                                          <%   }else{ %>
                                                           
                                                                 <td><markdesactivado><%= Estado %></markdesactivado></td>    
                                                        <%     }
                                                        %>
							<td>
                                                          
                                                          <% 
                                                         if(Estado.equalsIgnoreCase("Comprado")){ %>
                                                             
                                                            <a href="DetalleCCompra?accion=estado&id=<%= pro.getId()%>" class="btn btn-danger" ><img src="Imagen/delete.png" title="Anular"/></a>
							   
                                                          <%   }else{ %>
                                                           
                                                        <%     }
                                                        %>
                                                             <a href="DetalleCCompra?accion=reporte&id=<%= pro.getId()%>" class="btn btn-success" ><img src="Imagen/lpdf.png" title="Reporte"/></a>
							
                                                        </td>
						</tr>
						<%}%>
						
						
					</tbody>
				</table>
                                              <h4 style="background-color: chartreuse; color:navy">Total Vendido Q <%=total%></h4>
				</div>
			</div>
		</div>
	</div>
	</section>
</body>

</html>
