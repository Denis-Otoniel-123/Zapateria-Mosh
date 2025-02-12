

<%@page import="Bean.Cliente"%>
<%@page import="Bean.producto"%>
<%@page import="DAO.productoDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.clienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
	<head>
<title>detalle de venta</title>

                <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet" />

                <script src="js/jquery.js"></script>
</head>
        <body>
             <div class="row">
                        <div class="col-xs-3">


                </div>

                        <div class="col-xs-1">
                                <button class="btn btn-primary form-control" id="btn-agregar">
                                         <i class="glyphicon glyphicon-plus"></i>

                                </button>
                            

                        </div>
                          <div class="col-xs-1">


                                <form action="ventas.jsp">
                                 <input class="btn btn-success form-control"  type=submit value="X">
                           </form>


                        </div>
                </div> 
            <form action="DetalleVControlador">
<div class="container">
<div class="row">
        <div class="col-xs-12">
                <h1 class="jumbotron">
                   Ventas y detalle de venta
    </h1>
                 <div class="row">
                 <div class="col-xs-3">

                     <select class="form-control" name="txtidcliente">
                       <option value="" disabled="" selected="">Seleciona Cliente</option>
                                  <%
                                    clienteDAO dao=new clienteDAO();
                                    List<Cliente>list=dao.Listado();
                                    Iterator<Cliente>iter=list.iterator();
                                    Cliente per=null;
                                    while (iter.hasNext()) {
                                    per = iter.next(); %>        


                                 <option  value="<%= per.getId()%>"><%= per.getNombre()%></option>
                         <%}%>
                   </select>
                </div><br>
                <div class="col-xs-3">
                    <select class="form-control" name="txttipocomprbante">
                                <option value="" disabled="" selected="">Seleciona tipo de comprobante</option>
                                <option value="">Boleta</option>
                                <option value="">Factura</option>
                        </select>
                </div>
                  <div class="col-xs-3">
                      <input  name="txtseriecomprbante"class="form-control" type="text" placeholder="serie de comprobante" />
                        </div>  

                        <div class="col-xs-3">
                            <input name="txtnumcomprbante" class="form-control" type="text" placeholder="numero de comprbante" />
                            <input name="txtfecha"  type="hidden" value="hoy fecha"/>
                       
                        </div> 
                   <br>						
                        <div class="col-xs-3">
                            <input name="txtimpuesto" class="form-control" type="text" placeholder="impuesto" />
                        </div>  
                </div>
                        <br></br>			
               
               

                <ul id="facturador-detalle" class="list-group"></ul>


                                                </div>
                                        </div>
                                </div>
								
<script id="facturador-detalle-template" type="text/x-jsrender">
     {{for items}}
    <li class="list-group-item">
        <div class="row">
            <div class="col-xs-4">
                <div class="input-group">
                    <span class="input-group-btn">
                        <button class="btn btn-danger form-control" onclick="facturador.retirar({{:id}});">
                            <i class="glyphicon glyphicon-minus"></i>
                        </button>
                    </span>
                    <select name="txtproducto" class="form-control"  >
                        <option>selecionar</option>
                         <%
                                    productoDAO daop=new productoDAO();
                                    List<producto>listp=daop.Listado();
                                    Iterator<producto>iterp=listp.iterator();
                                    producto p=null;
                                    while (iterp.hasNext()) {
                                    p = iterp.next(); %>        


                                 <option  value="<%= p.getId()%>"><%= p.getNombre()%></option>
                         <%}%>  
                    </select>
                </div>
            </div>
            <div class="col-xs-1">
                <input name="cantidad" class="form-control" type="text" placeholder="Cantidad" value="{{:cantidad}}" />
            </div> 
            <div class="col-xs-2">
                <div class="input-group">
                  <span class="input-group-addon" id="basic-addon1">Q/.</span>
                  <input name="precio" class="form-control" type="text" placeholder="Precio" value="{{:precio}}" />
                </div>
            </div> 
            <div class="col-xs-2">
                <div class="input-group">
                  <span class="input-group-addon" id="basic-addon1">descuento</span>
                  <input name="descuento" class="form-control" type="text" placeholder="descuento" value="{{:descuento}}" />
                </div>
            </div>
            <div class="col-xs-2">
                <div class="input-group">
                    <span class="input-group-addon">Q/.</span>
                    <input name="txtsubtotal" class="form-control" type="text" readonly value="{{:total}}" />
                    <span class="input-group-btn">
<button class="btn btn-success form-control" onclick="facturador.actualizar({{:id}}, this);" class="btn-retirar">
    <i class="glyphicon glyphicon-refresh"></i>
</button>
                    </span>
                </div>
            </div>
        </div>
    </li>
    {{else}}
    <li class="text-center list-group-item">No se han agregado productos al detalle</li>
    {{/for}}

    <li class="list-group-item">
        <div class="row text-right">
            <div class="col-xs-10 text-right">
                Sub Total
            </div>
            <div class="col-xs-2">
                <b>{{:subtotal}}</b>
            </div>
        </div>
    </li>
    <li class="list-group-item">
        <div class="row text-right">
            <div class="col-xs-10 text-right">
                IVA (12%)
            </div>
            <div class="col-xs-2">
                <b>{{:igv}}</b>
            </div>
        </div>
    </li>
    <li class="list-group-item">
        <div class="row text-right">
            <div class="col-xs-10 text-right">
                Total
            </div>
            <div class="col-xs-2">
                <b>{{:total}}</b>
                     <input name="txttotal" type="hidden" value="{{:total}}"/>
                    <div class="input-group">
                     
                    <input name="accion" class="btn btn-primary" type="submit" value="agregar" />
                  </div> 
            </div>
        </div>
    </li>
      
</script>

<script src="js/bootstrap.min.js"></script>
        <script src="js/js-render.js"></script>
        <script src="js/factura.js"></script>   

				</form>	
    
			</body>
</html>
