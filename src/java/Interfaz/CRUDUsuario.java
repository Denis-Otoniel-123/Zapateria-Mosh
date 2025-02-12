/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaz;

import Bean.usuario;
import java.util.List;



public interface CRUDUsuario {
     public List Listado();
    public usuario list(int id);
    public boolean add(usuario usu);
    public boolean Edit(usuario usu);
    public boolean Eliminar(int id);
}
