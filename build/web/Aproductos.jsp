<%@page import="Bean.diseño"%>
<%@page import="DAO.diseñoDAO"%>
<%@page import="Bean.marca"%>
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
     /* estado desactivado */
 markdesactivado {
    background-color: #ff1744;
    color: black;
    border-radius: 71px 69px 72px 71px;
    -moz-border-radius: 71px 69px 72px 71px;
    -webkit-border-radius: 71px 69px 72px 71px;
}
/* estado activo */
 markactivo {
    background-color: #00FF00;
    color: black;
    border-radius: 71px 69px 72px 71px;
    -moz-border-radius: 71px 69px 72px 71px;
    -webkit-border-radius: 71px 69px 72px 71px;
}
</style>
<body>
    <!-- Inicio Cabecera de Menu -->
    <%@include file="FrmAlmacen.jsp" %>
    
    <!-- pageContent -->
    <section class="full-width pageContent">
        <div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
            <div class="mdl-tabs__tab-bar">
                <a href="#tabNewProduct" class="mdl-tabs__tab is-active">NUEVO</a>
                <a href="#tabListProducts" class="mdl-tabs__tab">LISTA</a>
            </div>
            <div class="mdl-tabs__panel is-active" id="tabNewProduct">
                <!-- Formulario Nuevo Producto -->
            </div>
            <div class="mdl-tabs__panel" id="tabListProducts">
                <div class="mdl-grid">
                    <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
                        <div class="full-width panel-tittle bg-success text-center tittles">
                            Productos
                        </div>

                        <!-- Código Alerta Stock Minimo -->
                        <%productoDAO pdaoStcok=new productoDAO();
                            List<producto>listStock=pdaoStcok.ListadoStockMinimo();
                            Iterator<producto>iterstock=listStock.iterator();
                            producto pstock=null;
                            while (iterstock.hasNext()) {
                            pstock = iterstock.next(); %>
                            <div class="full-width panel-tittle bg-danger text-center tittles">
                                Alerta Stock: <%=pstock.getNombre()%> = <%= pstock.getStock()%>
                            </div>
                        <%}%>

                        <!-- Tabla Lista de Productos -->
                        <table id="datos" number-per-page="6" current-page="" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp full-width table-responsive">
                            <thead>
                                <tr>
                                    <th class="mdl-data-table__cell--non-numeric">Nombre</th>
                                    <th>Talla</th>
                                    <th>precio de venta</th>
                                    <th>Stock</th>
                                    <th>categoria</th>
                                    <th>Marca</th>
                                    <th>Diseño</th>
                                    <th>Estado</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%productoDAO pdao=new productoDAO();
                                    List<producto>listS=pdao.Listado();
                                    Iterator<producto>iterr=listS.iterator();
                                    producto pro=null;
                                    while (iterr.hasNext()) {
                                    pro = iterr.next(); %>
                                    <tr>
                                        <td class="mdl-data-table__cell--non-numeric"><%= pro.getNombre()%></td>
                                        <td><%= pro.gettalla()%></td>
                                        <td>Q<%= pro.getPrecio_venta()%></td>
                                        <td><%= pro.getStock()%></td>
                                        <td><%= categoriaDAO.getCategoria(pro.getIdcategoria())%></td>
                                        <td><%= marcaDAO.getmarca(pro.getIdmarca())%></td>
                                        <td><%= diseñoDAO.getdiseño(pro.getIddiseño())%></td>

                                        <% String Estado=productoDAO.estado(pro.getId());
                                        if(Estado.equalsIgnoreCase("Activo")) { %>
                                            <td><markactivo><%= Estado %></markactivo></td>   
                                        <% } else { %>
                                            <td><markdesactivado><%= Estado %></markdesactivado></td>    
                                        <% } %>
                                        
                                        <td>
                                            <a href="AProductocontroller?accion=editar&id=<%= pro.getId()%> " class="btn btn-info" data-toggle="modal" data-target="#myModalEditProducto"><img src="Imagen/editar.png" title="Modificar"/></a>
                                            <a href="AProductocontroller?accion=estado&id=<%= pro.getId()%>" class="btn btn-danger"><img src="Imagen/delete.png" title="Desactivar"/></a>
                                        </td>
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
</html>
