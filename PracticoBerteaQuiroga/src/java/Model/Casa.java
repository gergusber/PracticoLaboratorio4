/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author German
 */
public class Casa {

    private int idCasa;
    private int cantPersonas;
    private int cantHabitaciones;
    private int cantBanios;
    private boolean patio;
    private boolean cochera;
    private float superficie;
    private int cantAutos;
    private int valoracion;
    private float precioPorDia;
    private String direccion;

    public Casa() {
        idCasa = 0;
        cantPersonas = 0;
        cantHabitaciones = 0;
        patio = false;
        cochera = false;
        superficie = 0;
        cantAutos = 0;
        valoracion = 0;
        precioPorDia = 0;
        direccion = "";
    }

    public int getCantBanios() {
        return cantBanios;
    }

    public void setCantBanios(int cantBanios) {
        this.cantBanios = cantBanios;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getIdCasa() {
        return idCasa;
    }

    public void setIdCasa(int idCasa) {
        this.idCasa = idCasa;
    }

    public int getCantPersonas() {
        return cantPersonas;
    }

    public void setCantPersonas(int cantPersonas) {
        this.cantPersonas = cantPersonas;
    }

    public int getCantHabitaciones() {
        return cantHabitaciones;
    }

    public void setCantHabitaciones(int cantHabitaciones) {
        this.cantHabitaciones = cantHabitaciones;
    }

    public boolean isPatio() {
        return patio;
    }

    public void setPatio(boolean patio) {
        this.patio = patio;
    }

    public boolean isCochera() {
        return cochera;
    }

    public void setCochera(boolean cochera) {
        this.cochera = cochera;
    }

    public float getSuperficie() {
        return superficie;
    }

    public void setSuperficie(float superficie) {
        this.superficie = superficie;
    }

    public int getCantAutos() {
        return cantAutos;
    }

    public void setCantAutos(int cantAutos) {
        this.cantAutos = cantAutos;
    }

    public int getValoracion() {
        return valoracion;
    }

    public void setValoracion(int valoracion) {
        this.valoracion = valoracion;
    }

    public float getPrecioPorDia() {
        return precioPorDia;
    }

    public void setPrecioPorDia(float precioPorDia) {
        this.precioPorDia = precioPorDia;
    }

    @Override
    public String toString() {
        return "Casa{" + "idCasa=" + idCasa + ", cantPersonas=" + cantPersonas + ", cantHabitaciones=" + cantHabitaciones + ", patio=" + patio + ", cochera=" + cochera + ", superficie=" + superficie + ", cantAutos=" + cantAutos + ", valoracion=" + valoracion + ", precioPorDia=" + precioPorDia + '}';
    }
}
