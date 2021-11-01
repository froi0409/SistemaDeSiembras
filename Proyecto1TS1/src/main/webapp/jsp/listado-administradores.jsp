<%-- 
    Document   : listado-administradores
    Created on : 31/10/2021, 18:59:30
    Author     : froi-pc
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>Nueva Agenda</title>
    </head>
    <body>
        
        <%
            ArrayList<String> listado = funcion.ObtenerListados.getFrom("admin");
        %>
        
        <%@include file="../html/nav/cabecera-administradores.html" %>
        <div class="main">
            <%@include file="../html/administrador/listado-administradores.html"%>
        </div>
        
    </body>
</html>