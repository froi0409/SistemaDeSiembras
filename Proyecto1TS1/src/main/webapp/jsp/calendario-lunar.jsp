<%-- 
    Document   : calendario-lunar
    Created on : 1/11/2021, 22:39:04
    Author     : froi-pc
--%>

<%@page import="funciones.ObtenerImagen"%>
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
        <link href="../css/calendario.css" rel="stylesheet" type="text/css"/>
        <title>Calendario Lunar</title>
    </head>
    <body>
        
        <%
            ObtenerMes obtenerMes = new ObtenerMes(request);
            List<ArrayList<Dia>> listadoMes = obtenerMes.obtener();
            String mes = session.getAttribute("mes").toString();
            int mesNumero = Integer.parseInt(mes);
            
        %>
        
        <%@include file="../html/nav/cabecera-usuario.html" %>
        <div class="main">
            <%@include file="mensaje.jsp" %>
            <div class="row">
                <div class="col-2">
                    <!-- columna vacía -->
                </div>
                
                
                <div class="col-8">
                    <div class="formulario h-100 p-5  border rounded-3">
                        <div class="row mb-5">
                            <div class="col-2" align="left">
                                <a href="mes-anterior.jsp" name="publicar" type="submit" class="btn botonRegistro">Anterior</a>
                            </div>
                            <div class="col-8" align="center">
                                <%
                                switch(mesNumero) {
                                    case 1:
                                        out.println("<h1>ENERO</h1>");
                                        break;
                                    case 2:
                                        out.println("<h1>FEBRERO</h1>");
                                        break;
                                    case 3:
                                        out.println("<h1>MARZO</h1>");
                                        break;
                                    case 4:
                                        out.println("<h1>ABRIL</h1>");
                                        break;
                                    case 5:
                                        out.println("<h1>MAYO</h1>");
                                        break;
                                    case 6:
                                        out.println("<h1>JUNIO</h1>");
                                        break;
                                    case 7:
                                        out.println("<h1>JULIO</h1>");
                                        break;
                                    case 8:
                                        out.println("<h1>AGOSTO</h1>");
                                        break;
                                    case 9:
                                        out.println("<h1>SEPTIEMBRE</h1>");
                                        break;
                                    case 10:
                                        out.println("<h1>OCTUBRE</h1>");
                                        break;
                                    case 11:
                                        out.println("<h1>NOVIEMBRE</h1>");
                                        break;
                                    case 12:
                                        out.println("<h1>DICIEMBRE</h1>");
                                        break;
                                }

                                %>
                            </div>
                            <div class="col-2" align="right">
                                <a href="mes-siguiente.jsp" name="publicar" type="submit" class="btn botonRegistro">Siguiente</a>
                            </div>
                        </div>
                            
                        <div align="center">
                            <table>
                            <%
                                for (int i = 0; i < listadoMes.size(); i++) {
                            %>
                            <tr>
                                <%
                                    for(int j = 0; j < listadoMes.get(0).size(); j++) {
                                        if(listadoMes.get(i).get(j) != null) {

                                        %>
                                            <td>
                                                <div align="center">
                                                    <%
                                                    String imagenFase = "../resources/Luna/";   
                                                    String año = session.getAttribute("año").toString();
                                                  
                                                    int fase = listadoMes.get(i).get(j).getPorcentajeFase();
                                                    int numeroDia = listadoMes.get(i).get(j).getNumeroDia();
                                                    int cantTareas = listadoMes.get(i).get(j).getNumeroActividades();
                                                    String fecha = año + "-" + mes + "-" + numeroDia;
                                                    
                                                    ObtenerImagen obtenerImagen = new ObtenerImagen();
                                                    imagenFase += obtenerImagen.obtenerNombre(fase);

                                                    //Se coloca la imagen correspoindiente de la luna
                                                    out.println("<img src=\"" + imagenFase + "\" width=\"100px\" height=\"100px\" class=\"border-image\">");
                                                    
                                                    System.out.println("tamaño i: " + listadoMes.size() + "; tamaño j: " + listadoMes.get(i).size() + "; dia: " + listadoMes.get(i).get(j).getNumeroDia());
                                                    if(numeroDia > 0) {
                                                        out.println("<a class=\"default\" href=\"agenda-dia-x.jsp?fecha=" + fecha + "\"><h4>" + numeroDia + "</h4></a>");
                                                        out.println("<h4 style=\"color: red;\">T: " + cantTareas + "</h4");
                                                    }
                                                    %>
                                                </div>
                                            </td>
                                        <%
                                        } else {
                                        %>
                                            <td align="center">
                                                <div>
                                                    
                                                </div>
                                            </td>
                                        <%
                                        }
                                    %>
                                
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