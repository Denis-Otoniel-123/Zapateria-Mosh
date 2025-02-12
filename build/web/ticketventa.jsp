

<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.productoDAO"%>
<%@page import="Bean.detalle_venta"%>
<%@page import="Bean.venta"%>
<%@page import="DAO.ventaDAO"%>
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
        
     <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f7f7;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .container {
        max-width: 800px;
        width: 100%;
        padding: 20px;
        background-color: #ffffff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        border-radius: 8px;
        text-align: center;
    }

    .header {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 15px;
        margin-bottom: 20px;
    }

    .header img {
        width: 100px; /* Ajusta el tamaño del logo */
        height: auto;
        align-self: flex-start; /* Alinea la imagen a la izquierda */
    }

    .header h1 {
        margin: 0;
        color: #333;
        font-size: 50px; /* Tamaño de letra para el encabezado principal */
    }

    .header h3 {
        margin: 0;
        color: #333;
        font-size: 30px; /* Tamaño de letra para el subtítulo */
    }

    .report-table, .summary-table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }

    .report-table thead th {
        background-color: #ffffff;
        color: #000000;
        padding: 12px;
        text-align: center;
        font-size: 20px; /* Tamaño de letra para encabezados de la tabla de reporte */
    }

    .report-table tbody td {
        padding: 10px;
        text-align: center;
        background-color: #ffffff;
        font-size: 16px; /* Tamaño de letra para datos de la tabla de reporte */
    }

    .summary-table td {
        padding: 10px;
        text-align: center;
        font-weight: bold;
        color: #000000;
        background-color: #ffffff;
        border-bottom: 1px solid #c3e6cb;
        font-size: 25px; /* Tamaño de letra para los resúmenes de la tabla */
    }

    .summary-table tr:last-child td {
        border-bottom: none;
    }
</style>

</head>
<body>
	  <%
           ventaDAO dao=new ventaDAO();
           int id=Integer.parseInt((String)request.getAttribute("idve"));
           venta p=(venta)dao.Reporte(id);
           %>
	<!--cabecera de Menu -->
         <%@include file="FrmAdmin.jsp" %>
	<!-- pageContent -->
	<section class="full-width pageContent">
		

        <div id="PDF">                     
        <div class="container">
                <div class="header">
                    <img src="assets/img/Logologin.jpg" alt="Logo Zapatería">
                    <div>
                        <h1>ZAPATERIA</h1>
                        <h3>Mosh</h3>
                    </div>
                </div>
        </div>

    
        <table class="summary-table">
             <tr>
                <td>Tipo Comprobante: <%= p.getTipo_comprobante() %></td>
                <td>Número: <%= p.getNum_comprobante() %></td>
                <td>Fecha: <%= p.getFecha_hora() %></td>
             </tr>
         </table>
             
         <table class="summary-table">
            <tr>
                <td>Cliente: <%= clienteDAO.getcliente(p.getIdcliente()) %></td>
                <td>DPI: <%= p.getRuc() %></td>
            </tr>
        </table>
            
            <center><h3>Detalle Venta</h3></center>


                                             
            <table class="report-table" border="1">
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                        <th>Descuento</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>

                     <tbody>
                    <% 
                        ventaDAO pdao = new ventaDAO();
                        List<detalle_venta> listS = pdao.ticketDetalle(id);
                        Iterator<detalle_venta> iterr = listS.iterator();
                        detalle_venta pro = null;
                        double total = 0, igv = 0, subtotal = 0;
                        DecimalFormat formatea = new DecimalFormat("###,###.##");
                        String Msubtotal = "";
                        String Migv = "";
                        while (iterr.hasNext()) {
                            pro = iterr.next();
                    %>
                    <tr>
                        <td><%= productoDAO.getProducto(pro.getIdproducto()) %></td>
                        <td><%= pro.getCantidad() %></td>
                        <td>Q<%= pro.getPrecio() %></td>
                        <td><%= pro.getDescuento() %></td>
                        <% 
                            subtotal += pro.getSubtotal();
                            igv = subtotal * 0.12;
                            total = subtotal + igv;
                            Msubtotal = formatea.format(subtotal);
                            Migv = formatea.format(igv);
                        %>
                        <td>Q<%= pro.getSubtotal() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
<table class="summary-table">
            <tr>
                <td>SubTotal Q. <%= Msubtotal %></td>
            </tr>
            <tr>
                <td>Iva Q. <%= Migv %></td>
            </tr>
            <tr>
                <td>Total Q. <%= total %></td>
            </tr>
        </table>
                                  </div>         
                                        
	
	                         
                   <center><a href="#" onclick="ReportePDF()" class="btn btn-primary"  ><img src="Imagen/mpdf.png" title="pdf">Reporte PDF</a>
                   <a href="ventas.jsp"  class="btn btn-danger"  >Salir</a></center>
                                                                     
         </section>
</body>
<%@include file="pdf-excel-js.jsp" %>
        
</html>