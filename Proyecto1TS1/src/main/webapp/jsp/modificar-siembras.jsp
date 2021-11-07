<%-- 
    Document   : modificar-siembras
    Created on : Nov 6, 2021, 4:08:38 PM
    Author     : camran1234
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
        <title>Modificar Tipo de Planta</title>
    </head>
    <body background="../resources/img/create_user.jpg">
        
        <%
            //Declaramos los nombres de los atributos        
            String parametros = "SIEMBRA,codigo_siembra,codigo_usuario,nombre_planta,fecha,estado,descripcion_siembra";
            ObtenerListados obtenerListados = new ObtenerListados();
            ArrayList<String> listadoPlantas = new ArrayList();
            try{    
                listadoPlantas = obtenerListados.getFrom("planta");
            }catch(Exception ex){}
            session.setAttribute("parametros", parametros);
        %>
        
        <%@include file="../html/nav/cabecera-usuario.html" %>
        <div class="main">
            <%@include file="../html/planta/modificar-siembras.html"%>
        </div>
        
    </body>
</html>
