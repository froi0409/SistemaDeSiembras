<%-- 
    Document   : agenda-diax
    Created on : 31 oct. 2021, 16:11:25
    Author     : hectoradolfo
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="funciones.ObtenerListados"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>agenda</title>
    </head>
    <body>
        <%
            //Declaramos los nombres de los atributos
            String parametros
                    = "agenda x";
            session.setAttribute("parametros", parametros);

            //listados que necesitamos para desplegar la agenda del usuario
            ObtenerListados obtenerListados = new ObtenerListados();
            List<ArrayList<String>> agenda = obtenerListados.getFrom("agenda x", request);
        %>
        <%@include file="../html/nav/cabecera-usuario.html" %>
        <div class="main">
            <div class="row g-3">
                <div class="col-sm-3">

                </div>
                <div class="col-sm-6">
                    <div class="formulario h-100 p-5  border rounded-3">
                        <h3>Agenda de actividades <%=request.getParameter("fecha") %></h3>
                        <table class="table table-dark table-striped">
                            <tr>
                                <th>codigo</th>
                                <th>fecha</th>
                                <th>siembra </th>
                                <th>descripcion </th>
                            </tr> <!--  el arrayList agenda que debe ser un objero y de tener los atributos
                                  codigo , fecha, siembra y descripcion 
                            -->
                            <%
                                for (int i = 0; i < agenda.size(); i++) {
                            %>
                            <tr>
                                <%
                                for(int j = 0; j < agenda.get(0).size(); j++) {
                                %>
                                <td>
                                    <%
                                    if(agenda.get(i).get(j) == null) {
                                        out.print("Ninguno");
                                    } else {
                                        out.print(agenda.get(i).get(j));
                                    }
                                    %>
                                </td>
                                <%
                                }
                                %>
                            </tr>

                            <%
                                }
                            %>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
