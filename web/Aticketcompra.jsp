

<%@page import="java.util.Iterator"%>
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
</head>
<body>
	  <%
           compraDAO dao=new compraDAO();
           int id=Integer.parseInt((String)request.getAttribute("idco"));
           compra p=(compra)dao.Reporte(id);
           %>
	<!--cabecera de Menu -->
        <%@include file="FrmAlmacen.jsp" %>
	<!-- pageContent -->
	<section class="full-width pageContent">
		
         
			
           
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
						
						
                                           <div id="PDF">   
                                               <center>
                                               <table>
                                                   <tr>
                                                   <td> <h3>Tipo Comprobante : <%=p.getTipo_comprobante() %></h3></td>
                                                   <td><h3>  : N. <%=p.getNum_comprobante()%></h3></td>
                                                  <center> <td><h3> Fecha :<%=p.getFecha_hora()%></h3></td></center>
                                                   </tr>
                                               </table>
                                               <table>
                                                   <tr>
                                                       <td>  <h3>Cliente : <%= clienteDAO.getcliente(p.getIdproveedor())%></h3></td>
                                                   
                                                 <td><h3>Serie de Comprobante : <%=p.getSerie_comprobante()%></h3></td>
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
                                                <table>
                                                   <tr>
                                                   <td>  <h4>Total Q/ <%=total%></h4></td>
                                                  
                                                   </tr>
                                               </table>
                                                	</center>
                                  </div>         
				</div>
                                        
			</div>
	
	                         
                   <center><a href="#" onclick="ReportePDF()" class="btn btn-primary"  ><img src="Imagen/mpdf.png" title="pdf">Reporte PDF</a>
                   <a href="Acompra.jsp"  class="btn btn-danger"  >Salir</a></center>
                                                                     
         </section>
</body>
<%@include file="pdf-excel-js.jsp" %>
        
</html>
