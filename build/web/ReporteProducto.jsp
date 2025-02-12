<%-- 
    Document   : ReporteProducto
    Created on : 04/11/2018, 06:55:19 AM
    Author     : Angel Albinagorta
--%>

<%@page import="DAO.diseñoDAO"%>
<%@page import="DAO.categoriaDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.productoDAO"%>
<%@page import="Bean.producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
     <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Reporte Producto</title>
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
								Reporte de Producto
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
						        <th  style="background-color:turquoise; color:navy">nombre</th>
							<th style="background-color: turquoise; color:navy">precio de venta</th>
							<th style="background-color: turquoise; color:navy">Stock</th>
							<th style="background-color: turquoise; color:navy">categoria</th>
                                                        <th style="background-color: turquoise; color:navy">Diseño</th>
                                                        <th style="background-color: turquoise; color:navy">Marca</th>
                                                         <th style="background-color: turquoise; color:navy">Estado</th>
						
                                      
						</tr>
					</thead>
					<tbody><%
                                                        productoDAO CLIdao=new productoDAO();
                                                        List<producto>list=CLIdao.Listado();
                                                        Iterator<producto>iter=list.iterator();
                                                        producto per=null;
                                                        while (iter.hasNext()) {
                                                                per = iter.next();
                                                        %>
						<tr>
						<td><%= per.getId()%></td>
                                                <td><%= per.getNombre()%></td>
                                                <td><%= per.getPrecio_venta()%></td>
                                                <td><%= per.getStock()%></td>
                                                <td><%= categoriaDAO.getCategoria(per.getIdcategoria())%></td>
                                                <td><%= diseñoDAO.getdiseño(per.getIddiseño())%></td>
                                                <td><%= marcaDAO.getmarca(per.getIdmarca())%></td>
                                                 <% String Estado=productoDAO.estado(per.getId());
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