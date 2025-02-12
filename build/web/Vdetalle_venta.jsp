
<%@page import="DAO.marcaDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.diseñoDAO"%>
<%@page import="Bean.detalle_venta"%>
<%@page import="DAO.ventaDAO"%>
<%@page import="Bean.producto"%>
<%@page import="DAO.productoDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="Bean.categoria"%>
<%@page import="java.util.List"%>
<%@page import="DAO.categoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
     <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Detalle</title>
	<%@include file="css-js.jsp" %>
 

</head>


<body>
	
	<!--cabecera de Menu -->
        <%@include file="FrmVenta.jsp" %>
	<!-- pageContent -->
<section class="full-width pageContent">
     <div class="row">
                        <div class="col-xs-3">
                </div>
                        <div class="col-xs-1">
         <button class="btn btn-primary form-control" id="btn-agregar">
                 <i class="glyphicon glyphicon-plus"></i>

            </button>

        </div>
    <div class="col-xs-1">
  </div>
 </div> 
   
 <form action="VDetalleVenta">	
<div class="row">
        <div class="col-xs-14">
          
                 <div class="row" >
               
                <ul id="facturador-detalle" class="list-group"></ul>
              
              
                                                </div>
                                        </div>
                                </div>
           						
<script id="facturador-detalle-template" type="text/x-jsrender">
     {{for items}}
    <li class="list-group-item">
        <div class="row">
            <div class="col-xs-5">
                <div class="input-group">
                    <span class="input-group-btn">
                        <button class="btn btn-danger form-control" onclick="facturador.retirar({{:id}});">
                            <i class="glyphicon glyphicon-minus"></i>
                        </button>
                    </span>   
                    <select name="txtproducto" class="form-control"  required="">
                       <option  disabled=""value="" selected="">Q. producto--categoria--diseño--marca</option>
                         <%
                                    productoDAO daop=new productoDAO();
                                    List<producto>listp=daop.ListadoStockmaximoyActivo();
                                    Iterator<producto>iterp=listp.iterator();
                                    producto p=null;  
                                    while (iterp.hasNext()) {
                                    p = iterp.next(); %>         


                                    <option  value="<%= p.getId()%>"><%= p.getNombre()%>--<%=categoriaDAO.getCategoria(p.getIdcategoria())%>--<%= diseñoDAO.getdiseño(p.getIddiseño())%>--<%= marcaDAO.getmarca(p.getIdmarca()) %></option>
                         <%}%>  
                    </select>
                </div>
            </div> 
            <div class="col-xs-1">
                <input name="cantidad" class="form-control" type="text" placeholder="Cantidad" value="{{:cantidad}}" required=""/>
            </div> 
            <div class="col-xs-1">
                  <input name="precio" class="form-control" type="text" placeholder="Precio" value="{{:precio}}" required=""/>
             
            </div> 
            <div class="col-xs-1">
                <div class="input-group">
                  <input name="descuento" class="form-control" type="text" placeholder="descuento" value="{{:descuento}}" required=""/>
                </div>
            </div>
            <div class="col-xs-2">
                <div class="input-group"> 
                    <span class="input-group-addon">Q/.</span>
                    <input name="txtsubtotal" class="form-control" type="text" readonly value="{{:total}}" required="" />
                    <span class="input-group-btn">
<button class="btn btn-success form-control" onclick="facturador.actualizar({{:id}}, this);" class="btn-retirar">
    <i class="glyphicon glyphicon-refresh"></i>
</button>
                    </span>
                </div>
            </div>
             <div class="col-xs-2">
               
                    <input class="btn btn-primary" name="accion"  type="submit" value="add"/>
                    
                
            </div>
        </div>
    </li>
    {{else}}
    <li class="text-center list-group-item">No se han agregado productos al detalle</li>
    {{/for}} 
            
</script>

                </form>
				
		
<div class="mdl-tabs__panel" id="tabListProducts">
   <div class="mdl-grid">
           <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
                   <div class="full-width panel-tittle bg-success text-center tittles">
                   Lista de Detalle       
                   </div>    
                                <table  class="mdl-data-table mdl-js-data-table mdl-shadow--2dp full-width table-responsive">
                        <thead>
                                <tr>
                                        <th class="mdl-data-table__cell--non-numeric">codigo</th>
                                        <th>idventa</th> 
                                        <th>producto</th>  
                                        <th>cantidad</th> 
                                        <th>precio</th> 
                                        <th>descuento</th> 
                                        <th>subtotal</th> 
                                        <th>Anular---Eliminar</th> 
                                </tr>
                        </thead>
                      
                        
                        <tbody>
                            <%  ventaDAO pdao=new ventaDAO();
                                            List<detalle_venta>listS=pdao.ListadoDetalle();
                                            Iterator<detalle_venta>iterr=listS.iterator();
                                         detalle_venta pro=null;
                                           double total=0,igv=0,subtotal=0;
                                            int id=0;
                                              DecimalFormat formatea = new DecimalFormat("###,###.##");
                                              String Msubtotal="" ;
                                              String Migv="";
                                            while (iterr.hasNext()) {
                                            pro = iterr.next(); %>

						<tr>
							<td class="mdl-data-table__cell--non-numeric"><%= pro.getId()%></td>
							<td><%= pro.getIdventa()%></td>
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
                                                             <% id=pro.getIdventa();%>
                                                        <td>Q<%= pro.getSubtotal()%></td>
                                                        <td>
                                                          <% String estad=pro.getEstado();
                                                            if(estad.equalsIgnoreCase("Activo")){%>
                                                               <a href="VDetalleVenta?accion=anular&id=<%= pro.getId()%>" class="btn btn-danger" ><img src="Imagen/delete.png" title="Anular"/></a>
							       <%}else{}    
                                                               %> <a href="VDetalleVenta?accion=eliminar&id=<%= pro.getId()%>" class="btn btn-danger" ><img src="Imagen/delete.png" title="Eliminar"/></a>
							
                                                        </td>
						</tr>
						<%}%>
						
					</tbody>
                                        
				</table>       <h4 style="background-color: chartreuse; color:navy">SubTotal Q/ <%= Msubtotal%></h4>
                                                <h4 style="background-color: chartreuse; color:navy">Iva     Q/ <%=Migv%></h4>
                                                <h4 style="background-color: chartreuse; color:navy">Total Q/ <%=(total)%></h4>
                                                <form action="VDetalleVenta">
                                                <div class="col-xs-2">
                              <input  name="txttotal"  type="hidden" value="<%=total%>"/>
                                <input  name="txtid"  type="hidden" value="<%=id%>"/>
                             <input class="btn btn-primary" name="accion"  type="submit" value="Vender"/>
                                </div>
                                                    </form>
				</div>
			</div>
		</div>
                                               

	</section>
                                                
        


<script src="js/bootstrap.min.js"></script>
        <script src="js/js-render.js"></script>
        <script src="js/factura.js"></script>   
                                        
           
                                              
</body>
</html>