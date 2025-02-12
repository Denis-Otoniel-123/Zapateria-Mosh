

<%@page import="Bean.PdfVO"%>
<%@page import="DAO.PdfDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Categoria</title>
        
         <%@include file="css-js.jsp" %>
        
         
</head>


<body>
	
	<!--cabecera de Menu -->
        <%@include file="FrmAdmin.jsp" %>
	
	<!-- pageContent -->
	<section class="full-width pageContent">
		
		<div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
			<div class="mdl-tabs__tab-bar">
				<a href="#tabNewARCHIVO" class="mdl-tabs__tab is-active">NUEVO</a>
				<a href="#tabListArchivo" class="mdl-tabs__tab">LISTA</a>
			</div>
                    <!--modal para agregar-->
			<div class="mdl-tabs__panel is-active" id="tabNewARCHIVO">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-primary text-center tittles">
								Archivo PDF
							</div>
                                                   
                                                
							<div class="full-width panel-content">
                                                             <%
            Integer dato = 0;
            try {
                PdfVO pdf = (PdfVO) request.getAttribute("row");
                dato = pdf.getCodigopdf();
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
            boolean icono = false;
            try {
                icono = (Boolean) request.getAttribute("row2");
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        %>
                        <form  name="formpdf" action="ControllerPdf" method="post" enctype="multipart/form-data" >

                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">

                                        <input    class="mdl-textfield__input" type="text" name="txtname" value="<c:out value="${row.nombrepdf}" />">
                                            <label class="mdl-textfield__label" for="NameCategory" >Nombre </label>
                                            <span class="mdl-textfield__error">Invalid Nombre</span>

                                    </div>
                                   <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">

                                  <label for="id">Seleccionar PDF:*</label>
                                <%
                                    if (icono) {
                                %>
                                <a href="pdf?id=<%out.print(dato); %>" target="_blank"> Ver Pdf</a>
                                <%
                                    } else {
                                        out.print("No hay Pdf");
                                    }
                                %>
                                    </div>
                                            
                                    
                                     <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">

                                        <input type="file" name="fichero" value="" />
                                            

                                    </div>

                                       <p class="text-center" >

                                           
                                        <input class="btn btn-success " type="submit" value="Enviar Archivo" name="submit" />
                                       </p>

                            </form>
                                                </div>
                                        </div>
                                </div>
                            </div>
                            </div>
                   
                    <!--modal listar-->
			<div class="mdl-tabs__panel" id="tabListArchivo">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-success text-center tittles">
								Lista Archivos PDF
							</div>
							<div class="full-width panel-content">
								
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
										<label class="mdl-button mdl-js-button mdl-button--icon" for="buscar">
											<i class="zmdi zmdi-search"></i>
										</label>
										<div class="mdl-textfield__expandable-holder">
											<input type="text" onkeyup="doSearch()" class="mdl-textfield__input" type="text" id="buscar">
											<label class="mdl-textfield__label"></label>
										</div>
									</div>
								
                                                            
                                                    <table id="datos" number-per-page="2" current-page="" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp full-width table-responsive">
                                                    <thead>
                                                            <tr>
                                                                    <th>codigo</th>
                                                                    <th>Nombre</th>
                                                                    <th>PDF</th>
                                                                    <th>Opciones</th>
                                                            </tr>
                                                    </thead>
                                                 <%
                             PdfDAO emp = new PdfDAO();
                             PdfVO pdfvo = new PdfVO();
                             ArrayList<PdfVO> listar = emp.Listar_PdfVO();
                         %>
                                <%if (listar.size() > 0) {
                            for (PdfVO listar2 : listar) {
                                pdfvo = listar2;
                    %>
                        <tr>
                            <td><%=pdfvo.getCodigopdf()%></td>
                            <td><%=pdfvo.getNombrepdf()%></td>
                            <td>
                                <%
                                    if (pdfvo.getArchivopdf2() != null) {
                                %>
                                <a href="pdf?id=<%=pdfvo.getCodigopdf()%>" target="_blank"><img src="Imagen/mpdf.png" title="pdf"/></a>
                                    <%
                                        } else {
                                            out.print("Vacio");
                                        }
                                    %>
                                                                </td>
                                     <td>
                                         <a class="btn btn-success" href="ControllerPdf?action=insert&id=<%=pdfvo.getCodigopdf()%>"> <img src="Imagen/nuevo.png" title="Nuevo registro"/></a>
                                         <a class="btn btn-info" href="ControllerPdf?action=edit&id=<%=pdfvo.getCodigopdf()%>"> <img src="Imagen/editar.png" title="Modificar"/></a>
                                         <a class="btn btn-danger" href="ControllerPdf?action=delete&id=<%=pdfvo.getCodigopdf()%>"> <img src="Imagen/delete.png" title="Eliminar"/></a>
                                     </td> 
                                                            
                                 </tr>
                                 <%}
                                     }%>
						
						
					      </tbody>
                                              
				         </table>

                                        </div>
                                </div>

                                </div>
				</div>
			</div>                                                             
	</div>
	</section>
     
                                                                  
</body>

</html>
