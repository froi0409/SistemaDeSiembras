/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import conection_db.Consultar;
import funciones.PrepareDataFromIdentificadores;
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
        //////////////////////////////////////////////PARTE REGISTRO
        //Instanciamos
        RealizarRegistroTabla registro;
        PrepareDataFromIdentificadores prepareData;
        
        //Obtenemos el listado de los parametros
        String parametros = (String) request.getAttribute("parametros");
        
        //Obtenemos el listado de identificadores en un listado
        ArrayList<String> identificadores = new ArrayList<String>(Arrays.asList(parametros.split(",")));
        
        //le damos valor al objeto
        prepareData = new PrepareDataFromIdentificadores(identificadores);//agregamos los identificadores
        //Obtenemos el listado de datos a partir del request y el listado de identificadores
        ArrayList<String> datos = prepareData.getDataFromIdentificadores(request);               
        
        //le damos valor al objeto de registro utilizando el listado de identificadores y datos
        registro = new RealizarRegistroTabla(identificadores, datos);
        registro.realizarRegistro();//realizamos el registro
        
        //////////////////////////////////////////////PARTE COMPROBACION         
         //Retornamos otra pagina dependiendo del resultado
        Consultar cons = new Consultar();
        boolean isRegistroCompleto = false;
        //Obtenemos el resutlado TRUE/FALSE si se realizo el registro
        isRegistroCompleto = cons.consultarExistenciaRegistro(identificadores.get(0), //TABLA
                new ArrayList<String>(Arrays.asList(identificadores.get(1))), // Consutlar PK 
                new ArrayList<String>(Arrays.asList(datos.get(0))));//con valor
       
        if(isRegistroCompleto){//Si el registro se hizo de forma exitosa
            if(identificadores.get(0).equalsIgnoreCase("usuario") ||
               identificadores.get(0).equalsIgnoreCase("admin")){
                request.getSession().setAttribute("mensaje", "El registro se hizo con satisfaccion\nel codigo de "+identificadores.get(0)+" es: "+
                        datos.get(0));//En el caso de usuarios y administradores, el primer dato es el codigo
            }else
                request.getSession().setAttribute("mensaje", "El registro se hizo con satisfaccion");
        }
        else{
            request.getSession().setAttribute("mensaje", "El registro no se realizo debido a un error");
        }        
        
        request.getSession().setAttribute("codigoAleatorio", "activado");//volvemos a activar la generacion del codigo aleatorio
        request.getSession().setAttribute("fechaSistema", "activado");//volvemos a activar la generacion del codigo aleatorio
        
        if(((String)request.getSession().getAttribute("redireccionarRegistro")) == null || ((String)request.getSession().getAttribute("redireccionarRegistro")).length() == 0){
            String direccion = "jsp/home.jsp";
            response.sendRedirect(direccion);
        }else{
            request.getSession().setAttribute("redireccionarRegistro", "");
        }
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
