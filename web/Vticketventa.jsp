
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
		
         
			
           
				<div>
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
						
						
                                           <div id="PDF">   
                                               <center>
                                               <table>
                                                   <h1>asdfasfsadfsadsdf</h1> <h3>asjdkfjsadkfjsdfsdfsd</h3>
                                                   
                                                   <tr>
                                                   <td> <h3>Tipo Comprobante : <%=p.getTipo_comprobante() %></h3></td>
                                                   <td><h3>  : N. <%=p.getNum_comprobante()%></h3></td>
                                                  <center> <td><h3> Fecha :<%=p.getFecha_hora()%></h3></td></center>
                                                   </tr>
                                               </table>
                                               <table>
                                                   <tr>
                                                   <td>  <h3>Cliente : <%= clienteDAO.getcliente(p.getIdcliente())%></h3></td>
                                                   
                                                   <td><h3>DPI : <%=p.getRuc()%></h3></td>
                                                   </tr>
                                               </table>
                                              
                                               <h3>Detalle Venta</h3>
                                               
							
						
				<table  border="1" style="background-color:turquoise">
                        <thead>
                                <tr>
                                     
                                        
                                        <th style="background-color: chartreuse; color:navy">producto</th>
                                        <th style="background-color: chartreuse; color:navy">cantidad</th>
                                        <th style="background-color: chartreuse; color:navy">precio</th>
                                        <th style="background-color: chartreuse; color:navy">descuento</th>
                                        <th style="background-color: chartreuse; color:navy">subtotal</th>
                                    
                                </tr>
                        </thead>
                      
                        
                        <tbody>
                            <%  ventaDAO pdao=new ventaDAO();
                                            List<detalle_venta>listS=pdao.ticketDetalle(id);
                                            Iterator<detalle_venta>iterr=listS.iterator();
                                         detalle_venta pro=null;
                                            double total=0,igv=0,subtotal=0;
                                          DecimalFormat formatea = new DecimalFormat("###,###.##");
                                              String Msubtotal="" ;
                                              String Migv="";
                                            while (iterr.hasNext()) {
                                            pro = iterr.next(); %>

						<tr>
							
						
                                                        <td><%= productoDAO.getProducto(pro.getIdproducto())%></td>
                                                          <td><%= pro.getCantidad()%></td>
                                                           <td>Q<%= pro.getPrecio()%></td>
                                                            <td><%= pro.getDescuento()%></td>
                                                            <% subtotal=subtotal+pro.getSubtotal();
                                                           
                                                            igv=(subtotal*0.12);
                                                             total=subtotal+igv;
                                                               Msubtotal = formatea.format(subtotal);
                                                                Migv = formatea.format(igv);
                                                            %>
                                                        <td>Q<%= pro.getSubtotal()%></td>
							
						</tr>
						<%}%>
						
					</tbody>
				</table>
                                       
                                            
                                                <table>
                                                   <tr>
                                                       
                                                       <td>
                                                            <h4 style="background-color: chartreuse; color:navy">SubTotal Q. <%= Msubtotal%></h4>
                                                       </td>
                                                      
                                                   </tr>
                                                   <td>
                                                          <h4 style="background-color: chartreuse; color:navy">Iva Q. <%= Migv%></h4>
                                                   </td>
                                                    
                                                  
                                                   </tr>
                                                   <td>
                                                      <h4>Total Q. <%= (total)%></h4>  
                                                   </td>
                                                   </tr>
                                               </table>
                                                	</center>
                                  </div>         
				</div>
                                        
			</div>
	
	                         
                   <center><a href="#" onclick="ReportePDF()" class="btn btn-primary"  ><img src="Imagen/mpdf.png" title="pdf">Reporte PDF</a>
                   <a href="Vventas.jsp"  class="btn btn-danger"  >Salir</a></center>
                                                                     
         </section>
</body>

<%@include file="pdf-excel-js.jsp" %>
        
</html>