


<%@page import="DAO.clienteDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Bean.venta"%>
<%@page import="DAO.ventaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
     <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Reporte Ventas</title>
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
        <%@include file="FrmVenta.jsp" %>>
        
	<!-- pageContent -->
	<section class="full-width pageContent">
		
         
			
			<div class="mdl-tabs__panel" >
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
					
						
							
                                             <center><a href="#" onclick="ReportePDF()" class="btn btn-primary"  ><img src="Imagen/mpdf.png" title="pdf">Reporte PDF</a>
                                              <a href="#" onclick="ReporteExcel('datos', 'Reporte')" class="btn btn-success" style="margin: 10px" ><img src="Imagen/excel.png" title="pdf">Reporte Excel</a> </center>
                                              <div id="PDF">
						<div class="full-width panel-tittle bg-success text-center tittles">
								Reporte de Ventas
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
						        <th  style="background-color:turquoise; color:navy">Cliente</th>
							<th style="background-color: turquoise; color:navy">Tipo Comprobante</th>
							<th style="background-color: turquoise; color:navy">Serie Comprobante</th>
							<th style="background-color: turquoise; color:navy">N°Comprobante</th>
                                                        <th style="background-color: turquoise; color:navy">Fecha</th>
                                                        <th style="background-color: turquoise; color:navy">total</th>
                                                        <th style="background-color: turquoise; color:navy">Estado</th>
						
                                      
						</tr>
					</thead>
                                           
					<tbody>
						
                                            <%  ventaDAO pdao=new ventaDAO();
                                            List<venta>listS=pdao.ListadoVenta();
                                            Iterator<venta>iterr=listS.iterator();
                                         venta pro=null;
                                           double total=0;
                                            while (iterr.hasNext()) {
                                            pro = iterr.next(); %>

                                            <tr><td ><%= pro.getId()%></td>
                                                    <td><%= clienteDAO.getcliente(pro.getIdcliente())%></td>
							<td><%= pro.getTipo_comprobante()%></td>
                                                        <td><%= pro.getRuc()%></td>
                                                          <td><%= pro.getNum_comprobante()%></td>
                                                           <td><%= pro.getFecha_hora()%></td>
                                                           <td>Q<%= pro.getTotal()%></td>
                                                            <% total=total+pro.getTotal();%>
                                                              <% String Estado=pro.getEstado();
                                                         if(Estado.equalsIgnoreCase("Vendido")){ %>
                                                             
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