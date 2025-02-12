

<%@page import="DAO.clienteDAO"%>
<%@page import="Bean.proveedor"%>
<%@page import="java.util.List"%>
<%@page import="DAO.proveedorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
     <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>proveedor</title>
	<%@include file="css-js.jsp" %>
</head>
<body>
	
	<!--cabecera de Menu -->
        <%@include file="FrmAdmin.jsp" %>>
        
	<!-- pageContent -->
	<section class="full-width pageContent">
		
		<div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
			<div class="mdl-tabs__tab-bar">
				<a href="#tabNewClient" class="mdl-tabs__tab is-active">NUEVO</a>
				<a href="#tabListClient" class="mdl-tabs__tab">LISTA</a>
			</div>
			<div class="mdl-tabs__panel is-active" id="tabNewClient">
			
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-primary text-center tittles">
								Nuevo Proveedor
							</div>
							<div class="full-width panel-content">
                                                             <form action="ProveedorControlador">
									
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                            <input name="txtnombre"class="mdl-textfield__input" type="text" pattern="-?[A-Za-záéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="NameClient" required="">
										<label class="mdl-textfield__label" for="NameClient">nombre</label>
										<span class="mdl-textfield__error">Invalido nombre</span>
									</div>
									<div class="mdl-textfield mdl-js-textfield" >
                                                                             <select  name="txttipo_documento" class="mdl-textfield__input" required="">
                                                                                 <option  value=""disabled="" selected="">Seleciona tipo de documento</option>
												<option >RUC</option>
												<option >DPI</option>
											</select>
									</div>
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                            <input name="txtnum_documento"class="mdl-textfield__input" type="number" pattern="-?[0-9]*(\.[0-9]+)?" id="DNIClient" required="">
										<label class="mdl-textfield__label" for="DNIClient">Numero de documento</label>
										<span class="mdl-textfield__error">Invalido Numero de documento</span>
									</div>
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                            <input name="txtdireccion" class="mdl-textfield__input" type="text" required="" >
										<label class="mdl-textfield__label" >Direccion</label>
										<span class="mdl-textfield__error">Invalido Direccion</span>
									</div>
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                            <input name="txttelefono" class="mdl-textfield__input" type="number" pattern="-?[0-9+()- ]*(\.[0-9]+)?" required="">
										<label class="mdl-textfield__label" for="phoneClient">Telefono</label>
										<span class="mdl-textfield__error">Invalido numero de Telefono</span>
									</div>
									<div  class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                            <input name="txtemail" class="mdl-textfield__input" type="email" required="">
										<label class="mdl-textfield__label" for="emailClient">E-mail</label>
										<span class="mdl-textfield__error">Invalido E-mail</span>
									</div>
                                                                          
									<div  class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                            <input name="txttelefono_contacto" class="mdl-textfield__input" type="number" pattern="-?[0-9+()- ]*(\.[0-9]+)?" required="">
										<label class="mdl-textfield__label" for="emailClient">telefono_contacto</label>
										<span class="mdl-textfield__error">telefono_contacto</span>
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
			
			
			<div class="mdl-tabs__panel" id="tabListClient">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
						<div class="full-width panel-tittle bg-success text-center tittles">
								lista de Proveedores
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
						
						<table id="datos" number-per-page="2" current-page="" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp full-width table-responsive">
					<thead>
										
						<tr>
						   
							<th >nombre</th>
							<th>N° documento</th>
							<th>Direccion</th>
							<th>-</th>
                                                        <th>C.Telefono</th>
                                                        <th>Email</th>
							<th>opcion</th>
							
						</tr>
					</thead>
					<tbody>
                                             <%
                                                        proveedorDAO CLIdao=new proveedorDAO();
                                                        List<proveedor>list=CLIdao.listado();
                                                        Iterator<proveedor>iter=list.iterator();
                                                        proveedor per=null;
                                                        while (iter.hasNext()) {
                                                                per = iter.next();
                                                        %>
						
						<tr>
						
							 <td><%= clienteDAO.getcliente(per.getId())%></td>
							 <td><%= clienteDAO.getDNI(per.getId())%></td>
                                                          <td><%= clienteDAO.getDireccion(per.getId())%></td>
                                                         <td></td>
                                                        <td><%= per.getTelefono_contacto()%></td>
                                                        <td><%= clienteDAO.getemail(per.getId())%></td>
							<td>
                                                            <a href="ProveedorControlador?accion=eliminar&id=<%= per.getId()%> " type="button" class="btn btn-danger"  ><img src="Imagen/delete.png" title="Modificar"/>      
                                                       
							 <a href="ProveedorControlador?accion=editar&id=<%= per.getId()%> " type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalEditCliente" ><img src="Imagen/editar.png" title="Modificar"/>      
                                                      
                                    
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
    <div class="modal fade" id="myModalEditCliente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
   <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
       <div class="modal-content">

           <div class="modal-body">


           </div>
       </div>                    
   </div>
    </div>
</body>
</html>
