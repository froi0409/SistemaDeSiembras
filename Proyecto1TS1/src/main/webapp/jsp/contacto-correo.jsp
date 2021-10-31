<%-- 
    Document   : contacto-correo
    Created on : 30 oct. 2021, 22:32:20
    Author     : hectoradolfo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            //Declaramos los nombres de los atributos
            String parametros
                    = "contacto, correo";
            session.setAttribute("parametros", parametros);

            //listados que necesitamos para desplegar los contactos del usuario
            ObtenerListados obtenerListados = new ObtenerListados();
            ArrayList<String> contactoCorreo = obtenerListados.getFrom("contacto_correo");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>contacto correo</title>
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
                                <th>Codigo</th>
                                <th>correo electronico</th>
                                <th> </th>
                            </tr> <!--  el arrayList contactoCorreo debe de tener los atributos
                                  codigo_correo y correo
                            -->
                            <%
                                for (int i = 0; i < contactoCorreo.size(); i++) {
                            %>
                            <tr>
                                <td><%=contactoCorreo.get(i).getCodigoCorreo()%> </td>
                                <td><%=contactoCorreo.get(i).getCorreo()%> </td>
                                <td><a href="../jsp/contacto-correo.jsp?codigo_correo=<%=contactoCorreo.get(i).getCodigoCorreo()%>">Eliminar</a></td>
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
