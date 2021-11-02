<%-- 
    Document   : agenda-todo
    Created on : 31 oct. 2021, 16:11:45
    Author     : hectoradolfo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            //Declaramos los nombres de los atributos
            String parametros
                    = "agenda todos";
            session.setAttribute("parametros", parametros);

            //listados que necesitamos para desplegar la agenda del usuario
            ObtenerListados obtenerListados = new ObtenerListados();
            ArrayList<String> agenda = obtenerListados.getFrom("agenda todos", request);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>agenda</title>
    </head>
    <body>
        <%@include file="../html/nav/cabecera-principal.html" %>
        <div class="main">
            <div class="row g-3">
                <div class="col-sm-3">

                </div>
                <div class="col-sm-6">
                    <div class="formulario h-100 p-5  border rounded-3">
                        <h3>Agenda de todas las actividades </h3>
                        <table class="table table-dark table-striped">
                            <tr>
                                <th>codigo</th>
                                <th>fecha</th>
                                <th>siembra </th>
                                <th>descripcion </th>
                                <th> </th><!-- comment -->
                            </tr> <!--  el arrayList agenda que debe ser un objero y de tener los atributos
                                  codigo , fecha, siembra y descripcion 
                            -->
                            <%
                                for (int i = 0; i < agenda.size(); i++) {
                            %>
                            <tr>
                                <td><%=agenda.get(i).getCodigo()%> </td>
                                <td><%=agenda.get(i).getFecha()%> </td>
                                <td><%=agenda.get(i).getSiembra()%> </td>
                                <td><%=agenda.get(i).getDescripcion()%> </td>
                                <td><a href="../jsp/contacto-correo.jsp?codigo_correo=<%=agenda.get(i).getCodigo()%>">Eliminar</a></td>
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
