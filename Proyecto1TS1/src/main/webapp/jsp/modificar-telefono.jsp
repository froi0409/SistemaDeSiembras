<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            //Declaramos los nombres de los atributos        
            session.setAttribute("tabla", "CONTACTO_TELEFONO");
            session.setAttribute("parametrosModificar", "telefono");
            session.setAttribute("restriccion", "codigo_telefono");
            session.setAttribute("valorRestriccion", request.getParameter("codigoTelefono"));
        %>
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>Modificar Telefono</title>
    </head>
    <body background="../resources/img/create_user.jpg">

        <%@include file="../html/nav/cabecera-usuario.html" %>
        <div class="main">
            <%@include file="mensaje.jsp" %>
            <%@include file="../html/usuarios/modificar-telefono.html"%>
        </div>
        
    </body>
</html>

