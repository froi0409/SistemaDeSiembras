<%-- 
    Document   : procesar-comentario
    Created on : 8/11/2021, 09:22:23
    Author     : froi-pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1><%=session.getAttribute("codigo_usuario") %></h1>
        <h1><%=java.time.LocalDate.now() %></h1>
        <h1><%=request.getParameter("comentario") %></h1>
        <input type="text" value="<%=request.getParameter("comentario") %>" id="comentario" name="comentario"/>
    </body>
</html>
