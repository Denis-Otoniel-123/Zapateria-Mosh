/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *

 */
public class producto {

 int id;
   int idcategoria;
   int idmarca;
   int iddiseño;
    String nombre;
    double precio_venta;
   int stock;
     String descripcion;
     String estado;
   String talla;   
    public producto() {
    }

    public producto(int id,String talla, int idcategoria, int idmarca, int iddiseño, String nombre, double precio_venta, int stock, String descripcion, String estado) {
        this.id = id;
        this.idcategoria = idcategoria;
        this.idmarca = idmarca;
        this.iddiseño = iddiseño;
        this.nombre = nombre;
        this.precio_venta = precio_venta;
        this.stock = stock;
        this.descripcion = descripcion;
        this.estado = estado;
          this.talla = talla;
    }

    public producto(int idcategoria,String talla, int idmarca, int iddiseño, String nombre, double precio_venta, int stock, String descripcion, String estado) {
        this.idcategoria = idcategoria;
         this.talla = talla;
        this.idmarca = idmarca;
        this.iddiseño = iddiseño;
        this.nombre = nombre;
        this.precio_venta = precio_venta;
        this.stock = stock;
        this.descripcion = descripcion;
        this.estado = estado;
       
    }

    
    
    
    public int getIdmarca() {
        return idmarca;
    }
    
    public String gettalla() {
        return talla;
    }
public void settalla(String talla) {
        this.talla = talla;
    }
    
    public void setIdmarca(int idmarca) {
        this.idmarca = idmarca;
    }

    public int getIddiseño() {
        return iddiseño;
    }

    public void setIddiseño(int iddiseño) {
        this.iddiseño = iddiseño;
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

    public int getIdcategoria() {
        return idcategoria;
    }

    public void setIdcategoria(int idcategoria) {
        this.idcategoria = idcategoria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio_venta() {
        return precio_venta;
    }

    public void setPrecio_venta(double precio_venta) {
        this.precio_venta = precio_venta;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
   
    

 


  


}
