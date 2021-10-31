/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package funciones;

import conection_db.Consultar;
import entidades.Dia;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author grifiun
 */
public class ObtenerMes {
    HttpServletRequest request;
    
    public ObtenerMes(HttpServletRequest request){
        this.request = request;
    }    
    
    public List<ArrayList<Dia>> obtener(){           
        String codigo_usuario = (String) request.getSession().getAttribute("codigo_usuario");
        String numeroMes = (String) request.getParameter("mes");
        if(numeroMes == null || numeroMes.equals("") || numeroMes.length() == 0){//no hay parametro, usamos el mes actual
            Calendar cal = Calendar.getInstance();
	    String mes = new SimpleDateFormat("MM").format(cal.getTime());//Obtenemos la numeracion del mes actual
            numeroMes = mes;//asignamos a nuestra variable de numeroMes
        }
        
        //Obtenemos la tabla realizando una consulta con la funcion
        List<ArrayList<String>> tablaMesString = obtenerTablaStringMes(codigo_usuario, numeroMes);
                               
        List<ArrayList<Dia>> tablaMes = new ArrayList();  
        int contadorDia = 0;
        for(int i = 1; i <= 6; i++){//Semanas
            ArrayList<Dia> diasSemanaIAux = new ArrayList();//Listado de dias en una semana         
            for(int j = 1; j <= 7; j++){//Dias                
                if(tablaMesString.size() - contadorDia <= 0)//ya no hay registros en la tabla de dias del mes analizado (la tabla general de String)
                    diasSemanaIAux.add(null);//si ya no hay datos agregamos null al listado
                else{//si hay datos
                    //Datos de la tabla
                    //NumeroDia (0), Fase visible porcentual (1), numeroDiaSemana (2), numero de actividades en ese dia (3)    
                    //Obtenemos numero de la semana del dia ContadorDia   
                    int contadorDiaSemana = Integer.parseInt(tablaMesString.get(contadorDia).get(2));//esta en la posicion 2 el numero de la semana

                    if(contadorDiaSemana == j){//Si el numero de dia de la semana concuerda con el valor de j, entonces agregamos un nuevo dia a la tabla
                        //Datos de la tabla
                        //NumeroDia (0), Fase visible porcentual (1), numeroDiaSemana (2), numero de actividades en ese dia (3)
                        String numeroDia = tablaMesString.get(contadorDia).get(0);
                        String faseVisible = tablaMesString.get(contadorDia).get(1);
                        String numeroActividades = tablaMesString.get(contadorDia).get(3);

                        Dia diaAuxiliar = new Dia();                    

                        diaAuxiliar.setNumeroDia(numeroDia);
                        diaAuxiliar.setPorcentajeFase(faseVisible);
                        diaAuxiliar.setNumeroActividades(numeroActividades);

                        diasSemanaIAux.add(diaAuxiliar);//agregamos el dia generado al listado de dias semanal

                        contadorDia++;//cargamos el siguiente registro de dia
                    }else{//si el dia de la fecha obtenida no concuerda con el numero del dia de la semana de j, agregamos null
                        diasSemanaIAux.add(null);
                    }
                }    
            }
            //Una vez agregamos los dias a una semana, agregamos la semana al mes
            tablaMes.add(diasSemanaIAux);
            
            if(tablaMesString.size() - contadorDia <= 0)//Si ya no hay datos terminamos el segundo ciclo
                break;
        }
                
        //solo declaracion del metodo
        return tablaMes;
    }
    
    /**
     * Funcion que reteorna una tabla (String) del numero de dia, fase visible, dia de la semana y cantidad de actividades
     * de la agenda de actividades del usuario CODIGO_USUARIO en el mes de NUMEROMES
     * @param codigo_usuario
     * @param numeroMes
     * @return 
     */
    public List<ArrayList<String>> obtenerTablaStringMes(String codigo_usuario, String numeroMes){
        Consultar consultarDB = new Consultar();
        
        String query =  "SELECT \n" +
                        "	EXTRACT(DAY FROM fecha) as fec, \n" +
                        "	fase, \n" +
                        "	dia,\n" +
                        "	IFNULL(B.cantidad_actividad,0) as actividades\n" +
                        "	FROM DIA \n" +
                        "		LEFT JOIN\n" +
                        "		(\n" +
                        "			SELECT codigo_fecha, 				\n" +
                        "				COUNT(codigo_fecha)				\n" +
                        "				as cantidad_actividad\n" +
                        "			FROM AGENDA \n" +
                        "			WHERE codigo_usuario = ?\n" +
                        "			GROUP BY codigo_fecha\n" +
                        "		) as B	\n" +
                        "		ON DIA.fecha = B.codigo_fecha\n" +
                        "	WHERE (EXTRACT(MONTH FROM fecha) = ?) \n" +
                        "	ORDER BY fec ASC\n" +
                        "	;";
        
        //DATOS, codigo_usuario y numero_mes
        ArrayList<String> datosDelWhere = new ArrayList();
        datosDelWhere.add(codigo_usuario);
        datosDelWhere.add(numeroMes);
        
        List<ArrayList<String>> tablaDiasMes = consultarDB.obtenerRegistros(query, datosDelWhere);
        
        return tablaDiasMes;
    }
}
