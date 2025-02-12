/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaz;

import Bean.produccion;
import java.util.List;

/**
 *
 * @author Angel Albinagorta
 */
public interface CRUDProduccion {
    public List Listado();
    public boolean add(produccion pro); 
    
    public produccion list(int id);
    public boolean Edit(produccion pro);
    public boolean Eliminar(int id);
}
