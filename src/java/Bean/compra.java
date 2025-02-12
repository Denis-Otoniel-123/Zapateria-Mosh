/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *

 */
public class compra {
     int id;
    int idproveedor;
    String tipo_comprobante;
    String serie_comprobante;
    String num_comprobante;
    String fecha_hora;
    double total;
     String estado;

    public compra() {
    }

    public compra(int id, int idproveedor, String tipo_comprobante, String serie_comprobante, String num_comprobante, String fecha_hora, double total, String estado) {
        this.id = id;
        this.idproveedor = idproveedor;
        this.tipo_comprobante = tipo_comprobante;
        this.serie_comprobante = serie_comprobante;
        this.num_comprobante = num_comprobante;
        this.fecha_hora = fecha_hora;
        this.total = total;
        this.estado = estado;
    }

    public compra(int idproveedor, String tipo_comprobante, String serie_comprobante, String num_comprobante, String fecha_hora, double total, String estado) {
        this.idproveedor = idproveedor;
        this.tipo_comprobante = tipo_comprobante;
        this.serie_comprobante = serie_comprobante;
        this.num_comprobante = num_comprobante;
        this.fecha_hora = fecha_hora;
        this.total = total;
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdproveedor() {
        return idproveedor;
    }

    public void setIdproveedor(int idproveedor) {
        this.idproveedor = idproveedor;
    }

    public String getTipo_comprobante() {
        return tipo_comprobante;
    }

    public void setTipo_comprobante(String tipo_comprobante) {
        this.tipo_comprobante = tipo_comprobante;
    }

    public String getSerie_comprobante() {
        return serie_comprobante;
    }

    public void setSerie_comprobante(String serie_comprobante) {
        this.serie_comprobante = serie_comprobante;
    }

    public String getNum_comprobante() {
        return num_comprobante;
    }

    public void setNum_comprobante(String num_comprobante) {
        this.num_comprobante = num_comprobante;
    }

    public String getFecha_hora() {
        return fecha_hora;
    }

    public void setFecha_hora(String fecha_hora) {
        this.fecha_hora = fecha_hora;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
     
     
}
