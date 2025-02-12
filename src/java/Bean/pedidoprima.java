/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *

 */
public class pedidoprima {
    int id;
    int idprima;
    int cantidad;
    String fecha;
    String descripcion;
    String estado;
    public pedidoprima() {
    }

    public pedidoprima(int id, int idprima, int cantidad, String fecha, String descripcion, String estado) {
        this.id = id;
        this.idprima = idprima;
        this.cantidad = cantidad;
        this.fecha = fecha;
        this.descripcion = descripcion;
        this.estado = estado;
    }

    public pedidoprima(int idprima, int cantidad, String fecha, String descripcion, String estado) {
        this.idprima = idprima;
        this.cantidad = cantidad;
        this.fecha = fecha;
        this.descripcion = descripcion;
        this.estado = estado;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdprima() {
        return idprima;
    }

    public void setIdprima(int idprima) {
        this.idprima = idprima;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
}
