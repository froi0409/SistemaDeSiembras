<%-- 
    Document   : lista-siembra
    Created on : 31 oct. 2021, 13:08:44
    Author     : hectoradolfo
--%>

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
            ArrayList<String> siembras = obtenerListados.getFrom("siembras", request);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>siembras</title>
    </head>
    <body>

        <%@include file="../html/nav/cabecera-principal.html" %>
        <div class="main">
            <div class="row g-3">
                <div class="col-sm-3">

                </div>
                <div class="col-sm-6">
                    <div class="formulario h-100 p-5  border rounded-3">
                        <h1>Contactos de correo electronico </h1>
                        <table class="table table-dark table-striped">
                            <tr>
                                <th>codigo de siembra</th>
                                <th>planta</th>
                                <th>fecha </th>
                                <th>estado </th>
                                <th> </th><!-- comment -->
                            </tr> <!--  el arrayList contactoCorreo debe de tener los atributos
                                  codigo_correo y correo
                            -->
                            <%
                                for (int i = 0; i < siembras.size(); i++) {
                            %>
                            <tr>
                                <td><%=siembras.get(i).getCodigo()%> </td>
                                <td><%=siembras.get(i).getPlanta()%> </td>
                                <td><%=siembras.get(i).getFecha()%> </td>
                                <td><%=siembras.get(i).getEstado()%> </td>
                                <td><a href="../jsp/contacto-correo.jsp?codigo_correo=<%=siembras.get(i).getCodigo()%>">Eliminar</a></td>
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
