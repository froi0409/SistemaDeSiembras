<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>Modificar Correo</title>
    </head>
    <body background="../resources/img/create_user.jpg">
        
        <%
            //Declaramos los nombres de los atributos        
            //String parametros = "CONTACTO_TELEFONO,codigo_telefono,codigo_usuario,telefono";
            //session.setAttribute("parametros", parametros);
            session.setAttribute("tabla", "CONTACTO_CORREO");
            session.setAttribute("parametrosModificar", "correo");
            session.setAttribute("restriccion", "correo");
            session.setAttribute("valorRestriccion", "correo");
        %>
        
        <%@include file="../html/nav/cabecera-usuario.html" %>
        <div class="main">
            <%@include file="mensaje.jsp" %>
            <%@include file="../html/usuarios/modificar-correo.html"%>
        </div>
        
    </body>
</html>

