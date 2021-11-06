/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import conection_db.Consultar;
import funciones.GetAttributeParameterRequest;
import funciones.PrepareDataFromIdentificadores;
import funciones.RealizarIngresoParametros;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import registros.RealizarRegistroTabla;

/**
 * Este controlador tiene como tarea manejar todos los registros iniciales hacia las base de datos
 * es decir, las creaciones de entidades, no cambios ni delete
 * @author grifiun
 */
public class ControladorIngresoRegistro extends HttpServlet {

    /**
     * Metodo post
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Obtenemos el listado de los parametros
        String parametros = (String) request.getSession().getAttribute("parametros");   
        //Obtenemos el listado de identificadores en un listado
        ArrayList<String> identificadores = new ArrayList<String>(Arrays.asList(parametros.split(",")));
        
        //Instanciammos
        RealizarIngresoParametros realizarIngreso = new RealizarIngresoParametros();
        
        //Realizamos el registro
        realizarIngreso.realizarIngresoFromParametros(request);      
        
        //Condiciones, si se ingresa un usuario hay que registrar su correo y telefono        
        if(identificadores.get(0).equalsIgnoreCase("USUARIO")){
            //Declaramos los nombres de los atributos        
            String parametrosAux;
            
            //Registramos correo
            parametrosAux = "CONTACTO_CORREO,codigo_correo,codigo_usuario,correo";
            request.getSession().setAttribute("parametros", parametrosAux);
            
            realizarIngreso.realizarIngresoFromParametros(request);
            
            //Registramos telefono
            parametrosAux = "CONTACTO_TELEFONO,codigo_telefono,codigo_usuario,telefono";
            request.getSession().setAttribute("parametros", parametrosAux);
            
            realizarIngreso.realizarIngresoFromParametros(request);
            
            //Establecemos el código del usuario
            GetAttributeParameterRequest getAttribute = new GetAttributeParameterRequest(request);
            request.getSession().setAttribute("codigo_usuario", getAttribute.getAttributOrParameter("codigo_usuario"));
        }else if(identificadores.get(0).equalsIgnoreCase("SIEMBRA")){
            
            //Declaramos los nombres de los atributos        
            String parametrosAux;
            
            System.out.println((String) request.getSession().getAttribute("codigo_siembra"));
            
            //Registramos correo
            parametrosAux = "AGENDA,codigo_agenda,codigo_usuario,codigo_fecha,codigo_siembra,descripcion_agenda";
            request.getSession().setAttribute("parametros", parametrosAux);
                                   
            Consultar consultarDB = new Consultar();
            String queryObtenerConsulta = "     SELECT fecha, descripcion_accion\n" +
                                        "	FROM DIA as dias\n" +
                                        "	JOIN (SELECT nombre, tipo_planta, \n" +
                                        "	duracion_dias, \n" +
                                        "	descripcion_accion, \n" +
                                        "	codigo_fase \n" +
                                        "	FROM PLANTA AS A \n" +
                                        "	JOIN CONSIDERACION AS B \n" +
                                        "	ON tipo_planta = codigo_plantas && nombre = ?\n" +
                                        "	) as listado\n" +
                                        "	ON dias.fase = listado.codigo_fase\n" +
                                        "	WHERE fecha BETWEEN ? AND DATE_ADD(?, INTERVAL duracion_dias DAY)\n" +
                                        "	ORDER BY fecha ASC;";
            
            ArrayList<String> datosAuxQuery = new ArrayList();
            //Establecemos el código del usuario
            GetAttributeParameterRequest getAttribute = new GetAttributeParameterRequest(request);
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String fechaAuxiliar = df.format(new Date());
            //Necesita los siguientes datos
            //nombre planta
            //fecha
            //fecha            
            
            System.out.println("NOMBRE: " + getAttribute.getAttributOrParameter("nombre_planta"));
            datosAuxQuery.add(getAttribute.getAttributOrParameter("nombre_planta"));
            datosAuxQuery.add(fechaAuxiliar);
            datosAuxQuery.add(fechaAuxiliar);
            
            List<ArrayList<String>> listaDatosConsideraciones = consultarDB.obtenerRegistros(queryObtenerConsulta, datosAuxQuery);
            
            //-- Query final para obtener la descripcion de las acciones necesarias en las fechas que cubren la duracion de la planta ? en la fecha ? fecha ?
            //-- Necesitamos obtener para tener inserciones buenas
            //-- codigo_fecha <-- fecha
            //-- descripcion_agenda <-- descripcion_accion                 
            for(int i = 0; i < listaDatosConsideraciones.size(); i++){
                //Obtenemos del listado                    
                //codigo_fecha    
                //descripcion
                request.getSession().setAttribute("codigo_fecha", listaDatosConsideraciones.get(i).get(0));
                request.getSession().setAttribute("descripcion_agenda", listaDatosConsideraciones.get(i).get(1));   
                //insertamos la consideracion 
                realizarIngreso.realizarIngresoFromParametros(request);
            }       
            
            //Finalizamos el codigo_siembra
            //le asignamos un valor "" para que las proximas siembras tengan un codigo nuevo
            request.getSession().setAttribute("codigo_siembra", "");
        }
        
        
        //retornamos a otra pagina
        request.getSession().setAttribute("codigoAleatorio", "activado");//volvemos a activar la generacion del codigo aleatorio
        request.getSession().setAttribute("fechaSistema", "activado");//volvemos a activar la generacion del codigo aleatorio
       
        //if(((String)request.getSession().getAttribute("redireccionarRegistro")) == null || ((String)request.getSession().getAttribute("redireccionarRegistro")).length() == 0){
            String direccion = "jsp/blogs.jsp";
            response.sendRedirect(direccion);
        //}else{
        //    request.getSession().setAttribute("redireccionarRegistro", "");
        //}
    }
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
