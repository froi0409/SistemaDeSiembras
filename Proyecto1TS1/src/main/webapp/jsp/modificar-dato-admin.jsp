<%-- 
    Document   : modificar-dato-admin
    Created on : 8/11/2021, 04:15:12
    Author     : froi-pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String dato = request.getParameter("dato");
            String type;
            switch(dato) {
                case "correo":
                    type="email";
                    break;
                default:
                    type="text";
            }
            //Declaramos los nombres de los atributos        
            session.setAttribute("tabla", "ADMIN");
            session.setAttribute("parametrosModificar", dato);
            session.setAttribute("restriccion", "codigo_admin");
            session.setAttribute("valorRestriccion", session.getAttribute("codigo_usuario"));
            
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>Modificar Dato</title>
    </head>
    <body>
        
        <%@include file="../html/nav/cabecera-administradores.html" %>
        <div class="main">
            <%@include file="mensaje.jsp" %>
            
            
            <br><br>
            <div class="container-sm">
                <div class="row g-3">

                    <div class="col-sm-3">

                    </div>
                    <div class="col-sm-6">
                        <div class="formulario h-100 p-5  border rounded-3">
                            <h3 style="color:#202643">Modificar el dato <%=request.getParameter("dato") %> del admin: <%=session.getAttribute("codigo_usuario")%></h3>
                            <h6 style="color:#202643"></h6><br>
                            <form class="row g-3 needs-validation" action="../ControladorActualizarRegistro" method="POST">

                                <div class="form-floating">
                                    <input type="<%=type %>"  class="form-control inputPrueba" id="<%=dato %>" name="<%=dato %>" 
                                               placeholder="escribe una descripcion" required />
                                    <label for="<%=dato %>" style="color:#97908c">Dato a Modificar<span style="color:red">*</span></label>
                                    <div class="invalid-tooltip" oninput="tipo_planta">
                                        Please choose a unique and valid descripcion.
                                    </div>
                                </div>

                                <div class="d-grid gap-2 col-6 mx-auto">
                                    <button class="btn botonRegistro" type="submit">Modificar</button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            
        </div>
        
    </body>
</html>