<%-- 
    Document   : listadp-telefonos
    Created on : 7/11/2021, 21:21:33
    Author     : froi-pc
--%>

<%@page import="java.util.List"%>
<%@page import="funciones.ObtenerListados"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>Telefonos</title>
    </head>
    <body>
        
        <%
            ObtenerListados obtenerListados = new ObtenerListados();
            List<ArrayList<String>> listado = obtenerListados.getFrom("contacto telefono", request);
        %>
        
        <%@include file="../html/nav/cabecera-usuario.html" %>
        <div class="main">
            <%@include file="mensaje.jsp" %>
            
            <div class="row g-3">
                <div class="col-sm-3">

                </div>
                <div class="col-sm-6">
                    <div class="formulario h-100 p-5  border rounded-3">
                        <a href="crear-nuevo-telefono.jsp" class="btn botonRegistro">Nuevo Telefono</a>
                        <br><br>
                        <h3>Listado de Telefonos</h3>
                        <table class="table table-dark table-striped">
                            <tr>
                                <th>Codigo Telefono</th>
                                <th>Telefono</th>
                                <th></th>
                            </tr>
                            <%
                                for (int i = 0; i < listado.size(); i++) {
                            %>
                            <tr>
                                <%
                                for(int j = 0; j < listado.get(0).size(); j++) {
                                %>
                                <td><%=listado.get(i).get(j)%></td>
                                <%
                                }
                                %>
                                <td><a class="btn btn-light" href="modificar-telefono.jsp?codigoTelefono=<%=listado.get(i).get(0) %>">Modificar</a></td>
                            </tr>

                            <%
                                }
                            %>
                        </table>
                    </div>
                </div>
            </div>
            
        </div>
        
    </body>
</html>