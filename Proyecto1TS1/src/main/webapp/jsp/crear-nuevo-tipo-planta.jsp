<%-- 
    Document   : crear-nuevo-tipo-planta
    Created on : 28/10/2021, 02:34:09
    Author     : froi-pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>Nuevo Tipo de Planta</title>
    </head>
    <body background="../resources/img/create_user.jpg">
        
        <%
            //Declaramos los nombres de los atributos        
            String parametros = "TIPOPLANTA,tipo,descripcion";
            session.setAttribute("parametros", parametros);
        %>
        
        <%@include file="../html/nav/cabecera-principal.html" %>
        <div class="main">
            <%@include file="../html/planta/nueva-planta.html"%>
        </div>
        
    </body>
</html>
