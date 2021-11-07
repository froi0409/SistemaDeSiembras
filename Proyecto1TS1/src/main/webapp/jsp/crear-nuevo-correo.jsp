<%-- 
    Document   : crear-nuevo-contacto
    Created on : 28/10/2021, 01:56:39
    Author     : froi-pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>Nuevo Correo</title>
    </head>
    <body background="../resources/img/create_user.jpg">
        
        <%
            //Declaramos los nombres de los atributos        
            String parametros = "CONTACTO_CORREO,codigo_correo,codigo_usuario,correo";
            session.setAttribute("parametros", parametros);
        %>
        
        <%@include file="../html/nav/cabecera-usuario.html" %>
        <div class="main">
            <%@include file="mensaje.jsp" %>
            <%@include file="../html/usuarios/nuevo-correo.html"%>
        </div>
        
    </body>
</html>
