/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.compra;
import Bean.detalle_compra;
import Bean.detalle_venta;
import Bean.venta;
import UTIL.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 *
 */
public class compraDAO {
    ConexionBD cn=new ConexionBD();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    compra v=new compra();

public boolean insertarcompra(compra v){
    String sql="{CALL compra_insert('"+v.getIdproveedor()+"','"+v.getTipo_comprobante()+"','"+v.getSerie_comprobante()+"','"+v.getNum_comprobante()+"','"+v.getFecha_hora()+"','"+v.getTotal()+"','"+v.getEstado()+"')}";
    try {
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
    } catch (SQLException e) {
    }
    return false;
}


public boolean insertarcompra_detalle(detalle_compra dv){
    String sql="{CALL compra_detalle('"+dv.getIdprima()+"','"+dv.getCantidad()+"','"+dv.getPrecio()+"','"+dv.getDescuento()+"','"+dv.getSubtotal()+"','"+dv.getEstado()+"')}";

    try {
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
    } catch (SQLException e) {
    }
    return false;
}



public boolean editartotal(compra v){
    String sql=" update compra set total='"+v.getTotal()+"' where id="+v.getId();
    try {
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
    } catch (SQLException e) {
    }
    return false;

    }
public boolean editarEstado(compra v,int id){
    String sql=" update compra set estado='"+v.getEstado()+"' where id="+id;
    try {
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
    } catch (SQLException e) {
    }
    return false;

    }
public boolean editaranulardetalle(detalle_compra v,int id){
    String sql=" update detalle_compra set estado='"+v.getEstado()+"' where id="+id;
    try {
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
    } catch (SQLException e) {
    }
    return false;

    }

public boolean editarestadodetalle_compra(detalle_compra v,int id){
    String sql=" update detalle_compra set estado='"+v.getEstado()+"' where idcompra="+id;
    try {
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
    } catch (SQLException e) {
    }
    return false;

    }

    public static String estado(int cod) {
     
         
        try {
            String sql="select estado from compra where id="+cod;
            Connection connection=ConexionBD.Conectar();
            PreparedStatement prepare=connection.prepareStatement(sql);
            ResultSet resultSet=prepare.executeQuery();
          if(resultSet.next()) {
            return resultSet.getString("estado");
            
            }
          return "--";
            
        } catch (Exception e) {
            return "--";
        }
    }


    public List ListadoDetalle() {
         ArrayList<detalle_compra> list=new ArrayList<>();
        String sql="SELECT * FROM detalle_compra WHERE idcompra=(SELECT MAX(id) from compra)";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                detalle_compra detalle_compr=new detalle_compra();
                detalle_compr.setId(rs.getInt("id"));
                detalle_compr.setIdcompra(rs.getInt("idcompra"));
                detalle_compr.setIdprima(rs.getInt("idprima"));
                detalle_compr.setCantidad(rs.getInt("cantidad"));
                 detalle_compr.setPrecio(rs.getDouble("precio"));
                  detalle_compr.setDescuento(rs.getDouble("descuento"));
                detalle_compr.setSubtotal(rs.getDouble("subtotal"));
                   detalle_compr.setEstado(rs.getString("estado"));
                list.add(detalle_compr);
            }
   
        } catch (Exception e) {
            
        }
        return list;
    }
    
     public List ticketDetalle(int id) {
         ArrayList<detalle_compra> list=new ArrayList<>();
        String sql="SELECT * FROM detalle_compra WHERE idcompra="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                detalle_compra detalle_compr=new detalle_compra();
                detalle_compr.setId(rs.getInt("id"));
                detalle_compr.setIdcompra(rs.getInt("idcompra"));
                detalle_compr.setIdprima(rs.getInt("idprima"));
                detalle_compr.setCantidad(rs.getInt("cantidad"));
                 detalle_compr.setPrecio(rs.getDouble("precio"));
                  detalle_compr.setDescuento(rs.getDouble("descuento"));
                detalle_compr.setSubtotal(rs.getDouble("subtotal"));
                list.add(detalle_compr);
            }
   
        } catch (Exception e) {
            
        }
        return list;
    }
    
    public List Listadocompra() {
         ArrayList<compra> list=new ArrayList<>();
        String sql="SELECT * FROM compra ORDER BY id desc";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                compra compr=new compra();
                compr.setId(rs.getInt("id"));
                compr.setIdproveedor(rs.getInt("idproveedor"));
                compr.setTipo_comprobante(rs.getString("tipo_comprobante"));
                compr.setSerie_comprobante(rs.getString("serie_comprobante"));
                 compr.setNum_comprobante(rs.getString("num_comprobante"));
                  compr.setFecha_hora(rs.getString("fecha_hora"));
                  compr.setTotal(rs.getDouble("total"));
                compr.setEstado(rs.getString("estado"));
                list.add(compr);
            }
        } catch (Exception e) {
            
        }
        return list;
    }
    
    
      public compra Reporte(int id) {
        String sql="select *from compra where id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                
                v.setId(rs.getInt("id"));
                v.setIdproveedor(rs.getInt("idproveedor"));
                v.setTipo_comprobante(rs.getString("tipo_comprobante"));
                v.setSerie_comprobante(rs.getString("serie_comprobante"));
                 v.setNum_comprobante(rs.getString("num_comprobante"));
                  v.setFecha_hora(rs.getString("fecha_hora"));
                  v.setTotal(rs.getDouble("total"));
                v.setEstado(rs.getString("estado"));

            }
   
        } catch (Exception e) {
            
        }
        return v;
    
    }
    
      public boolean EliminarDetalle(int id) {
         String sql="delete from detalle_compra where id="+id; 
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    } 
}
