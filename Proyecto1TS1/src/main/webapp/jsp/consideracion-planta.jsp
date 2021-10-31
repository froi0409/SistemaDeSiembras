<%-- 
    Document   : consideracion-planta
    Created on : 28 oct. 2021, 0:17:51
    Author     : hectoradolfo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            //Declaramos los nombres de los atributos
            String parametros
                    = "CONSIDERACION,codigo_consideracion,codigo_fase,codigo_plantas,descripcion_accion";
            session.setAttribute("parametros", parametros);
//Cargamos el listado de plantas
//usamos el objeto de funciones.ObtenerListados, por tanto hay que importar
            ObtenerListados obtenerListados = new ObtenerListados();
            ArrayList<String> listadoTipoPlanta = obtenerListados.getFrom("tipo_planta");
            ArrayList<String> listadoFaseLunar = obtenerListados.getFrom("fase_lunar");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>consideracion planta</title>
    </head>
    <body class="body-consideracion-planta">

        <%@include file="../html/nav/cabecera-principal.html" %>
        <div class="main">

            <div class="container-sm">
                <div class="row g-3">

                    <div class="col-sm-3">

                    </div>
                    <div class="col-sm-6">
                        <div class="formulario h-100 p-5  border rounded-3">

                            <select id="codigo_fase" name="codigo_fase">
                                <!--  //Aca harán un ciclo que cargará todos los datos, pueden usar un for each o un
                                  //for como en este ejemplo-->
                                <%
                                    for (int i = 0; i < listadoFaseLunar.size(); i++) {
                                        String valorAux = listadoFaseLunar.get(i);
                                %>
                                <option value="<%=valorAux%>"><%=valorAux%></option>
                                <%
                                    }
                                %>
                            </select>
                            <select id="codigo_plantas" name="codigo_plantas">
                                <!--  //Aca harán un ciclo que cargará todos los datos, pueden usar un for each o un
                                 //for como en este ejemplo-->
                                <%
                                    for (int i = 0; i < listadoTipoPlanta.size(); i++) {
                                        String valorAux = listadoTipoPlanta.get(i);
                                %>
                                <option value="<%=valorAux%>"> <%=valorAux%></option>
                                <%
                                    }
                                %>
                            </select>



                            <%@include file="../html/planta/consideracion-action.html"%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
