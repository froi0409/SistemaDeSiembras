/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package funciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Clase usada simplemente para obtener un dato de una request, buscando en parametros y atributos
 * @author grifiun
 */
public class GetAttributeParameterRequest {
    private HttpServletRequest request;
    //constructor
    public GetAttributeParameterRequest(HttpServletRequest request) {
        this.request = request;
    }

    public GetAttributeParameterRequest() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    //Se obtiene el dato ya sea con un get Attribute o un getParam
    // Obtiene el nombre del atributo y retorna el valor correspondiente
    
    public String getAttributOrParameter(String nombreAtributo){
        String aux = "";
        try{
            /*
            if(nombreAtributo.equalsIgnoreCase("credito")){
                System.out.println("Es credito");
                aux = (String) request.getAttribute(nombreAtributo);                
                if(aux == null){//usamos Attribute si Parameter no nos retorna nada
                    System.out.println("Valor: "+aux);
                aux = (String) request.getParameter(nombreAtributo);
                System.out.println("Valor: "+aux);
                }
            }else{*/
                aux = (String) request.getParameter(nombreAtributo);
                if(aux == null || aux.length() == 0)//usamos Attribute si Parameter no nos retorna nada
                    aux = (String) request.getAttribute(nombreAtributo);
                if(aux == null || aux.length() == 0)//usamos Attribute si Parameter no nos retorna nada
                    aux = (String) request.getSession().getAttribute(nombreAtributo);
                
                if(aux == null || aux.length() == 0 && nombreAtributo.equalsIgnoreCase("estado"))
                    aux = "activo";
            /*}*/
            
        }catch(Exception ex){
            System.out.println("Error al obtener el atributo: "+nombreAtributo);
        }
        return aux;
       
    }            
            
}
