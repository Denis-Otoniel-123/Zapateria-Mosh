
package Interfaz;

import Bean.categoria;
import java.util.List;


public interface CRUDCategoria {
    public List Listado();
    public categoria list(int id);
    public boolean add(categoria cat);
    public boolean Edit(categoria cat);
    public boolean Eliminar(int id);
}
