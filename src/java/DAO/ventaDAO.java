/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.detalle_venta;
import Bean.venta;
import UTIL.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *

 */
public class ventaDAO {
    ConexionBD cn=new ConexionBD();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    venta v=new venta();

public boolean insertarventa(venta v){
    String sql="{CALL venta_insertar('"+v.getIdcliente()+"','"+v.getTipo_comprobante()+"','"+v.getRuc()+"','"+v.getNum_comprobante()+"','"+v.getFecha_hora()+"','"+v.getTotal()+"','"+v.getEstado()+"')}";
    try {
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
    } catch (SQLException e) {
    }
    return false;
}


public boolean insertarventadetalle(detalle_venta dv){
    String sql="{CALL venta_detalle('"+dv.getIdproducto()+"','"+dv.getCantidad()+"','"+dv.getPrecio()+"','"+dv.getDescuento()+"','"+dv.getSubtotal()+"','"+dv.getEstado()+"')}";

    try {
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
    } catch (SQLException e) {
    }
    return false;
}



public boolean editartotal(venta v){
    String sql=" update venta set total='"+v.getTotal()+"' where id="+v.getId();
    try {
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
    } catch (SQLException e) {
    }
    return false;

    }
public boolean editarEstado(venta v,int id){
    String sql=" update venta set estado='"+v.getEstado()+"' where id="+id;
    try {
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
    } catch (SQLException e) {
    }
    return false;

    }
public boolean editaranulardetalle(detalle_venta v,int id){
    String sql=" update detalle_venta set estado='"+v.getEstado()+"' where id="+id;
    try {
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
    } catch (SQLException e) {
    }
    return false;

    }

public boolean editarestadodetalle_venta(detalle_venta v,int id){
    String sql=" update detalle_venta set estado='"+v.getEstado()+"' where idventa="+id;
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
            String sql="select estado from venta where id="+cod;
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
         ArrayList<detalle_venta> list=new ArrayList<>();
        String sql="SELECT * FROM detalle_venta WHERE idventa=(SELECT MAX(id) from venta)";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                detalle_venta detalle_venta=new detalle_venta();
                detalle_venta.setId(rs.getInt("id"));
                detalle_venta.setIdventa(rs.getInt("idventa"));
                detalle_venta.setIdproducto(rs.getInt("idproducto"));
                detalle_venta.setCantidad(rs.getInt("cantidad"));
                 detalle_venta.setPrecio(rs.getDouble("precio"));
                  detalle_venta.setDescuento(rs.getDouble("descuento"));
                detalle_venta.setSubtotal(rs.getDouble("subtotal"));
                   detalle_venta.setEstado(rs.getString("estado"));
                list.add(detalle_venta);
            }
   
        } catch (Exception e) {
            
        }
        return list;
    }
    
     public List ticketDetalle(int id) {
         ArrayList<detalle_venta> list=new ArrayList<>();
        String sql="SELECT * FROM detalle_venta WHERE idventa="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                detalle_venta detalle_venta=new detalle_venta();
                detalle_venta.setId(rs.getInt("id"));
                detalle_venta.setIdventa(rs.getInt("idventa"));
                detalle_venta.setIdproducto(rs.getInt("idproducto"));
                detalle_venta.setCantidad(rs.getInt("cantidad"));
                 detalle_venta.setPrecio(rs.getDouble("precio"));
                  detalle_venta.setDescuento(rs.getDouble("descuento"));
                detalle_venta.setSubtotal(rs.getDouble("subtotal"));
                list.add(detalle_venta);
            }
   
        } catch (Exception e) {
            
        }
        return list;
    }
    
    public List ListadoVenta() {
         ArrayList<venta> list=new ArrayList<>();
        String sql="SELECT * FROM venta ORDER BY id desc";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                venta venta=new venta();
                venta.setId(rs.getInt("id"));
                venta.setIdcliente(rs.getInt("idcliente"));
                venta.setTipo_comprobante(rs.getString("tipo_comprobante"));
                venta.setRuc(rs.getString("ruc"));
                 venta.setNum_comprobante(rs.getString("num_comprobante"));
                  venta.setFecha_hora(rs.getString("fecha_hora"));
                  venta.setTotal(rs.getDouble("total"));
                venta.setEstado(rs.getString("estado"));
                list.add(venta);
            }
        } catch (Exception e) {
            
        }
        return list;
    }
    
    
      public venta Reporte(int id) {
        String sql="select *from venta where id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                
                v.setId(rs.getInt("id"));
                v.setIdcliente(rs.getInt("idcliente"));
                v.setTipo_comprobante(rs.getString("tipo_comprobante"));
                v.setRuc(rs.getString("ruc"));
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
         String sql="delete from detalle_venta where id="+id; 
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }
      
      
      
public int BuscarNfacturas (){
        String sSQL ="SELECT COUNT(*) as Nfactura FROM venta WHERE tipo_comprobante ='Factura'";
        
        try {
            int Nfactura =0;
            con=cn.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sSQL);
          while (rs.next()) {
            Nfactura = rs.getInt("Nfactura");
            }
         
          return Nfactura;
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return 0;
        }
         
    }
    
public int BuscarNBoleta (){
        String sql ="SELECT COUNT(*) as Nboleta FROM venta WHERE tipo_comprobante ='Boleta'";
        
        try {
            int Nfactura =0;
            con=cn.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
          while (rs.next()) {
            Nfactura = rs.getInt("Nboleta");
            }
         
          return Nfactura;
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return 0;
        }
         
    }

public int usu (String usu,String pass){
        String sql ="SELECT id FROM usuario WHERE usu ='"+usu+"' AND password='"+pass+"'";
        
        try {
            int Nfactura =0;
            con=cn.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
          while (rs.next()) {
            Nfactura = rs.getInt("id");
            }
         
          return Nfactura;
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return 0;
        }
         
    }
    public static void main(String[] args) {
         DecimalFormat formateador = new DecimalFormat("000000");
        ventaDAO funcion = new ventaDAO();
        int Nfactura = funcion.BuscarNfacturas();
           int Nboleta = funcion.BuscarNBoleta();
        Nfactura = Nfactura + 1;
        Nboleta = Nboleta + 1;
        String format = formateador.format(Nfactura);
         String formatbol = formateador.format(Nboleta);
        System.out.println("Factura"+(format));
         System.out.println("Boleta"+(formatbol));
        
        String usu="almacen";
        String pass="almacen";
      int id = funcion.usu(usu, pass);
        System.out.println("id es : "+id);
    }
}



