

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido</title>
           <%@include file="css-js.jsp" %>
    </head>
     <script>
    /**
     * Array con las imagenes y enlaces que se iran mostrando en la web
     */
    var imagenes=new Array(
       ['assets/img/Zapatos.jpeg']
    );
 
    /**
     * Funcion para cambiar la imagen y link
     */
    function rotarImagenes()
    {
        // obtenemos un numero aleatorio entre 0 y la cantidad de imagenes que hay
        var index=Math.floor((Math.random()*imagenes.length));
 
        // cambiamos la imagen y la url
        document.getElementById("imagen").src=imagenes[index][0];
    }
 
    /**
     * Función que se ejecuta una vez cargada la página
     */
    onload=function()
    {
        // Cargamos una imagen aleatoria
        rotarImagenes();
 
        // Indicamos que cada 5 segundos cambie la imagen
        setInterval(rotarImagenes,3000);
    }
</script>
    <body>
       <!--cabecera de Menu -->
       <%@include file="FrmVenta.jsp" %>
	
	<!-- pageContent -->
	<section class="full-width pageContent">
           <a href="" id="link"><img src="" id="imagen"></a>
		
	</section>
                                                                           
        
    </body>
</html>
