/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaz;

import Bean.Cliente;
import java.util.List;

/**
 *
 * @author HP
 */
public interface CRUDCliente {
     public List Listado();
    public Cliente list(int id);
    public boolean add(Cliente cli);
    public boolean Edit(Cliente cli);
    public boolean Eliminar(int id); 
}
