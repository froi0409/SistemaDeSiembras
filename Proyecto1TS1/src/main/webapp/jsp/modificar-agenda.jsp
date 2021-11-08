<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>Modificar Agenda</title>
    </head>
    <body background="../resources/img/create_user.jpg">
        
        <%
            //Declaramos los nombres de los atributos        
            session.setAttribute("tabla", "AGENDA");
            session.setAttribute("parametrosModificar", "descripcion_agenda");
            session.setAttribute("restriccion", "codigo_agenda");
            session.setAttribute("valorRestriccion", request.getParameter("codigoAgenda"));
        %>
        
        <%@include file="../html/nav/cabecera-usuario.html" %>
        <div class="main">
            <%@include file="mensaje.jsp" %>
            <%@include file="../html/usuarios/modificar-agenda.html"%>
        </div>
        
    </body>
</html>

