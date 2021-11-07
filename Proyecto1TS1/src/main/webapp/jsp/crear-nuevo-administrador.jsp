<%-- 
    Document   : crear-nuevo-administrador
    Created on : 28/10/2021, 02:42:41
    Author     : froi-pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>Nuevo Administrador</title>
    </head>
    <body background="../resources/img/create_user.jpg">
        
        <%
            //Declaramos los nombres de los atributos        
            String parametros = "ADMIN,codigo_admin,nombre,password,correo";
            session.setAttribute("parametros", parametros);
        %>
        
        <%@include file="../html/nav/cabecera-administradores.html" %>
        <div class="main">
            <%@include file="mensaje.jsp" %>
            <%@include file="../html/administrador/nuevo-administrador.html"%>
        </div>
        
    </body>
</html>
