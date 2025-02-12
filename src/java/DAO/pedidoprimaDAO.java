/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.pedidoprima;
import Interfaz.CRUDPedidoprima;
import UTIL.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *

 */
public class pedidoprimaDAO implements CRUDPedidoprima{
       ConexionBD cn=new ConexionBD();
               Connection con;
               PreparedStatement ps;
               ResultSet rs;
               pedidoprima p=new pedidoprima();

    
      @Override
    public List Listado() {
        ArrayList<pedidoprima> list=new ArrayList<>();
        String sql="select * from pedidoprima ORDER BY id DESC";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                pedidoprima prod=new pedidoprima();
                prod.setId(rs.getInt("id"));
                prod.setIdprima(rs.getInt("idprima"));
                prod.setCantidad(rs.getInt("cantidad"));
              prod.setFecha(rs.getString("fecha"));
               prod.setDescripcion(rs.getString("descripcion"));
                 prod.setEstado(rs.getString("estado"));
                list.add(prod);
            }
   
        } catch (Exception e) {
            
        }
        return list;
    }
   
 public static String getestadopedido(int cod) {
     
         
        try {
            String sql="select nombre from pedidoprima where id="+cod;
            Connection connection=ConexionBD.Conectar();
            PreparedStatement prepare=connection.prepareStatement(sql);
            ResultSet resultSet=prepare.executeQuery();
          if(resultSet.next()) {
            return resultSet.getString("nombre");
            
            }
          return "--";
            
        } catch (Exception e) {
            return "--";
        }
    }
    @Override
    public boolean add(pedidoprima ped) {
      
        String sql="insert into pedidoprima(idprima,cantidad,fecha,descripcion,estado)"
               + "values('"+ped.getIdprima()+"','"+ped.getCantidad()+"','"+ped.getFecha()+"','"+ped.getDescripcion()+"','"+ped.getEstado()+"')";
       
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            
        } catch (Exception e) {
        }
 
       
       return false;
    }

    @Override
    public pedidoprima list(int id) {
        String sql="select * from pedidoprima where id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
          
                 p.setId(rs.getInt("id"));
                p.setIdprima(rs.getInt("idprima"));
                p.setCantidad(rs.getInt("cantidad"));
              p.setFecha(rs.getString("fecha"));
               p.setDescripcion(rs.getString("descripcion"));
            
            }
            
        } catch (Exception e) {
            
        }
        return p;
    }

   
    @Override
    public boolean Edit(pedidoprima ped) {
      String sql="update pedidoprima set idprima='"+ped.getIdprima()+"',cantidad='"+ped.getCantidad()+"',fecha='"+ped.getFecha()+"',descripcion='"+ped.getDescripcion()+"' where id="+ped.getId();
          try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean EditEstadoPedido(pedidoprima ped,int id) {
      String sql="update pedidoprima set estado='"+ped.getEstado()+"' where id="+id;
          try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean Eliminar(int id) {
         String sql="delete from pedidoprima where id="+id; 
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    } 
    
}
