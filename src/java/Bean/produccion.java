
package Bean;

import java.sql.Date;

/**
 *

 */
public class produccion {
    int id;
int idproducto;
int cantidad;
    String fecha;
    String estado;
    public produccion() {
    }

    public produccion(int id, int idproducto, int cantidad, String fecha, String estado) {
        this.id = id;
        this.idproducto = idproducto;
        this.cantidad = cantidad;
        this.fecha = fecha;
        this.estado = estado;
    }

    public produccion(int idproducto, int cantidad, String fecha, String estado) {
        this.idproducto = idproducto;
        this.cantidad = cantidad;
        this.fecha = fecha;
        this.estado = estado;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

   
    

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    
}
