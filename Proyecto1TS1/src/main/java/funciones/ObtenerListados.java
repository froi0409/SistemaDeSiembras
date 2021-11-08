/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package funciones;

import conection_db.Consultar;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author grifiun
 */
public class ObtenerListados {
    
    /**
     * Funcion para obtener datos de un listado que no necesitan restricciones, 
     * es decir where
     * @param tipoListado
     * @return 
     */
    public ArrayList<String> getFrom(String tipoListado){
        Consultar consultarDB = new Consultar();
        ArrayList<String> datosWhere = new ArrayList<String>();
        
        String query;//obtenemos la query correspondiente  
        
        switch(tipoListado){
            case "planta":
                    query = "SELECT nombre FROM PLANTA;";
                break;
            case "tipo_planta":
                    query = "SELECT tipo FROM TIPOPLANTA;";
                break;
            case "fase_lunar":
                    query = "SELECT fase FROM FASE;";
                break;
            case "admin":
                    query = "SELECT codigo_admin, nombre, correo FROM ADMIN;";
                break;
            case "usuario":
                    query = "SELECT codigo_usuario, nombre, apellido, sexo, birth FROM USUARIO;";
                break;
            case "planta-admin":
                    query = "SELECT nombre, tipo_planta, descripcion_planta, duracion_dias FROM PLANTA;";
                break;
            case "tipo-planta-admin":
                    query = "SELECT tipo, descripcion FROM TIPOPLANTA;";
                break;
            default:
                return new ArrayList();       
        }
        
        return consultarDB.obtenerListadoSimpleRegistros(query, datosWhere);
    }
    
    /**
     * Funcion para obtener datos de un listado que no necesitan restricciones, 
     * es decir where
     * @param tipoListado
     * @return 
     */
    public List<ArrayList<String>> getTablaFrom(String tipoListado){
        Consultar consultarDB = new Consultar();
        ArrayList<String> datosWhere = new ArrayList();
        
        String query;//obtenemos la query correspondiente  
        
        switch(tipoListado){
           /* case "planta":
                    query = "SELECT nombre FROM PLANTA;";
                break;
            case "tipo_planta":
                    query = "SELECT tipo FROM TIPOPLANTA;";
                break;
            case "fase_lunar":
                    query = "SELECT fase FROM FASE;";
                break;*/
            case "admin":
                    query = "SELECT codigo_admin, nombre, correo FROM ADMIN;";
                break;
            case "usuario":
                    query = "SELECT codigo_usuario, nombre, apellido, sexo, birth FROM USUARIO;";
                break;
            case "planta-admin":
                    query = "SELECT nombre, tipo_planta, descripcion_planta, duracion_dias FROM PLANTA;";
                break;
            case "tipo-planta-admin":
                    query = "SELECT tipo, descripcion FROM TIPOPLANTA;";
                break;
            default:
                return new ArrayList();       
        }
        
        return consultarDB.obtenerRegistros(query, datosWhere);
    }
    
    
    /**
     * Funcion para obtener datos propios de un usuario correspondiente
     * @param tipoListado
     * @param request
     * @return 
     */
    public List<ArrayList<String>> getFrom(String tipoListado, HttpServletRequest request){
        GetAttributeParameterRequest obtenerParam = new GetAttributeParameterRequest(request);
        Consultar consultarDB = new Consultar();
        ArrayList<String> datosWhere = new ArrayList<String>();
        
        String usuario = "user";
        try{
            usuario = (String) request.getSession().getAttribute("codigo_usuario");
        }catch(Error ex){
        
        }
        
        String query;//obtenemos la query correspondiente  
        
        switch(tipoListado){
            case "contacto telefono":
                    query = "SELECT codigo_telefono, telefono FROM CONTACTO_TELEFONO WHERE codigo_usuario = ?;";    
                    datosWhere.add(usuario);//asignamos dato
                break;
            case "contacto correo":
                    query = "SELECT codigo_correo, correo FROM CONTACTO_CORREO WHERE codigo_usuario = ?;";    
                    datosWhere.add(usuario);//asignamos dato
                break;
            case "siembras":
                    query = "SELECT codigo_siembra, nombre_planta, fecha, descripcion_siembra FROM SIEMBRA WHERE codigo_usuario = ?;";
                    datosWhere.add(usuario);//asignamos dato
                break;
            case "agenda hoy":
                    query = "SELECT codigo_agenda, codigo_fecha, codigo_siembra, descripcion_agenda FROM AGENDA WHERE codigo_usuario = ? AND codigo_fecha = ?;";
                    datosWhere.add(usuario);//asignamos dato
                    
                    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                    String fechaAuxiliar = df.format(new Date());
                    datosWhere.add(fechaAuxiliar);
                break;
            case "agenda todos":
                    query = "SELECT codigo_agenda, codigo_fecha, codigo_siembra, descripcion_agenda FROM AGENDA WHERE codigo_usuario = ?;";
                    datosWhere.add(usuario);//asignamos dato                    
                break;
            case "agenda x":
                    query = "SELECT codigo_agenda, codigo_fecha, codigo_siembra, descripcion_agenda FROM AGENDA WHERE codigo_usuario = ? AND codigo_fecha = ?;";
                    datosWhere.add(usuario);//asignamos dato
                    datosWhere.add(obtenerParam.getAttributOrParameter("fecha"));
                break;
            default:
                return new ArrayList();       
        }
        
        return consultarDB.obtenerRegistros(query, datosWhere);
    }
}
