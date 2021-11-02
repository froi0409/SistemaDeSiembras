<%-- 
    Document   : calendario-lunar
    Created on : 1/11/2021, 22:39:04
    Author     : froi-pc
--%>

<%@page import="entidades.Dia"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="funciones.ObtenerMes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>Nueva Agenda</title>
    </head>
    <body>
        
        <%
            ObtenerMes obtenerMes = new ObtenerMes(request);
            List<ArrayList<Dia>> listadoMes = obtenerMes.obtener();
        %>
        
        <%@include file="../html/nav/cabecera-usuario.html" %>
        <div class="main">
            
            <div class="row">
                <div class="col-2">
                    <!-- columna vacía -->
                </div>
                
                
                <div class="col-8">
                    <div class="formulario h-100 p-5  border rounded-3">
                        <div align="center">
                            <table>
                            <%
                                for (int i = 0; i < listadoMes.size(); i++) {
                            %>
                            <tr>
                                <%
                                for(int j = 0; j < listadoMes.get(0).size(); j++) {
                                %>
                                
                                    <td>
                                        <div align="center">
                                            <%
                                            String imagenFase;
                                            int fase = listadoMes.get(i).get(j).getPorcentajeFase();
                                            int numeroDia = listadoMes.get(i).get(j).getNumeroDia();
                                            
                                            
                                            switch(fase) {
                                                case 0:
                                                    imagenFase = "../resources/fases lunares/luna nueva.png";
                                                    break;
                                                case 25:
                                                    imagenFase = "../resources/fases lunares/primer cuarto creciente.png";
                                                    break;
                                                case 50:
                                                    imagenFase = "../resources/fases lunares/primer cuarto.png";
                                                    break;
                                                case 75:
                                                    imagenFase = "../resources/fases lunares/cuarto creciente.png";
                                                    break;
                                                case 100:
                                                    imagenFase = "../resources/fases lunares/luna llena.png";
                                                    break;
                                                case -75:
                                                    imagenFase = "../resources/fases lunares/luna menguante.png";
                                                    break;
                                                case -50:
                                                    imagenFase = "../resources/fases lunares/ultimo cuarto.png";
                                                    break;
                                                case -25:
                                                    imagenFase = "../resources/fases lunares/cuarto meguante.png";
                                                    break;
                                                default:
                                                    imagenFase = "";
                                                    break;
                                            }

                                            //Se coloca la imagen correspoindiente de la luna
                                            out.println("<img src=\"" + imagenFase + "\" width=\"30px\">");
                                            
                                            System.out.println("tamaño i: " + listadoMes.size() + "; tamaño j: " + listadoMes.get(i).size() + "; dia: " + listadoMes.get(i).get(j).getNumeroDia());
                                            if(numeroDia > 0) {
                                                out.println("<h4>" + numeroDia + "</h4>");
                                            }
                                            %>
                                        </div>
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
                
                
                <div class="col-2">
                    <!-- columna vacía -->
                </div>
            </div>
            
        </div>
        
    </body>
</html>