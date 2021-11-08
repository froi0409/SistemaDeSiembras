<%-- 
    Document   : listado-datos-admin
    Created on : 8/11/2021, 04:02:09
    Author     : froi-pc
--%>

<%@page import="java.util.List"%>
<%@page import="funciones.ObtenerListados"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>Datos</title>
    </head>
    <body>

        <%
            ObtenerListados obtenerListados = new ObtenerListados();
            List<ArrayList<String>> listado = obtenerListados.getFrom("admin datos", request);
        %>
        <%@include file="../html/nav/cabecera-administradores.html" %>
        <div class="main">
            <%@include file="mensaje.jsp" %>
            <div class="row g-3">
                <div class="col-sm-3">

                </div>
                <div class="col-sm-6">
                    <div class="formulario h-100 p-5  border rounded-3">
                        <h3>Datos</h3>
                        <table class="table table-dark table-striped">
                            <tr>
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Correo</th>
                            </tr> <!--  el arrayList contactoCorreo debe de tener los atributos
                                  codigo_correo y correo
                            -->
                            <%
                                for (int i = 0; i < listado.size(); i++) {
                            %>
                            <tr>
                                <%
                                for(int j = 0; j < listado.get(0).size(); j++) {
                                    String datoModificar;
                                    switch(j) {
                                        case 0:
                                            datoModificar = "codigo_admin";
                                            break;
                                        case 1:
                                            datoModificar = "nombre";
                                            break;
                                        case 2:
                                            datoModificar = "correo";
                                            break;
                                        default:
                                            datoModificar = "nombre";
                                            break;
                                    }
                                    if(j != 0) {
                                %>
                                
                                        <td><%=listado.get(i).get(j)%><br><a href="modificar-dato-admin.jsp?dato=<%=datoModificar%>" class="btn btn-light">Modificar</a></td>
                                <%
                                    } else {
                                        
                                %>
                                        <td><%=listado.get(i).get(j)%></td>
                                
                                <%
                                    }
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