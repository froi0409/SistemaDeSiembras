/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conection_db;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase encargada de realizar registros dentro de la DB
 * @author grifiun
 */
public class Registrar {
    List<ArrayList<String>> queryDato;
    ArrayList<String> query;
    /**
     * Contructor de la clase registrar
     * recibe los parametros de:
     * List<ArrayList<String>> queryDato;
     * ArrayList<String> query;
     */
    public Registrar(List<ArrayList<String>> queryDato, ArrayList<String> query){
        this.queryDato = queryDato;
        this.query = query;        
    }

    /**
     * Contructor de la clase registrar
     * recibe los parametros de:
     * ArrayList<String> queryDato;
     * String query;
     */
    public Registrar(ArrayList<String> queryDato, String query){
        //Creamos las variables auxiliares que pide la clase registro
        List<ArrayList<String>> datoQueryAux = new ArrayList();
        ArrayList<String> queryAux = new ArrayList();
        
        //Agregamos la query
        queryAux.add(query);
        //Agregamos los datos
        datoQueryAux.add(queryDato);
        
        this.queryDato = datoQueryAux;
        this.query = queryAux;        
    }     

    /**
     * realizamos los registros
     */
    public void realizarRegistro(){ 
        System.out.println("REGISTROS");
        for(int i = query.size() - 1; i >= 0; i--){   
            try {
                //Registramos las ordenes
                //Query.get(i)
                //y los datos
                //queryDato.get(i) 
                CrearDeclaracionPreparada cdp = new CrearDeclaracionPreparada();
                cdp.crearDeclaracionPreparada(queryDato.get(i), query.get(i)).executeUpdate();
                System.out.println(query.get(i));
            } catch (SQLException ex) {
                System.out.println("error: "+ ex.getMessage());
            }
        }
    }
    
    
}
