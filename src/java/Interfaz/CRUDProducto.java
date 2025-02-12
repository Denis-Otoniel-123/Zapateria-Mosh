
package Interfaz;

import Bean.producto;
import java.util.List;


public interface CRUDProducto {
    
     public List Listado();
    public producto list(int id);
    public boolean add(producto prod);
    public boolean Edit(producto prod);
    public boolean Eliminar(int id);
}
