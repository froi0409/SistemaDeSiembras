/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

/**
 *
 * @author grifiun
 */
public class Dia {
    private int numeroDia;
    private int porcentajeFase;
    private int numeroActividades;

    public int getNumeroDia() {
        return numeroDia;
    }

    public void setNumeroDia(int numeroDia) {
        this.numeroDia = numeroDia;
    }
    
    public void setNumeroDia(String numeroDia) {
        this.numeroDia = Integer.parseInt(numeroDia);
    }

    public int getPorcentajeFase() {
        return porcentajeFase;
    }

    public void setPorcentajeFase(int porcentajeFase) {
        this.porcentajeFase = porcentajeFase;
    }
    
    public void setPorcentajeFase(String porcentajeFase) {
        this.porcentajeFase = Integer.parseInt(porcentajeFase);
    }

    public int getNumeroActividades() {
        return numeroActividades;
    }

    public void setNumeroActividades(int numeroActividades) {
        this.numeroActividades = numeroActividades;
    }
    
    public void setNumeroActividades(String numeroActividades) {
        this.numeroActividades = Integer.parseInt(numeroActividades);
    }
    
    
}
