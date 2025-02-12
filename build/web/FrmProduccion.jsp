

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<%
    HttpSession sesion=request.getSession();
    if(sesion.getAttribute("tipo")==null){
        response.sendRedirect("index.jsp");
    }else{
        String tipo=sesion.getAttribute("tipo").toString();
        if(!tipo.equals("Produccion")){
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
				<i class="zmdi zmdi-close btn-menu"></i> Encargado de Produccion
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
					
					<!--inicio producion---->
					<li class="full-width divider-menu-h"></li>
					<li class="full-width">
						<a href="#!" class="full-width btn-subMenu">
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
								<a href="PProdu.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-washing-machine"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										INGRESO DE PRODUCION
									</div>
								</a>
							</li>
							<li class="full-width">
								<a href="PPedidoPrima.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-washing-machine"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										PEDIDOS M.
									</div>
								</a>
							</li>
						
						</ul>
					</li>
					<!--fin producion---->
					
					
					
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
								<a href="PReporteProduccion.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										PRODUCCION
									</div>
								</a>
							</li>
							<li class="full-width">
								<a href="PReporteProducto.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										PRODUCTOS
									</div>
								</a>
							</li>
							<li class="full-width">
								<a href="PReportePedidoPrima.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										PEDIDOS M.
									</div>
								</a>
							</li>
                                                        <li class="full-width">
								<a href="PReportePrima.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-download"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										MATERIA M.
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
