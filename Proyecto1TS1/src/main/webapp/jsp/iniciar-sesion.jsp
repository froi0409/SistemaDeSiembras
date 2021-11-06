<%-- 
    Document   : iniciar-sesion.jsp
    Created on : 18/10/2021, 16:57:17
    Author     : froi-pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>Inicio de Sesion</title>
    </head>
    <body background="../resources/img/create_user.jpg">
        <%
            session.setAttribute("mes", "11");
            session.setAttribute("año", "2021");
        %>
        <%@include file="../html/nav/cabecera-no-sesion.html" %>
        <div class="main">
            <%@include file="../html/usuarios/iniciar-sesion.html"%>
        </div>
        
    </body>
</html>
