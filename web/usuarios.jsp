<%@page import="DAO.empleadoDAO"%>
<%@page import="Bean.empleado"%>
<%@page import="java.util.Iterator"%>
<%@page import="Bean.usuario"%>
<%@page import="java.util.List"%>
<%@page import="DAO.usuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>usuario</title>
        <%@include file="css-js.jsp" %>
    </head>
    <body>

        <!--cabecera de Menu -->
        <%@include file="FrmAdmin.jsp" %>

        <!-- pageContent -->
        <section class="full-width pageContent">

            <div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
                <div class="mdl-tabs__tab-bar">
                    <a href="#tabNewAdmin" class="mdl-tabs__tab is-active">NUEVO</a>
                    <a href="#tabListAdmin" class="mdl-tabs__tab">LISTA</a>
                </div>

                <div class="mdl-tabs__panel is-active" id="tabNewAdmin">
                    <div class="mdl-grid">
                        <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
                            <div class="full-width panel mdl-shadow--2dp">
                                <div class="full-width panel-tittle bg-primary text-center tittles">
                                    Nuevo Usuario
                                </div>
                                <div class="full-width panel-content">
                                    <form action="Usuariocontroller">
                                        <div class="mdl-textfield mdl-js-textfield">
                                            <select name="txtidempleado" class="mdl-textfield__input" required="">
                                                <option  value=""disabled="" selected="">Seleciona Empleado</option>
                                                <%   empleadoDAO edao = new empleadoDAO();
                                                    List<empleado> lista = edao.Listado();
                                                    Iterator<empleado> itera = lista.iterator();
                                                empleado empl = null;
                                                while (itera.hasNext()) {
                                                    empl = itera.next();%>

                                                <option  value="<%= empl.getId()%>" ><%= empl.getNombre()%></option>
                                                <%}%>

                                            </select>
                                        </div>

                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input name="txtusu" class="mdl-textfield__input" type="text" pattern="-?[A-Za-z0-9áéíóúÁÉÍÓÚ]*(\.[0-9]+)?" id="UserNameAdmin" required="">
                                            <label class="mdl-textfield__label" for="UserNameAdmin">User Name</label>
                                            <span class="mdl-textfield__error">Invalid user name</span>
                                        </div>
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input name="txtpassword" class="mdl-textfield__input" type="password" id="passwordAdmin" required="">
                                            <label class="mdl-textfield__label" for="passwordAdmin">Password</label>
                                            <span class="mdl-textfield__error">Invalid password</span>
                                        </div>

                                        <div class="mdl-textfield mdl-js-textfield">
                                            <select name="txtrol" class="mdl-textfield__input" required="">
                                                <option  value=""disabled="" selected="">Seleciona Rol</option>
                                                <option >Administrador</option>
                                                <option >Ventas</option>
                                                <option >Almacen</option>
                                                <option >Produccion</option>
                                            </select>
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
                <div class="mdl-tabs__panel" id="tabListAdmin">
                    <div class="mdl-grid">
                        <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
                            <div class="full-width panel-tittle bg-success text-center tittles">
                                lista de Usuarios
                            </div>

                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
                                <label class="mdl-button mdl-js-button mdl-button--icon" for="buscar">
                                    <i class="zmdi zmdi-search"></i>
                                </label>
                                <div class="mdl-textfield__expandable-holder">
                                    <input onkeyup="doSearch()" class="mdl-textfield__input" type="text" id="buscar">
                                    <label class="mdl-textfield__label"></label>
                                </div>
                            </div>

                            <table  id="datos" number-per-page="4" current-page=""class="mdl-data-table mdl-js-data-table mdl-shadow--2dp full-width table-responsive">
                                <thead>

                                    <tr>

                                        <th>Empleado</th>
                                        <th>Usuario</th>
                                        <th>Rol</th>
                                        <th>Direccion</th>
                                        <th>Sueldo</th>

                                        <th>opcion</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        usuarioDAO dao = new usuarioDAO();
                                        List<usuario> list = dao.Listado();
                                        Iterator<usuario> iter = list.iterator();
                                        usuario per = null;
                                        while (iter.hasNext()) {
                                            per = iter.next();

                                    %>
                                    <tr>
                                        <td ><%= empleadoDAO.getEmpleadoNombre(per.getIdempleado())%> </td>
                                        <td ><%= per.getUsu()%> </td>
                                        <td><%= per.getRol()%> </td>
                                        <td ><%=empleadoDAO.getEmpleadoDireccion(per.getIdempleado())%> </td>
                                        <td><%= empleadoDAO.getEmpleadoSueldo(per.getIdempleado())%> </td>
                                        <td>
                                            <a href="Usuariocontroller?accion=editar&id=<%= per.getId()%> " type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalEditusuario" ><img src="Imagen/editar.png" title="Modificar"/></a>
                                            <a href="Usuariocontroller?accion=eliminar&id=<%= per.getId()%>" class="btn btn-danger" ><img src="Imagen/delete.png" title="Eliminar"/></a> 
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

        <!--Formulario de Modificar-->
        <div class="modal fade" id="myModalEditusuario" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                <div class="modal-content">

                    <div class="modal-body">


                    </div>
                </div>                    
            </div>
        </div>                                       


    </body>
</html>