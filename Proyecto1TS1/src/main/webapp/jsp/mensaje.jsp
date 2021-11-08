<%-- 
    Document   : mensaje
    Created on : 7/11/2021, 11:46:30
    Author     : froi-pc
--%>

<%
    String mensaje;
    if(request.getSession().getAttribute("mensaje") != null) {
        mensaje = request.getSession().getAttribute("mensaje").toString();
%>
        <div class="alert alert-dark container mt-5" align="center" role="alert">
            <%=mensaje %>
        </div>
<%
        request.getSession().removeAttribute("mensaje");
    }
%>