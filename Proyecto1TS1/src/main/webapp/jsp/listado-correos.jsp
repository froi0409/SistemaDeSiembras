<%-- 
    Document   : contacto-correo
    Created on : 30 oct. 2021, 22:32:20
    Author     : hectoradolfo
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
        <title>Correos</title>
    </head>
    <body>

        <%
            ObtenerListados obtenerListados = new ObtenerListados();
            List<ArrayList<String>> listado = obtenerListados.getFrom("contacto correo", request);
        %>
        <%@include file="../html/nav/cabecera-usuario.html" %>
        <div class="main">
            <%@include file="mensaje.jsp" %>
            <div class="row g-3">
                <div class="col-sm-3">

                </div>
                <div class="col-sm-6">
                    <div class="formulario h-100 p-5  border rounded-3">
                        <a href="crear-nuevo-correo.jsp" class="btn botonRegistro">Nuevo Correo</a>
                        <br><br>
                        <h3>Listado de Correos</h3>
                        <table class="table table-dark table-striped">
                            <tr>
                                <th>Codigo</th>
                                <th>correo electronico</th>
                                <th> </th>
                            </tr> <!--  el arrayList contactoCorreo debe de tener los atributos
                                  codigo_correo y correo
                            -->
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
                                <td><a class="btn btn-light" href="modificar-correo.jsp?codigoCorreo=<%=listado.get(i).get(0) %>">Modificar</a></td>
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
