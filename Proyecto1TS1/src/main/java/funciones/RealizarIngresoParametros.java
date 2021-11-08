/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package funciones;

import conection_db.Consultar;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import registros.RealizarRegistroTabla;

/**
 *
 * @author grifiun
 */
public class RealizarIngresoParametros {
    
    public void realizarIngresoFromParametros(HttpServletRequest request){
        //////////////////////////////////////////////PARTE REGISTRO
        //Instanciamos
        RealizarRegistroTabla registro;
        PrepareDataFromIdentificadores prepareData;
        
        //Obtenemos el listado de los parametros
        String parametros = (String) request.getSession().getAttribute("parametros");
        
        //Obtenemos el listado de identificadores en un listado
        ArrayList<String> identificadores = new ArrayList<String>(Arrays.asList(parametros.split(",")));
        
        //le damos valor al objeto
        prepareData = new PrepareDataFromIdentificadores(identificadores);//agregamos los identificadores
        //Obtenemos el listado de datos a partir del request y el listado de identificadores
        ArrayList<String> datos = prepareData.getDataFromIdentificadores(request);               
        
        //le damos valor al objeto de registro utilizando el listado de identificadores y datos
        registro = new RealizarRegistroTabla(identificadores, datos);
        registro.modificarRegistro();//realizamos el registro
        
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
    }
}
