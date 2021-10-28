/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package funciones;

import encriptador.Encriptar;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;

/**
 * Clase especializada a generar un listado de datos en forma
 * de arrayList, a partir de request donde los items se reconoceran
 * gracias a un listado de identificadores, donde
 * el item 0 sera el nombre de la tabla a usar y los demas sus aatributos, 
 * ejemplo rapido:
 * 
 * USUARIO,codigo,nombre,apellido,password
 * @author grifiun
 */
public class PrepareDataFromIdentificadores {
    ArrayList<String> identificadores;
    
    /**
     * Constructor, recibe como parametro el listado de identificadores
     * @param identificadores 
     */
    public PrepareDataFromIdentificadores(ArrayList<String> identificadores){
        this.identificadores = identificadores;    
    }
    
    /**
     * Retorna un ArrayList con los datos obtenidos de la request y los identificadores
     * @return 
     */
    public ArrayList<String> getDataFromIdentificadores(HttpServletRequest request){       
        ArrayList<String> datos = new ArrayList();
        GetAttributeParameterRequest getAttributeParameterRequest = new GetAttributeParameterRequest(request);
        
        //obtenemos los datos, comenzamos el ciclo desde 1 porque el 0 es el nombre de la tabla
        for(int i = 1; i < identificadores.size(); i++){
            //CODIGOS, estos codigos se generan de forma automatica
            if(identificadores.get(i).equals("codigo_consideracion") ||
                    identificadores.get(i).equals("codigo_siembra") ||
                    identificadores.get(i).equals("codigo_publicacion") ||
                    identificadores.get(i).equals("codigo_comentario") ||
                    identificadores.get(i).equals("codigo_like") ||
                    identificadores.get(i).equals("codigo_telefono") ||
                    identificadores.get(i).equals("codigo_correo") ||
                    identificadores.get(i).equals("codigo_agenda")                    
                    /*&& request.getSession().getAttribute("codigoAleatorio").equals("activado")*/){
                //Creamos el codigo si esta activado la generacion de codigo aleatorio
                GenerarCodigoAleatorio genC = new GenerarCodigoAleatorio();
                String auxCod = genC.generarCodAleatorio(identificadores.get(0), identificadores.get(0).substring(0, 3), 1000, 9999);
                datos.add(auxCod);                
            }           
            ////PASSWORDS
            else if(identificadores.get(i).equals("password")){   
                //encriptamos
                Encriptar encrpt = new Encriptar();
                String auxPass = getAttributeParameterRequest.getAttributOrParameter(identificadores.get(i));
                String auxEn = encrpt.getEncriptPass(auxPass);//encriptamos
                datos.add(auxEn);                
            }
            //FECHAS
            else if(identificadores.get(i).equals("fecha") /*&&
                    request.getSession().getAttribute("fechaSistema").equals("activado")*/){
                //Si son fechas y la fecha del sistema esta activado
                //Agregamos la fecha del sistema  
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                String fechaAuxiliar = df.format(new Date());
                
                //datos.add((String)request.getSession().getAttribute("fecha_sistema"));     
                datos.add(fechaAuxiliar);
            }
            //DATOS NORMALES
            else{//si es un dato ordinario (a recibir del request)
                 //datos.add(request.getParameter(identificadores.get(i)));
                 datos.add(getAttributeParameterRequest.getAttributOrParameter(identificadores.get(i)));
            }
        }
        
        return datos;
    }
    
}