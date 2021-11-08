<%-- 
    Document   : crear-admin
    Created on : 28 oct. 2021, 0:04:19
    Author     : hectoradolfo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
//Declaramos los nombres de los atributos
            String parametros = "ADMIN,codigo_admin,nombre,password,correo";
            session.setAttribute("parametros", parametros);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>crear amdin</title>
    </head>
    <body class="body-admin-crear">
        
         <%@include file="../html/nav/cabecera-principal.html" %>
        <div class="main">
            <%@include file="mensaje.jsp" %>
            <%@include file="../html/usuarios/crear-admin.html"%>
        </div>
        
    </body>
</html>
