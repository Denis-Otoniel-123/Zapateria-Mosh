

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login</title>
	 <%@include file="css-js.jsp" %>
      
     </head>  
     
<body class="cover">
	<div class="container-login">
		<p class="text-center" style="font-size: 80px;">
                    <a><img src="assets/img/Logologin.jpg" height="50%" width="50%"></a>
		</p>
		<p class="text-center text-condensedLight">Login</p>
		<form  action="logincontroller" method="POST">
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input  name="txtUsuario" class="mdl-textfield__input" type="text" id="userName" required="">
			    <label  class="mdl-textfield__label" for="userName">USUARIO</label>
			</div>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			    <input name="txtPassword"  class="mdl-textfield__input" type="password" id="pass" required>
			    <label class="mdl-textfield__label" for="pass">PASSWORD</label>
			</div>
                      <input type="submit" name="btnEntrar" value="Iniciar" id="SingIn" class="mdl-button mdl-js-button mdl-js-ripple-effect" style="color: #000000; float:right;">
                      <button id="SingIn" class="mdl-button mdl-js-button mdl-js-ripple-effect" style="color: #000000; float:right;">SALIR</button>
		</form>
	</div>
     <%
            HttpSession sesion=request.getSession();
            String tipo="";
            if(request.getAttribute("tipo")!=null){
                tipo=request.getAttribute("tipo").toString();
                if(tipo.equalsIgnoreCase("Administrador")){
                    sesion.setAttribute("usuario", request.getAttribute("usuario"));
                    sesion.setAttribute("tipo", tipo);
                    response.sendRedirect("BienvenidoAdmin.jsp");
                }else if(tipo.equalsIgnoreCase("Almacen")){
                    sesion.setAttribute("usuario", request.getAttribute("usuario"));
                    sesion.setAttribute("tipo", tipo);
                    response.sendRedirect("BienvenidoAlmacen.jsp");
                }else if(tipo.equalsIgnoreCase("Produccion")){
                    sesion.setAttribute("usuario", request.getAttribute("usuario"));
                    sesion.setAttribute("tipo", tipo);
                    response.sendRedirect("BienvenidoProduccion.jsp");
                }else if(tipo.equalsIgnoreCase("Ventas")){
                    sesion.setAttribute("usuario", request.getAttribute("usuario"));
                    sesion.setAttribute("tipo", tipo);
                    response.sendRedirect("BienvenidoVentas.jsp");
                }
            }
           
            if(request.getParameter("cerrar")!=null){
                session.invalidate();
            }
       %>
      
</body>
</html>