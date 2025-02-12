/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *

 */
public class empleado {
   int id;
   String nombre;
    String dni;
    double sueldo;
     String telefono;
      String direccion;
       String email;

    public empleado() {
    }

    public empleado(int id, String nombre, String dni, double sueldo, String telefono, String direccion, String email) {
        this.id = id;
        this.nombre = nombre;
        this.dni = dni;
        this.sueldo = sueldo;
        this.telefono = telefono;
        this.direccion = direccion;
        this.email = email;
    }

    public empleado(String nombre, String dni, double sueldo, String telefono, String direccion, String email) {
        this.nombre = nombre;
        this.dni = dni;
        this.sueldo = sueldo;
        this.telefono = telefono;
        this.direccion = direccion;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
       
       
}
