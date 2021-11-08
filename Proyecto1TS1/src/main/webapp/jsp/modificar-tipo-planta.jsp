<%-- 
    Document   : modificar-tipo-planta
    Created on : 8/11/2021, 03:50:19
    Author     : froi-pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            //Declaramos los nombres de los atributos        
            session.setAttribute("tabla", "TIPOPLANTA");
            session.setAttribute("parametrosModificar", "descripcion");
            session.setAttribute("restriccion", "tipo");
            session.setAttribute("valorRestriccion", request.getParameter("tipoPlanta"));
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>crear planta</title>
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
                            <h3 style="color:#202643">Modificar a la planta: <%=request.getParameter("tipoPlanta") %></h3>
                            <h6 style="color:#202643">Modifique la descripcion de la planta</h6><br>
                            <form class="row g-3 needs-validation" action="../ControladorActualizarRegistro" method="POST">

                                <div class="form-floating">
                                    <input type="text"  class="form-control inputPrueba" id="descripcion" name="descripcion" 
                                               placeholder="escribe una descripcion" required />
                                    <label for="descripcion" style="color:#97908c">Descripcion de la planta <span style="color:red">*</span></label>
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
