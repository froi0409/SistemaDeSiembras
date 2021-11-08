<%-- 
    Document   : agenda-todo
    Created on : 31 oct. 2021, 16:11:45
    Author     : hectoradolfo
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="funciones.ObtenerListados"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            //listados que necesitamos para desplegar la agenda del usuario
            ObtenerListados obtenerListados = new ObtenerListados();
            List<ArrayList<String>> listado = obtenerListados.getFrom("agenda todos", request);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>Agendas</title>
    </head>
    <body>
        <%@include file="../html/nav/cabecera-usuario.html" %>
        <div class="main">
            <%@include file="mensaje.jsp" %>
            <div class="row g-3">
                <div class="col-sm-3">

                </div>
                <div class="col-sm-6">
                    <div class="formulario h-100 p-5  border rounded-3">
                        <a href="crear-nueva-agenda.jsp" class="btn botonRegistro">Nueva Agenda</a>
                        <br><br>
                        <h3>Agenda de todas las actividades</h3>
                        <table class="table table-dark table-striped">
                            <tr>
                                <th>codigo</th>
                                <th>fecha</th>
                                <th>siembra </th>
                                <th>descripcion </th>
                                <th></th>
                            </tr> <!--  el arrayList agenda que debe ser un objero y de tener los atributos
                                  codigo , fecha, siembra y descripcion 
                            -->
                            <%
                                for (int i = 0; i < listado.size(); i++) {
                            %>
                            <tr>
                                <%
                                for(int j = 0; j < listado.get(0).size(); j++) {
                                %>
                                <td>
                                    <%
                                    if(listado.get(i).get(j) == null) {
                                        out.print("Ninguno");
                                    } else {
                                        out.print(listado.get(i).get(j));
                                    }
                                    %>
                                    
                                </td>
                                <%
                                }
                                %>
                                <td><a class="btn btn-light" href="modificar-agenda.jsp?codigoAgenda=<%=listado.get(i).get(0) %>">Modificar</a></td>
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
