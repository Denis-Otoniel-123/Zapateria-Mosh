/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *

 */
public class detalle_compra {
      int id;
    int idcompra;
    int idprima;
    int cantidad;
       double precio;
    double descuento;
    double subtotal;
String estado;
String talla;
    public detalle_compra() {
    }

    public detalle_compra(int id, int idcompra, int idprima, String talla, int cantidad, double precio, double descuento, double subtotal, String estado) {
        this.id = id;
        this.idcompra = idcompra;
        this.idprima = idprima;
        this.cantidad = cantidad;
        this.precio = precio;
        this.descuento = descuento;
        this.subtotal = subtotal;
        this.estado = estado;
           this.talla = talla;
        
    }

    public detalle_compra(int idcompra, int idprima, int cantidad, double precio, double descuento, double subtotal, String estado,String talla) {
        this.idcompra = idcompra;
        this.idprima = idprima;
        this.cantidad = cantidad;
        this.precio = precio;
        this.descuento = descuento;
        this.subtotal = subtotal;
        this.estado = estado;
        this.talla = talla;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdcompra() {
        return idcompra;
    }

    public void setIdcompra(int idcompra) {
        this.idcompra = idcompra;
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

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public double getDescuento() {
        return descuento;
    }

    public void setDescuento(double descuento) {
        this.descuento = descuento;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    public String talla() {
        return talla;
    }
public void settalla(String talla) {
        this.talla = talla;
    }
}
