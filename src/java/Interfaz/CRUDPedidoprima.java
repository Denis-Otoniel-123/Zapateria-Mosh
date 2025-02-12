/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaz;

import Bean.pedidoprima;
import java.util.List;

/**
 *
 * @author Angel Albinagorta
 */
public interface CRUDPedidoprima {
      public List Listado();
    public pedidoprima list(int id);
    public boolean add(pedidoprima ped);
    public boolean Edit(pedidoprima ped);
    public boolean Eliminar(int id);
}
