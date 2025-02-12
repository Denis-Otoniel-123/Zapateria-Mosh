

<%@page import="DAO.PrimaDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="Bean.pedidoprima"%>
<%@page import="java.util.List"%>
<%@page import="DAO.pedidoprimaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
     <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Reporte Pedido Prima</title>
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
        <%@include file="FrmAdmin.jsp" %>>
        
	<!-- pageContent -->
	<section class="full-width pageContent">
		
         
			
			<div class="mdl-tabs__panel" >
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
					
						
							
                                             <center><a href="#" onclick="ReportePDF()" class="btn btn-primary"  ><img src="Imagen/mpdf.png" title="pdf">Reporte PDF</a>
                                              <a href="#" onclick="ReporteExcel('datos', 'Reporte')" class="btn btn-success" style="margin: 10px" ><img src="Imagen/excel.png" title="pdf">Reporte Excel</a> </center>
                                              <div id="PDF">
						<div class="full-width panel-tittle bg-success text-center tittles">
								Reporte de Pedidos Material
							</div>
                                                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
								<label class="mdl-button mdl-js-button mdl-button--icon" for="buscar">
									<i class="zmdi zmdi-search"></i>
								</label>
								<div class="mdl-textfield__expandable-holder">
									<input type="text" onkeyup="doSearch()" class="mdl-textfield__input"  id="buscar">
									<label class="mdl-textfield__label"></label>
								</div>
                                                            
							</div>
						<table id="datos"  class="mdl-data-table mdl-js-data-table mdl-shadow--2dp full-width table-responsive">
					<thead>
										
						<tr>   
                                                        <th  style="background-color:turquoise; color:navy">N:</th>
						        <th  style="background-color:turquoise; color:navy">Material</th>
							<th style="background-color: turquoise; color:navy">Cantidad</th>
							<th style="background-color: turquoise; color:navy">Fecha</th>
							<th style="background-color: turquoise; color:navy">Descripcion</th>
                                                        <th style="background-color: turquoise; color:navy">Estado</th>
						
                                      
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
                                                    <td><%= pro.getId()%></td>
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
                                                        
						</tr>
						<%}%>
						
					</tbody>
				</table>
				</div>
                                        </div>
			</div>
		</div>
	                         
          
         </section>
</body>
<%@include file="pdf-excel-js.jsp" %>
        
</html>