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
                    = "contacto correo";
            session.setAttribute("parametros", parametros);
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
                            </tr> <!-- 
                            se tiene que crear un controlador ControladorCOntacto que tenga un arrayList
                                   de nombre contactoCorreo de contactos con los
                                  atributos codigo_correo y correo, para poder llenar la tabla y para 
                                  eliminar se tiene que diregir a esta misma pagina despues de eliminar
                            -->
                            <c:forEach items="${contactoCorreo}" var="ct">
                                <tr>
                                    <td>${ct.codigo_correo}</td>
                                    <td>${ct.correo}</td>
                                    <td><a href="${pageContext.request.contextPath}/ControladorContacto?contacto=${ct.codigo_correo}">Eliminar</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
