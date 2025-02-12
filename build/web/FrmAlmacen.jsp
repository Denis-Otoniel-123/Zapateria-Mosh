

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    HttpSession sesion=request.getSession();
    if(sesion.getAttribute("tipo")==null){
        response.sendRedirect("index.jsp");
    }else{
        String tipo=sesion.getAttribute("tipo").toString();
        if(!tipo.equals("Almacen")){
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
				
					<li class="btn-exit" id="btn-exit">
						<i class="zmdi zmdi-power"></i>
						<div class="mdl-tooltip" for="btn-exit">Salir</div>
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
				<i class="zmdi zmdi-close btn-menu"></i> Encargado de Almacen 
			</div>
			<figure class="full-width" style="height: 77px;">
				<div class="navLateral-body-cl">
					<img src="assets/img/avatar-male.png" alt="Avatar" class="img-responsive">
				</div>
				<figcaption class="navLateral-body-cr hide-on-tablet">
					<span>
						Bienvenido<br>
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
							<a href="Adiseño.jsp" class="full-width">
								<div class="navLateral-body-cl">
									<i class="zmdi zmdi-label"></i>
								</div>
								<div class="navLateral-body-cr hide-on-tablet">
									DISEÑOS
								</div>
							</a>
						   </li>
                                                   <li class="full-width">
							<a href="Amarca.jsp" class="full-width">
								<div class="navLateral-body-cl">
									<i class="zmdi zmdi-label"></i>
								</div>
								<div class="navLateral-body-cr hide-on-tablet">
									MARCAS
								</div>
							</a>
						   </li>
							<li class="full-width">
							<a href="Aproductos.jsp" class="full-width">
								<div class="navLateral-body-cl">
									<i class="zmdi zmdi-washing-machine"></i>
								</div>
								<div class="navLateral-body-cr hide-on-tablet">
									PRODUCTOS
								</div>
							</a>
						   </li>
							<li class="full-width">
								<a href="Acategoria.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-label"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										CATEGORIAS
									</div>
								</a>
							</li>
                                                        <li class="full-width">
								<a href="APrima.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-label"></i>
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
								PRODUCCION
							</div>
							<span class="zmdi zmdi-chevron-left"></span>
						</a>
						<ul class="full-width menu-principal sub-menu-options">
							
							<li class="full-width">
								<a href="AProduccion.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-washing-machine"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										INGRESO DE PRODUCION
									</div>
								</a>
							</li>
							<li class="full-width">
								<a href="APedidoPrima.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-washing-machine"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										PEDIDOS DE MATERIAL
									</div>
								</a>
							</li>
						
						</ul>
                                                
                                           
					</li>
					<!--fin producion---->
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
                                                            <a href="Aproveedor.jsp" class="full-width">
                                                                    <div class="navLateral-body-cl">
                                                                    <i class="zmdi zmdi-account "></i>
                                                                    </div>
                                                                    <div class="navLateral-body-cr hide-on-tablet">
                                                                            PROVEEDORES
                                                                    </div>
                                                            </a>
							</li>
							<li class="full-width">
							<a href="Acompra.jsp" class="full-width">
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
					
					<!--inicio reportes---->
					<li class="full-width divider-menu-h"></li>
					<li class="full-width">
						<a href="#!" class="full-width btn-subMenu">
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
								<a href="AReporteProducto.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										PRODUCTOS
									</div>
								</a>
							</li>
                                                        <li class="full-width">
								<a href="AReporteCategoria.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										CATEGORIA
									</div>
								</a>
							</li>
                                                        <li class="full-width">
								<a href="AReporteDiseño.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										DISEÑOS
									</div>
								</a>
							</li>
                                                        <li class="full-width">
								<a href="AReporteMarca.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										MARCAS
									</div>
								</a>
							</li>
                                                        <li class="full-width">
								<a href="AReportePedidoPrima.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										PEDIDOS M.
									</div>
								</a>
							</li>
							  <li class="full-width">
								<a href="AReporteProduccion.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										PRODUCCION
									</div>
								</a>
							</li>
							  <li class="full-width">
								<a href="AReportePrima.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										M. PRIMA
									</div>
								</a>
							</li>
                                                          <li class="full-width">
								<a href="AReporteCompra.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										COMPRA
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
	<!-- pageContent -->
