/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registros;

import conection_db.Registrar;
import funciones.GenerarStringIdentificador;
import java.util.ArrayList;
import java.util.List;

/**
 * Esta clase realiza registros de las tablas
 * @author grifiun
 */
public class RealizarRegistroTabla{
    private ArrayList<String> identificador;
    private ArrayList<String> datos;
    
    public RealizarRegistroTabla(){
        this.identificador = new ArrayList();
        this.datos = new ArrayList();
    }
    
    public RealizarRegistroTabla(ArrayList<String> identificador, ArrayList<String> datos){
        this.identificador = identificador;
        this.datos = datos;
    }
    
    /**
     * Agregamos un dato al arrayList datro
     */
    public void addToDato(String dato){
        //Removemos saltos de linea
        this.datos.add(dato);
    }
    
    /**
     * Agregamos un dato al arrayList identificador
     */
    public void addToIdentificador(String ident){
        this.identificador.add(ident);
    }

    
    public void modificarRegistro(){
        //CONTENEDORES GENERALES
        ArrayList<String> queryList = new ArrayList();//ArrayList que contendra nuestra query
        List<ArrayList<String>> datoQuery = new ArrayList();//ArrayList de arraylist que contrendra nuestro listado de valores de querys
        //GENERAMOS EL QUERY
        GenerarStringIdentificador gsi = new GenerarStringIdentificador();//instanciamos el GSI
        queryList.add(gsi.generarStringIdentificador("INSERT INTO "+identificador.get(0)+"(", //INTO TABLA XX
                 ")", ",", (new ArrayList<String> (identificador.subList(1, identificador.size()))))+//2da parte removemos el identificador de la TABLA
                gsi.generarStringIdentificador(" VALUES (", 
                ")", ",", datos.size()));
        datoQuery.add(datos);//agregamos los datos
        //REGISTRAMOS
        Registrar reg = new Registrar(new ArrayList<ArrayList<String>> (datoQuery), new ArrayList<String>(queryList));
        reg.realizarRegistro();//registramos
    }
    
    /**
     * Funcion que registra los datos enviados
     * @param identificador
     * @param datos 
     */
    public void realizarRegistro(){
        //CONTENEDORES GENERALES
        ArrayList<String> queryList = new ArrayList();//ArrayList que contendra nuestra query
        List<ArrayList<String>> datoQuery = new ArrayList();//ArrayList de arraylist que contrendra nuestro listado de valores de querys
        //GENERAMOS EL QUERY
        GenerarStringIdentificador gsi = new GenerarStringIdentificador();//instanciamos el GSI
        queryList.add(gsi.generarStringIdentificador("INSERT INTO "+identificador.get(0)+"(", //INTO TABLA XX
                 ")", ",", (new ArrayList<String> (identificador.subList(1, identificador.size()))))+//2da parte removemos el identificador de la TABLA
                gsi.generarStringIdentificador(" VALUES (", 
                ")", ",", datos.size()));
        datoQuery.add(datos);//agregamos los datos
        //REGISTRAMOS
        Registrar reg = new Registrar(new ArrayList<ArrayList<String>> (datoQuery), new ArrayList<String>(queryList));
        reg.realizarRegistro();//registramos
    }

    public ArrayList<String> getIdentificador() {
        return identificador;
    }

    public void setIdentificador(ArrayList<String> identificador) {
        this.identificador = identificador;
    }

    public ArrayList<String> getDatos() {
        return datos;
    }

    public void setDatos(ArrayList<String> datos) {
        this.datos = datos;
    }
    
    
    
}
