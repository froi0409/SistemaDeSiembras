<%-- 
    Document   : crear-planta
    Created on : 27 oct. 2021, 23:33:26
    Author     : hectoradolfo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            //Declaramos los nombres de los atributos        
            String parametros = "TIPOPLANTA,tipo,descripcion";
            session.setAttribute("parametros", parametros);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>crear planta</title>
    </head>
    <body class="body-new-planta">
        
        <%@include file="../html/nav/cabecera-principal.html" %>
        <div class="main">
            <%@include file="../html/planta/crear-planta.html"%>
        </div>
        
    </body>
</html>
