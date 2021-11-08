<%-- 
    Document   : lista-siembra
    Created on : 31 oct. 2021, 13:08:44
    Author     : hectoradolfo
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="funciones.ObtenerListados"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            //Declaramos los nombres de los atributos
            String parametros
                    = "siembras";
            session.setAttribute("parametros", parametros);

            //listados que necesitamos para desplegar los contactos del usuario
            ObtenerListados obtenerListados = new ObtenerListados();
            List<ArrayList<String>> listado = obtenerListados.getFrom("siembras", request);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>Siembras</title>
    </head>
    <body>

        <%@include file="../html/nav/cabecera-usuario.html" %>
        <div class="main">
            <%@include file="mensaje.jsp" %>
            <div class="row g-3">
                <div class="col-sm-3">

                </div>
                <div class="col-sm-6">
                    <div class="formulario h-100 p-5  border rounded-3">
                        <a href="crear-siembra.jsp" class="btn botonRegistro">Nueva Siembra</a>
                        <br><br>
                        <h3>Listado de Siembras</h3>
                        <table class="table table-dark table-striped">
                            <tr>
                                <th>Codigo</th>
                                <th>Planta</th>
                                <th>Fecha</th>
                                <th>Descripcion</th>
                                <th></th>
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
                                <td><a class="btn btn-light" href="modificar-siembras.jsp?codigoSiembra=<%=listado.get(i).get(0) %>">Modificar</a></td>
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
