<%-- 
    Document   : listado-usuarios
    Created on : 31/10/2021, 19:34:13
    Author     : froi-pc
--%>

<%@page import="java.util.List"%>
<%@page import="funciones.ObtenerListados"%>
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
            ObtenerListados obtenerListados = new ObtenerListados();
            List<ArrayList<String>> listado = obtenerListados.getTablaFrom("usuario");
        %>
        
        <%@include file="../html/nav/cabecera-administradores.html" %>
        <div class="main">
            <%@include file="../html/administrador/listado-usuarios.html"%>
        </div>
        
    </body>
</html>