/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import conection_db.Actualizar;
import encriptador.Encriptar;
import funciones.GetAttributeParameterRequest;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import registros.RealizarRegistroTabla;

/**
 *
 * @author grifiun
 */
@WebServlet(name = "ControladorActualizarRegistro", urlPatterns = {"/ControladorActualizarRegistro"})
public class ControladorActualizarRegistro extends HttpServlet {

       /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //instanciamos el obtenedor de datos
        GetAttributeParameterRequest gapr = new GetAttributeParameterRequest(request);
        //agregamos los identificadores
        //obtenemos la tabla
        String tabla = gapr.getAttributOrParameter("tabla"); 
        //obtenemos el atributo a modificar
        String atributo = gapr.getAttributOrParameter("atributo");
        //obtenemos el valor
        String valorAtributo = gapr.getAttributOrParameter(atributo);
        //nuevo valor
        ArrayList<String> identificador = new ArrayList<String>();
        //Identificador restriccion
        String restriccion = gapr.getAttributOrParameter("restriccion");  
        String datoRestriccion = gapr.getAttributOrParameter(restriccion);
        //Agregamos a los identificadores
        identificador.add(atributo);
        ArrayList<String> dato = new ArrayList<String>();
        //obtenemos los datos
        for(int i = 0; i < identificador.size(); i++){
            if(identificador.get(i).equals("password")){   
                //encriptamos
                Encriptar encrpt = new Encriptar();
                //Class.forName("org.apache.commons.codec.Driver");
                String auxPass = gapr.getAttributOrParameter(identificador.get(i));
                String auxEn = encrpt.getEncriptPass(auxPass);//encriptamos
                dato.add(auxEn);                
            }
            else{//si es un dato ordinario (a rescibir del request)
                 dato.add(gapr.getAttributOrParameter(identificador.get(i)));
            }
        }   
        dato.add(gapr.getAttributOrParameter(restriccion));//agregamos el codigo al final para agregar el valor de la restriccion
        //actualizamos
        Actualizar act = new Actualizar(tabla, //tabla
            new ArrayList<String>(identificador),//valores a modificar
            new ArrayList<String>(Arrays.asList(restriccion)),//restriccion: modificar donde el codigo
            new ArrayList<String>(dato));//valores y valor restriccion
        act.actualizar();
        request.getSession().setAttribute("mensaje", "El registro se hizo con satisfaccion");
        
        //redirigimos       
        String direccion = "jsp/blogs.jsp";
        response.sendRedirect(direccion);
        
       
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
