<%-- 
    Document   : index
    Created on : 13/10/2021, 11:06:25
    Author     : froi-pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <%@include file="html/importaciones/importaciones-index.html" %>
        <!-- Compiled and minified Bootstrap CSS -->
        <title>SowingMoon - Calendario Lunar</title>
    </head>
    <body>        
        <%@include file="html/nav/cabecera-principal.html"%>
        <div class="main-index">
            <%@include file="html/carousel-index.html" %>
        </div>
        <!-- Minified JS library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- Compiled and minified Bootstrap JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
    </body>
</html>
