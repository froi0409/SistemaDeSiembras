/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package funciones;

import conection_db.Consultar;
import java.util.ArrayList;

/**
 *
 * @author grifiun
 */
public class ObtenerListados {
    public ArrayList<String> getFrom(String tipoListado){
        Consultar consultarDB = new Consultar();
        
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
            default:
                return new ArrayList();       
        }
        
        return consultarDB.obtenerListadoSimpleRegistros(query, new ArrayList<String>());
    }
}
