<%-- 
    Document   : listado-plantas
    Created on : 31/10/2021, 19:34:38
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
            ArrayList<String> listado = funcion.ObtenerListados.getFrom("planta-admin");
        %>
        
        <%@include file="../html/nav/cabecera-administradores.html" %>
        <div class="main">
            <%@include file="../html/administrador/listado-plantas.html"%>
        </div>
        
    </body>
</html>