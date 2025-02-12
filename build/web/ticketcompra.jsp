

<%@page import="DAO.PrimaDAO"%>
<%@page import="java.util.List"%>
<%@page import="Bean.detalle_compra"%>
<%@page import="DAO.clienteDAO"%>
<%@page import="Bean.compra"%>
<%@page import="DAO.compraDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Reporte Compra</title>
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
           compraDAO dao=new compraDAO();
           int id=Integer.parseInt((String)request.getAttribute("idco"));
           compra p=(compra)dao.Reporte(id);
           %>
	<!--cabecera de Menu -->
         <%@include file="FrmAdmin.jsp" %>
	<!-- pageContent -->
	<section class="full-width pageContent">
		
         
			
           
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
						
						
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
                <td>Cliente:  <%= clienteDAO.getcliente(p.getIdproveedor())%></td>
                <td>Serie de Comprobante : <%=p.getSerie_comprobante()%></td>
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
                            <%  compraDAO pdao=new compraDAO();
                                            List<detalle_compra>listS=pdao.ticketDetalle(id);
                                            Iterator<detalle_compra>iterr=listS.iterator();
                                         detalle_compra pro=null;
                                           double total=0;
                                            while (iterr.hasNext()) {
                                            pro = iterr.next(); %>

						<tr>
							
						
                                                    <td><%= PrimaDAO.getPrima(pro.getIdprima())%></td>
                                                          <td><%= pro.getCantidad()%></td>
                                                           <td>Q<%= pro.getPrecio()%></td>
                                                            <td><%= pro.getDescuento()%></td>
                                                            <% total=total+pro.getSubtotal();%>
                                                        <td>Q<%= pro.getSubtotal()%></td>
							
						</tr>
						<%}%>
						
					</tbody>
				</table>
                                               <table class="summary-table">
                                                  
                                                        
              <td>Total Q. <%= total %></td>
            
                                                  
                                                  
                                               </table>
                                                	
                                  </div>         
				</div>
                                        
			</div>
	
	                         
                   <center><a href="#" onclick="ReportePDF()" class="btn btn-primary"  ><img src="Imagen/mpdf.png" title="pdf">Reporte PDF</a>
                   <a href="compra.jsp"  class="btn btn-danger"  >Salir</a></center>
                                                                     
         </section>
</body>
<%@include file="pdf-excel-js.jsp" %>
        
</html>
