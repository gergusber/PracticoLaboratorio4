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
public class Temporadas {
    private int idTemporada;
    private String descripcion;
    private float porcentaje;

    public Temporadas()
    {
        idTemporada=0;
        descripcion="";
        porcentaje=0;
    }
    public int getIdTemporada() {
        return idTemporada;
    }

    public void setIdTemporada(int idTemporada) {
        this.idTemporada = idTemporada;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public float getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(float porcentaje) {
        this.porcentaje = porcentaje;
    }

    @Override
    public String toString() {
        return "Temporadas{" + "idTemporada=" + idTemporada + ", descripcion=" + descripcion + ", porcentaje=" + porcentaje + '}';
    }
    

}
