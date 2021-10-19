/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package funciones;

import java.util.ArrayList;

/**
 * Clase especializada en la generacion de parte de codigo query,
 * su funcionalidad principal es generar codigo similar a 
 * 
 * inicio identificador separador identificador separador identificador fin
 * SELECT identificador   = ? ,   identificador   = ? ,   identificador = ?
 * 
 * Debido a su estructura, es muy flexible en cuanto a su uso
 * @author grifiun
 */
public class GenerarStringIdentificador {
    
    /**
     * Se genera un string de forma
     * inicio+ datos enviados separadas por el simbolo (separador) + fin
     * Seria algo asi
     * Inicio dato separador dato separador dato fin
     * inicio dato = ? , dato = ? , dato = ? 
     * @param inicio
     * @param fin
     * @param separador
     * @param identificador
     * @return 
     */
    public String generarStringIdentificador(String inicio, String fin, String separador, ArrayList<String> identificador){
        String aux = "";
        for(int i = 0; i < identificador.size(); i++){
            if(i == 0)
                aux += inicio;
            if((i + 1) == identificador.size()) //ultima iteracion
                aux += identificador.get(i) + fin;
            else
                aux += identificador.get(i) + separador;
        }
        return aux;
    }
    /**
     * Se genera un string de forma
     * inicio+ datos enviados separadas por el simbolo (separador) + fin
     * este  solo indica la cantidad de valores
     * @param inicio
     * @param fin
     * @param separador
     * @param identificador
     * @return 
     */
    public String generarStringIdentificador(String inicio, String fin, String separador, int cantidadIdentificador){
        String aux = "";
        for(int i = 0; i < cantidadIdentificador; i++){
            if(i == 0)
                aux += inicio;
            if((i + 1) == cantidadIdentificador) //ultima iteracion
                aux += "?" + fin;
            else
                aux += "?" + separador;
        }
        return aux;
    }
}
