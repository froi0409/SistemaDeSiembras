<%-- 
    Document   : mes-siguiente
    Created on : 7/11/2021, 20:10:32
    Author     : froi-pc
--%>

<%

    int numeroMes = Integer.parseInt(session.getAttribute("mes").toString());
    if(numeroMes != 12) {
        numeroMes++;
    }
    session.setAttribute("mes", numeroMes);
    response.sendRedirect("calendario-lunar.jsp?mes=" + numeroMes);
%>