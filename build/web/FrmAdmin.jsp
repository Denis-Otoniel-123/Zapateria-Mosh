
<%@page import="com.sun.xml.wss.saml.assertion.saml11.jaxb10.AuthorityBinding"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="DAO.marcaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<%
    HttpSession sesion=request.getSession();
    if(sesion.getAttribute("tipo")==null){
      
     
          response.sendRedirect("index.jsp");
    }else{
        String tipo=sesion.getAttribute("tipo").toString();
        if(!tipo.equals("Administrador")){
            response.sendRedirect("index.jsp");
        }
    }
%>

<!-- navBar -->
	<div class="full-width navBar">
		<div class="full-width navBar-options">
			<i class="zmdi zmdi-more-vert btn-menu" id="btn-menu"></i>	
			<div class="mdl-tooltip" for="btn-menu">Menu</div>
			<nav class="navBar-options-list">
				<ul class="list-unstyle">
					<li class="btn-exit" id="btn-exi">
						<i class="zmdi zmdi-power"></i>
						<div class="mdl-tooltip" for="btn-exi">Salir</div>
					</li>
                                      
                                        <li class="text-condensedLight noLink" ><small><%= sesion.getAttribute("usuario")%></small></li>
					<li class="noLink">
						<figure>
							<img src="assets/img/avatar-male.png" alt="Avatar" class="img-responsive">
						</figure>
					</li>
				</ul>
			</nav>
		</div>
	</div>
	<!-- navLateral -->
	<section class="full-width navLateral">
		<div class="full-width navLateral-bg btn-menu"></div>
		<div class="full-width navLateral-body">
			<div class="full-width navLateral-body-logo text-center tittles">
				<i class="zmdi zmdi-close btn-menu"></i> Administrador
			</div>
			<figure class="full-width" style="height: 77px;">
				<div class="navLateral-body-cl">
					<img src="assets/img/avatar-male.png" alt="Avatar" class="img-responsive">
				</div>
				<figcaption class="navLateral-body-cr hide-on-tablet">
					<span>
						Bienvenido<br>
						<small>Admin</small>
					</span>
				</figcaption>
			</figure>
			<div class="full-width tittles navLateral-body-tittle-menu">
				<i class="zmdi zmdi-desktop-mac"></i><span class="hide-on-tablet">&nbsp; ESCRITORIO</span>
			</div>
			
			<nav class="full-width">
				<ul class="full-width list-unstyle menu-principal">
					<li class="full-width divider-menu-h"></li>
					<!--inicio almacen---->
					<li class="full-width">
						<a href="#" class="full-width btn-subMenu">
							<div class="navLateral-body-cl">
								<i class="zmdi zmdi-case"></i>
							</div>
							<div class="navLateral-body-cr hide-on-tablet">
								AlMACEN
							</div>
							<span class="zmdi zmdi-chevron-left"></span>
						</a>
						<ul class="full-width menu-principal sub-menu-options">
							<li class="full-width">
							<a href="diseño.jsp" class="full-width">
								<div class="navLateral-body-cl">
									<i class="zmdi zmdi-label"></i>
								</div>
								<div class="navLateral-body-cr hide-on-tablet">
									DISEÑOS
								</div>
							</a>
						   </li>
                                                   <li class="full-width">
							<a href="marca.jsp" class="full-width">
								<div class="navLateral-body-cl">
									<i class="zmdi zmdi-label"></i>
								</div>
								<div class="navLateral-body-cr hide-on-tablet">
									MARCAS
								</div>
							</a>
						   </li>
							<li class="full-width">
							<a href="productos.jsp" class="full-width">
								<div class="navLateral-body-cl">
									<i class="zmdi zmdi-washing-machine"></i>
								</div>
								<div class="navLateral-body-cr hide-on-tablet">
									PRODUCTOS
								</div>
							</a>
						   </li>
							<li class="full-width">
								<a href="categoria.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-label"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										CATEGORIAS
									</div>
								</a>
							</li>
                                                        <li class="full-width">
								<a href="prima.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-washing-machine"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										MATERIA PRIMA
									</div>
								</a>
							</li>
						</ul>
					</li>
					<!--fin almacen---->
					<!--inicio producion---->
					<li class="full-width divider-menu-h"></li>
					<li class="full-width">
						<a href="#" class="full-width btn-subMenu">
							<div class="navLateral-body-cl">
								<i class="zmdi zmdi-balance"></i>
							</div>
							<div class="navLateral-body-cr hide-on-tablet">
								PRODUCION
							</div>
							<span class="zmdi zmdi-chevron-left"></span>
						</a>
						<ul class="full-width menu-principal sub-menu-options">
							
							<li class="full-width">
								<a href="produccion.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-local-shipping"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										INGRESO DE PRODUCION
									</div>
								</a>
							</li>
                                                        <li class="full-width">
								<a href="pedidoprima.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-washing-machine"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										PEDIDO MATERIA PRIMA
									</div>
								</a>
							</li>
							
						
						</ul>
					</li>
					<!--fin producion---->
					
					<!--inicio ventas---->
					<li class="full-width divider-menu-h"></li>
					<li class="full-width">
						<a href="#" class="full-width btn-subMenu">
							<div class="navLateral-body-cl">
								<i  class="zmdi zmdi-shopping-cart"></i>
							</div>
							<div class="navLateral-body-cr hide-on-tablet">
								VENTA
							</div>
							<span class="zmdi zmdi-chevron-left"></span>
						</a>
						<ul class="full-width menu-principal sub-menu-options">
						<li class="full-width divider-menu-h"></li>	
							<li class="full-width">
                                                            <a href="clientes.jsp" class="full-width">
                                                                    <div class="navLateral-body-cl">
                                                                    <i class="zmdi zmdi-account "></i>
                                                                    </div>
                                                                    <div class="navLateral-body-cr hide-on-tablet">
                                                                            CLIENTES
                                                                    </div>
                                                            </a>
							</li>
							<li class="full-width">
							<a href="ventas.jsp" class="full-width">
							<div class="navLateral-body-cl">
							<i class="zmdi zmdi-shopping-cart"></i>							
							</div>
							<div  class="navLateral-body-cr hide-on-tablet">
								VENTAS
							</div>
						    </a>
							</li>
						
						</ul>
					</li>
					<!--fin ventas---->
					<!--iniio compra-->
                                        <li class="full-width divider-menu-h"></li>
					<li class="full-width">
						<a href="#" class="full-width btn-subMenu">
							<div class="navLateral-body-cl">
								<i  class="zmdi zmdi-shopping-cart"></i>
							</div>
							<div class="navLateral-body-cr hide-on-tablet">
								COMPRA
							</div>
							<span class="zmdi zmdi-chevron-left"></span>
						</a>
						<ul class="full-width menu-principal sub-menu-options">
						<li class="full-width divider-menu-h"></li>	
							<li class="full-width">
                                                            <a href="proveedor.jsp" class="full-width">
                                                                    <div class="navLateral-body-cl">
                                                                    <i class="zmdi zmdi-account "></i>
                                                                    </div>
                                                                    <div class="navLateral-body-cr hide-on-tablet">
                                                                            PROVEEDORES
                                                                    </div>
                                                            </a>
							</li>
							<li class="full-width">
							<a href="compra.jsp" class="full-width">
							<div class="navLateral-body-cl">
							<i class="zmdi zmdi-shopping-cart"></i>							
							</div>
							<div  class="navLateral-body-cr hide-on-tablet">
								COMPRAS
							</div>
						    </a>
							</li>
						
						</ul>
					</li>
                                        <!--fin compra-->
					<!--inicio Acceso---->
					<li class="full-width divider-menu-h"></li>
					<li class="full-width">
						<a href="#!" class="full-width btn-subMenu">
							<div class="navLateral-body-cl">
								<i class="zmdi zmdi-face"></i>
							</div>
							<div class="navLateral-body-cr hide-on-tablet">
								ACCESO
							</div>
							<span class="zmdi zmdi-chevron-left"></span>
						</a>
						<ul class="full-width menu-principal sub-menu-options">
							<li class="full-width">
								<a href="usuarios.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-key"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										USUARAIOS
									</div>
								</a>
							</li>
                                                        <li class="full-width">
								<a href="empleado.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-account"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										EMPLEADOS
									</div>
								</a>
							</li>
							
							
						</ul>
					</li>
					<!--fin acceso---->
                                        
                                        <!--inicio archivos---->
					
					<!--fin archivos---->
					<!--inicio reportes---->
					<li class="full-width divider-menu-h"></li>
					<li class="full-width">
						<a href="#" class="full-width btn-subMenu">
                                                    
							<div class="navLateral-body-cl">
								<i class="zmdi zmdi-cloud-download"></i>
							</div>
							<div class="navLateral-body-cr hide-on-tablet">
								REPORTES
							</div>
                                                       
							<span class="zmdi zmdi-chevron-left"></span>
						</a>
						<ul class="full-width menu-principal sub-menu-options">
							<li class="full-width">
								<a href="ReporteVentas.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
									 VENTA
								</div>
								</a>
							</li>
                                                        <li class="full-width">
								<a href="ReporteCompra.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
									 
                                                                            COMPRA
								</div>
								</a>
							</li>
                                                         <li class="full-width">
								<a href="Reporteusuario.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										 USUARIOS
									</div>
								</a>
							</li>
                                                        <li class="full-width">
								<a href="ReporteCategoria.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										 CATEGORIA
									</div>
								</a>
							</li>
							<li class="full-width">
								<a href="ReporteProducto.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										PRODUCTOS
									</div>
								</a>
							</li>
                                                        <li class="full-width">
								<a href="ReporteCliente.jsp" class="full-width">
                                                                   
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										CLIENTES
									</div>
								</a>
							</li>
							<li class="full-width">
								<a href="ReportePrima.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										M. PRIMA
									</div>
								</a>
							</li>
                                                        <li class="full-width">
								<a href="ReportePedidoPrima.jsp" class="full-width">
                                                                   
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										PEDIDOS PRIMA
									</div>
								</a>
							</li>
                                                        <li class="full-width">
								<a href="ReporteProduccion.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										PRODUCCION
									</div>
								</a>
							</li>
                                                        <li class="full-width">
								<a href="ReporteEmpleado.jsp" class="full-width">
                                                                   
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										EMPLEADOS
									</div>
								</a>
							</li>
                                                          <li class="full-width">
								<a href="ReporteDiseño.jsp" class="full-width">
                                                                   
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										DISEÑO
									</div>
								</a>
							</li>
                                                        <li class="full-width">
								<a href="ReporteMarca.jsp" class="full-width">
                                                                   
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										MARCA
									</div>
								</a>
							</li>
                                                        
							
						</ul>
					</li>
					<!--fin reportes---->
				
				</ul>
			</nav>
			
		
		
		</div>
	</section>
