<%-- 
    Document   : contactos
    Created on : 30 oct. 2021, 17:16:35
    Author     : hectoradolfo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            //Declaramos los nombres de los atributos
            String parametros
                    = "contacto, telefono";
            session.setAttribute("parametros", parametros);
            //listados que necesitamos para desplegar los contactos del usuario
            ObtenerListados obtenerListados = new ObtenerListados();
            ArrayList<String> contactoTel = obtenerListados.getFrom("contacto_telefono");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>contactos</title>
    </head>
    <body>
        
        <%@include file="../html/nav/cabecera-principal.html" %>
        <div class="main">
            <div class="row g-3">
                <div class="col-sm-3">

                </div>
                <div class="col-sm-6">
                    <div class="formulario h-100 p-5  border rounded-3">
                        <h1>Contacto telefonico</h1>
                        <table class="table table-dark table-striped">
                            <tr>
                                <th>Codigo</th>
                                <th>Numero de Telefono</th>
                                <th> </th>
                            </tr> <!--  el arrayList contactoTel debe de tener un objeto con los atributos
                                  codigo_telefono y telefono
                            -->
                            <%
                                for (int i = 0; i < contactoTel.size(); i++) {
                            %>
                            <tr>
                                <td><%=contactoTel.get(i).getCodigoTelefono()%> </td>
                                <td><%=contactoTel.get(i).getTelefono()%> </td>
                                <td><a href="../jsp/contacto-correo.jsp?codigo_correo=<%=contactoTel.get(i).getCodigoTelefono()%>">Eliminar</a></td>
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
