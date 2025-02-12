

<%@page import="java.util.Iterator"%>
<%@page import="Bean.Prima"%>
<%@page import="Bean.detalle_compra"%>
<%@page import="java.util.List"%>
<%@page import="DAO.compraDAO"%>
<%@page import="DAO.PrimaDAO"%>
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
      <%@include file="FrmAdmin.jsp" %>
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
   
 <form action="DetalleCCompra">	
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
            <div class="col-xs-3">
                <div class="input-group">
                    <span class="input-group-btn">
                        <button class="btn btn-danger form-control" onclick="facturador.retirar({{:id}});">
                            <i class="glyphicon glyphicon-minus"></i>
                        </button> 
                    </span>   
                    <select name="txtprima" class="form-control"  required="">
                      <option  value="" selected="">Selecionar Producto</option>
                         <%
                                    PrimaDAO daop=new PrimaDAO();
                                    List<Prima>listp=daop.ListadoPrimaActivo();
                                    Iterator<Prima>iterp=listp.iterator();
                                    Prima p=null;
                                    while (iterp.hasNext()) {
                                    p = iterp.next(); %>        


                                 <option  value="<%= p.getId()%>"><%= p.getNombre()%> --- <%= p.getStock()%> </option>
                         <%}%>   
                    </select> 
                </div>
            </div>
            <div class="col-xs-1">
                <input name="cantidad" class="form-control" type="text" placeholder="Cantidad" value="{{:cantidad}}" required=""/>
            </div> 
            <div class="col-xs-2">
                <div class="input-group">
                  <span class="input-group-addon" id="basic-addon1">Q/.</span>
                  <input name="precio" class="form-control" type="text" placeholder="Precio" value="{{:precio}}" required=""/>
                </div>
            </div> 
            <div class="col-xs-2">
                <div class="input-group">
                  <span class="input-group-addon" id="basic-addon1">descuento</span>
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
                                        <th>idcompra</th>
                                        <th>Prima</th>
                                        <th>cantidad</th>
                                        <th>precio</th>
                                        <th>descuento</th>
                                        <th>subtotal</th>
                                        <th>Anular---Eliminar</th>
                                </tr>
                        </thead>
                      
                        
                        <tbody>
                            <%  compraDAO pdao=new compraDAO();
                                            List<detalle_compra>listS=pdao.ListadoDetalle();
                                            Iterator<detalle_compra>iterr=listS.iterator();
                                         detalle_compra pro=null;
                                           double total=0;
                                            int id=0;
                                            while (iterr.hasNext()) {
                                            pro = iterr.next(); %>

						<tr>
							<td class="mdl-data-table__cell--non-numeric"><%= pro.getId()%></td>
							<td><%= pro.getIdcompra()%></td>
                                                        <td><%= PrimaDAO.getPrima(pro.getIdprima())%></td>
                                                          <td><%= pro.getCantidad()%></td>
                                                           <td>Q<%= pro.getPrecio()%></td>
                                                            <td><%= pro.getDescuento()%></td>
                                                            <% total=total+pro.getSubtotal();%>
                                                             <% id=pro.getIdcompra();%>
                                                        <td>Q<%= pro.getSubtotal()%></td>
                                                        <td>
                                                          <% String estad=pro.getEstado();
                                                            if(estad.equalsIgnoreCase("Activo")){%>
                                                               <a href="DetalleCCompra?accion=anular&id=<%= pro.getId()%>" class="btn btn-danger" ><img src="Imagen/delete.png" title="Anular"/></a>
							       <%}else{}
                                                               %> <a href="DetalleCCompra?accion=eliminar&id=<%= pro.getId()%>" class="btn btn-danger" ><img src="Imagen/delete.png" title="Eliminar"/></a>
							
                                                        </td>
						</tr>
						<%}%>
						
					</tbody>
				</table>
                                                <h4 style="background-color: chartreuse; color:navy">Total Q/ <%=total%></h4>
                                                <form action="DetalleCCompra">
                                                <div class="col-xs-2">
                              <input  name="txttotal"  type="hidden" value="<%=total%>"/>
                                <input  name="txtid"  type="hidden" value="<%=id%>"/>
                             <input class="btn btn-primary" name="accion"  type="submit" value="Comprar"/>
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
