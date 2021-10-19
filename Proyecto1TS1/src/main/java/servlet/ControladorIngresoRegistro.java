/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import conection_db.Consultar;
import funciones.PrepareDataFromIdentificadores;
import funciones.RealizarIngresoParametros;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
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
        String parametros = (String) request.getAttribute("parametros");        
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
            parametrosAux = "CORREO,codigo_correo,codigo_usuario,correo";
            request.setAttribute("parametros", parametrosAux);
            
            realizarIngreso.realizarIngresoFromParametros(request);
            
            //Registramos telefono
            parametrosAux = "TELEFONO,codigo_telefono,codigo_usuario,telefono";
            request.setAttribute("parametros", parametrosAux);
            
            realizarIngreso.realizarIngresoFromParametros(request);
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
