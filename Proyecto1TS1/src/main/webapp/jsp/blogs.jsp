<%-- 
    Document   : blogs
    Created on : 15 oct. 2021, 0:13:27
    Author     : hectoradolfo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
            crossorigin="anonymous"
            >

        <link rel="stylesheet" href="../html/blogs/style.css">
        <script src="../js/validation.js"></script>

        <title>blogs personal</title>
    </head>
    <body>
        <%@include file="../html/blogs/plublicacion.html"%>

        <%@include file= "../html/blogs/publicaciones.html" %>

    </body>
</html>
