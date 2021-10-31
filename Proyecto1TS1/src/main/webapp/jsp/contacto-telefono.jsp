<%-- 
    Document   : contactos
    Created on : 30 oct. 2021, 17:16:35
    Author     : hectoradolfo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            //Declaramos los nombres de los atributos
            String parametros
                    = "contacto, telefono";
            session.setAttribute("parametros", parametros);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>contactos</title>
    </head>
    <body>
        
        <%@include file="../html/nav/cabecera-principal.html" %>
        <div class="main">
            <div class="row g-3">
                <div class="col-sm-3">

                </div>
                <div class="col-sm-6">
                    <div class="formulario h-100 p-5  border rounded-3">
                        <h1>Contacto telefonico</h1>
                        <table class="table table-dark table-striped">
                            <tr>
                                <th>Codigo</th>
                                <th>Numero de Telefono</th>
                                <th> </th>
                            </tr> <!-- 
                            se tiene que crear un controlador ControladorCOntacto que tenga un arrayList 
                                  llamado contactoTel de contactos con los
                                  atributos codigo_telefono y telefono, para poder llenar la tabla y para 
                                  eliminar se tiene que diregir a esta misma pagina despues de eliminar
                            -->
                            <c:forEach items="${contactoTel}" var="ct">
                                <tr>
                                    <td>${ct.codigo_telefono}</td>
                                    <td>${ct.telefono}</td>
                                    <td><a href="${pageContext.request.contextPath}/ControladorContacto?contacto=${ct.codigo_telefono}">Eliminar</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
