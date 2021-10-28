<%-- 
    Document   : ingreso-siembras
    Created on : 28/10/2021, 03:13:19
    Author     : froi-pc
--%>

<%@page import="java.util.ArrayList"%>
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
            String parametros = "SIEMBRA,codigo_siembra,codigo_usuario,nombre_planta,fecha,estado,descripcion_siembra";
            ObtenerListados obtenerListados = new ObtenerListados();
            ArrayList<String> listadoPlantas = obtenerListados.getFrom("planta");
        %>
        
        <%@include file="../html/nav/cabecera-principal.html" %>
        <div class="main">
            <%@include file="../html/planta/ingreso-siembras.html"%>
        </div>
        
    </body>
</html>