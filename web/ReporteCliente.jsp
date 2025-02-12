

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Cliente"%>
<%@page import="DAO.clienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
     <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Reporte Cliente</title>
	<%@include file="css-js.jsp" %>
</head>
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
								Reporte de Cliente
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
						        <th  style="background-color:turquoise; color:navy">nombre</th>
							<th style="background-color: turquoise; color:navy">tipo documento</th>
							<th style="background-color: turquoise; color:navy">N° documento</th>
							<th style="background-color: turquoise; color:navy">Direccion</th>
							<th style="background-color: turquoise; color:navy">Telefono</th>
                                                        <th style="background-color: turquoise; color:navy">Email</th>
						</tr>
					</thead>
					<tbody><%
                                                        clienteDAO CLIdao=new clienteDAO();
                                                        List<Cliente>list=CLIdao.Listado();
                                                        Iterator<Cliente>iter=list.iterator();
                                                        Cliente per=null;
                                                        while (iter.hasNext()) {
                                                                per = iter.next();
                                                        %>
						<tr>
						
							
						       
							<td><%= per.getNombre()%></td>
							<td><%= per.getTipo_documento()%></td>
							<td><%= per.getNum_documento()%></td>
							<td><%= per.getDireccion()%></td>
							<td><%= per.getTelefono()%></td>
                                                        <td><%= per.getEmail()%></td>
							
						
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