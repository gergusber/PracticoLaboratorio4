/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;

/**
 *
 * @author German
 */
public class Alquileres {
    private int idAlquiler;
    private int idCasa;
    private int idTemporada;
    private Date fechaDesde;
    private Date fechaHasta;
    private int cantidadDias;
    private float precioPorDia;
    private float precioReal;

    public Alquileres(int idAlquiler, int idCasa, int idTemporada, Date fechaDesde, Date fechaHasta, int cantidadDias, float precioPorDia, float precioReal) {
        this.idAlquiler = idAlquiler;
        this.idCasa = idCasa;
        this.idTemporada = idTemporada;
        this.fechaDesde = fechaDesde;
        this.fechaHasta = fechaHasta;
        this.cantidadDias = cantidadDias;
        this.precioPorDia = precioPorDia;
        this.precioReal = precioReal;
    }

    public int getIdAlquiler() {
        return idAlquiler;
    }

    public void setIdAlquiler(int idAlquiler) {
        this.idAlquiler = idAlquiler;
    }

    public int getIdCasa() {
        return idCasa;
    }

    public void setIdCasa(int idCasa) {
        this.idCasa = idCasa;
    }

    public int getIdTemporada() {
        return idTemporada;
    }

    public void setIdTemporada(int idTemporada) {
        this.idTemporada = idTemporada;
    }

    public Date getFechaDesde() {
        return fechaDesde;
    }

    public void setFechaDesde(Date fechaDesde) {
        this.fechaDesde = fechaDesde;
    }

    public Date getFechaHasta() {
        return fechaHasta;
    }

    public void setFechaHasta(Date fechaHasta) {
        this.fechaHasta = fechaHasta;
    }

    public int getCantidadDias() {
        return cantidadDias;
    }

    public void setCantidadDias(int cantidadDias) {
        this.cantidadDias = cantidadDias;
    }

    public float getPrecioPorDia() {
        return precioPorDia;
    }

    public void setPrecioPorDia(float precioPorDia) {
        this.precioPorDia = precioPorDia;
    }

    public float getPrecioReal() {
        return precioReal;
    }

    public void setPrecioReal(float precioReal) {
        this.precioReal = precioReal;
    }

    @Override
    public String toString() {
        return "Alquileres{" + "idAlquiler=" + idAlquiler + ", idCasa=" + idCasa + ", idTemporada=" + idTemporada + ", fechaDesde=" + fechaDesde + ", fechaHasta=" + fechaHasta + ", cantidadDias=" + cantidadDias + ", precioPorDia=" + precioPorDia + ", precioReal=" + precioReal + '}';
    }
        
}
