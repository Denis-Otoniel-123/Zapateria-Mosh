

<%@page import="Bean.diseño"%>
<%@page import="Bean.marca"%>
<%@page import="DAO.diseñoDAO"%>
<%@page import="DAO.marcaDAO"%>
<%@page import="Bean.producto"%>
<%@page import="DAO.productoDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="Bean.categoria"%>
<%@page import="java.util.List"%>
<%@page import="DAO.categoriaDAO"%>
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
        <%@include file="FrmAdmin.jsp" %>
	<!-- pageContent -->
	<section class="full-width pageContent">
		
		<div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
			<div class="mdl-tabs__tab-bar">
				<a href="#tabNewProduct" class="mdl-tabs__tab is-active">NUEVO</a>
				<a href="#tabListProducts" class="mdl-tabs__tab">LISTA</a>
			</div>
			<div class="mdl-tabs__panel is-active" id="tabNewProduct">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-primary text-center tittles">
								Nuevo Producto
                        </div>
                        <div class="full-width panel-content">
                            <form action="Productocontroller">
                                        <div class="mdl-grid">
                                                <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--6-col-desktop">
                                                          

                                                 <div class="mdl-textfield mdl-js-textfield">
                                                           
                                                     <select name="txtidcategoria" class="mdl-textfield__input" required>
                                                            <option   value=""disabled="" selected="">Seleciona categoria</option>
                                                            <%
                                            categoriaDAO dao=new categoriaDAO();
                                            List<categoria>list=dao.ListadoEstadoActivos();
                                            Iterator<categoria>iter=list.iterator();
                                            categoria per=null;
                                            while (iter.hasNext()) {
                                            per = iter.next(); %>
                                                              
                                                                <option  value="<%= per.getCodigo()%>" required><%= per.getNombre()%></option>
                                                         <%}%>
                                                        </select>
                                                       
                                                </div>
                                               <div class="mdl-textfield mdl-js-textfield">
                                                           
                                                     <select name="txtmarca" class="mdl-textfield__input" required>
                                                         <option value="" disabled="" selected="">Seleciona Marca</option>
                                                            <%
                                            marcaDAO daom=new marcaDAO();
                                            List<marca>listm=daom.ListadoEstadoActivos();
                                            Iterator<marca>iterm=listm.iterator();
                                            marca m=null;
                                            while (iterm.hasNext()) {
                                            m= iterm.next(); %>
                                                              
                                                                <option  value="<%= m.getId()%>" ><%= m.getNombre()%></option>
                                                         <%}%>
                                                        </select>
                                                       
                                                </div>
                                                 <div class="mdl-textfield mdl-js-textfield">
                                                           
                                                     <select name="txtdiseno" class="mdl-textfield__input"  required="">
                                                            <option  value="" disabled="" selected="">Seleciona Diseño</option>
                                                            <%
                                            diseñoDAO daod=new diseñoDAO();
                                            List<diseño>listd=daod.ListadoEstadoActivos();
                                            Iterator<diseño>iterd=listd.iterator();
                                            diseño d=null;
                                            while (iterd.hasNext()) {
                                            d = iterd.next(); %>
                                                              
                                                                <option  value="<%= d.getId()%>" ><%= d.getNombre()%></option>
                                                         <%}%>
                                                        </select>
                                                       
                                                </div>        
                                                        
                                              
                                                           <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                   <input name="txtnombre" class="mdl-textfield__input" type="text" pattern="-?[A-Za-z0-9áéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="NameProduct"required >
                                                                   <label class="mdl-textfield__label" for="NameProduct">Nombre</label>
                                                                   <span class="mdl-textfield__error">Invalido nombre</span>
                                                           </div>
                                                         <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                   <input name="txttalla" class="mdl-textfield__input" type="text" id="NameProduct">
                                                                   <label class="mdl-textfield__label" for="Nametalla">Talla</label>
                                                                   <span class="mdl-textfield__error">Invalido Talla</span>
                                                           </div>
                                                      <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                   <input name="txtprecioventa" class="mdl-textfield__input" type="text" pattern="-?[0-9.]*(\.[0-9]+)?" id="PriceProduct" required>
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
<div class="mdl-tabs__panel" id="tabListProducts">
   <div class="mdl-grid">
           <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
                   <div class="full-width panel-tittle bg-success text-center tittles">
                   Lista de Productos       
                   </div>
              
                               <%productoDAO pdaoStcok=new productoDAO();
                                            List<producto>listStock=pdaoStcok.ListadoStockMinimo();
                                            Iterator<producto>iterstock=listStock.iterator();
                                         producto pstock=null;
                                            while (iterstock.hasNext()) {
                                            pstock = iterstock.next(); %>

						  <div class="full-width panel-tittle bg-danger text-center tittles">
							Alerta Stock:<%=pstock.getNombre()%>=<%= pstock.getStock()%>
                                                    
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
                                
                                  
                               <table id="datos" number-per-page="6" current-page="" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp full-width table-responsive">
    <thead>
        <tr>
            <th class="mdl-data-table__cell--non-numeric">Nombre</th>
            <th>Precio de Venta</th>
            <th>Stock</th>
            <th>Categoría</th>
            <th>Marca</th>
            <th>Diseño</th>
            <th>Talla</th>
            <th>Estado</th>
            <th>Opciones</th>
        </tr>
    </thead>
    <tbody>
        <% 
            productoDAO pdao = new productoDAO();
            List<producto> listS = pdao.Listado();
            Iterator<producto> iterr = listS.iterator();
            producto pro = null;
            while (iterr.hasNext()) {
                pro = iterr.next(); 
        %>
        <tr>
            <td class="mdl-data-table__cell--non-numeric"><%= pro.getNombre() %></td>
            <td>Q<%= pro.getPrecio_venta() %></td>
            <td><%= pro.getStock() %></td>
            <td><%= categoriaDAO.getCategoria(pro.getIdcategoria()) %></td>
            <td><%= marcaDAO.getmarca(pro.getIdmarca()) %></td>
            <td><%= diseñoDAO.getdiseño(pro.getIddiseño()) %></td>
            <td><%= pro.gettalla() %></td> <!-- Aquí se muestra la talla -->
            
            <% 
                String Estado = productoDAO.estado(pro.getId());
                if (Estado.equalsIgnoreCase("Activo")) { 
            %>
                <td><markactivo><%= Estado %></markactivo></td>   
            <% } else { %>
                <td><markdesactivado><%= Estado %></markdesactivado></td>    
            <% } %>

            <td>
                <a href="Productocontroller?accion=editar&id=<%= pro.getId() %>" type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalEditProducto">
                    <img src="Imagen/editar.png" title="Modificar"/>
                </a>
                <a href="Productocontroller?accion=estado&id=<%= pro.getId() %>" class="btn btn-danger">
                    <img src="Imagen/delete.png" title="Desactivar"/>
                </a>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>

				</div>
			</div>
		</div>
                                               

	</section>
                                                
                                                
           <!--Formulario de Modificar-->
                 <div class="modal fade" id="myModalEditProducto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                    <div class="modal-content">
                       
                        <div class="modal-body">
                           
                            
                        </div>
                    </div>                    
                </div>
                  </div>
                                              
</body>
</html>