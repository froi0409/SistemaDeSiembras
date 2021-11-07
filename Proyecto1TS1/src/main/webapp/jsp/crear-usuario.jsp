<%-- 
    Document   : crear-usuario
    Created on : 14 oct. 2021, 18:25:00
    Author     : hectoradolfo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            //Declaramos los nombres de los atributos        
            String parametros = "USUARIO,codigo_usuario,nombre,apellido,sexo,birth,password";
            session.setAttribute("parametros", parametros);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>Crear Usuario</title>
    </head>
    <body background="../resources/img/create_user.jpg">
        
        <%@include file="../html/nav/cabecera-no-sesion.html" %>
        <div class="main">
            <%@include file="mensaje.jsp" %>
            <%@include file="../html/usuarios/crear-usuario.html"%>
        </div>
        
    </body>
</html>
