<%-- 
    Document   : crear-nueva-agenda
    Created on : 28/10/2021, 02:26:19
    Author     : froi-pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>Nueva Agenda</title>
    </head>
    <body background="../resources/img/create_user.jpg">
        
        <%
            //Declaramos los nombres de los atributos        
            String parametros = "AGENDA,codigo_agenda,codigo_usuario,codigo_fecha,descripcion_agenda";
            session.setAttribute("parametros", parametros);  
        %>
        
        <%@include file="../html/nav/cabecera-usuario.html" %>
        <div class="main">
            <%@include file="mensaje.jsp" %>
            <%@include file="../html/usuarios/nueva-agenda.html"%>
        </div>
        
    </body>
</html>
