/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaz;

import Bean.Prima;
import java.util.List;

/**
 *
 * @author Angel Albinagorta
 */
public interface CRUDPrima {
      public List Listado();
    public Prima list(int id);
    public boolean add(Prima pri);
    public boolean Edit(Prima pri);
    public boolean Eliminar(int id);
}
