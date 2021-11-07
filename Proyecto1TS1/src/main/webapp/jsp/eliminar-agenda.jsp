<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>Eliminar Agenda</title>
    </head>
    <body background="../resources/img/create_user.jpg">
        
        <%
            //Declaramos los nombres de los atributos        
            String parametros = "CONTACTO_TELEFONO,codigo_telefono,codigo_usuario,telefono";
            session.setAttribute("parametros", parametros);
        %>
        
        <%@include file="../html/nav/cabecera-usuario.html" %>
        <div class="main">
            <%@include file="../html/usuarios/eliminar-agenda.html"%>
        </div>
        
    </body>
</html>

