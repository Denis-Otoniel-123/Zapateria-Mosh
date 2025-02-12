/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.Prima;
import Interfaz.CRUDPrima;
import UTIL.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *

 */
public class PrimaDAO implements CRUDPrima{
               ConexionBD cn=new ConexionBD();
               Connection con;
               PreparedStatement ps;
               ResultSet rs;
               Prima p=new Prima();

    
 
               
  public static String getPrima(int cod) {
     
        try {
            String sql="select nombre from prima where id="+cod;
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
    public static String getPrimaEstado(int cod) {
     
        try {
            String sql="select estado from prima where id="+cod;
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
                  
    @Override
    public List Listado() {
         ArrayList<Prima> list=new ArrayList<>();
        String sql="SELECT * FROM prima ORDER BY id DESC";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                Prima pri=new Prima();
                pri.setId(rs.getInt("id"));
                pri.setNombre(rs.getString("nombre"));
                pri.setPrecio(rs.getDouble("precio"));
                pri.setStock(rs.getInt("stock"));
                pri.setDescripcion(rs.getString("descripcion"));
                pri.setEstado(rs.getString("estado"));
            
                list.add(pri);
            }
   
        } catch (Exception e) {
            
        }
        return list;
    }
       public List ListadoPrimaActivo() {
         ArrayList<Prima> list=new ArrayList<>();
        String sql="SELECT * FROM prima WHERE estado='Activo'";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                Prima pri=new Prima();
                pri.setId(rs.getInt("id"));
                pri.setNombre(rs.getString("nombre"));
                pri.setPrecio(rs.getDouble("precio"));
                pri.setStock(rs.getInt("stock"));
                pri.setDescripcion(rs.getString("descripcion"));
                pri.setEstado(rs.getString("estado"));
            
                list.add(pri);
            }
   
        } catch (Exception e) {
            
        }
        return list;
    }
    
     public List ListadoEstockMin() {
         ArrayList<Prima> list=new ArrayList<>();
        String sql="select * from prima where stock<10 AND estado='Activo'";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                Prima pri=new Prima();
                pri.setNombre(rs.getString("nombre"));
                pri.setStock(rs.getInt("stock"));
            
                list.add(pri);
            }
   
        } catch (Exception e) {
            
        }
        return list;
    }

    @Override
    public Prima list(int id) {
     
        String sql="select * from prima where id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
          
                p.setId(rs.getInt("id"));
                p.setNombre(rs.getString("nombre"));
                p.setPrecio(rs.getDouble("precio"));
                p.setStock(rs.getInt("stock"));
                p.setDescripcion(rs.getString("descripcion"));
            
            }
            
        } catch (Exception e) {
            
        }
        return p;
    }

    @Override
    public boolean add(Prima pri) {
       String sql="insert into prima(nombre,precio,stock,descripcion,estado)"
               + "values('"+pri.getNombre()+"','"+pri.getPrecio()+"','"+pri.getStock()+"','"+pri.getDescripcion()+"','"+pri.getEstado()+"')";
       
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            
        } catch (Exception e) {
        }
 
       
       return false;
    }

    @Override
    public boolean Edit(Prima pri) {
      String sql="update prima set nombre='"+pri.getNombre()+"',precio='"+pri.getPrecio()+"',stock='"+pri.getStock()+"',descripcion='"+pri.getDescripcion()+"' where id="+pri.getId();
          try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public boolean EditEstado(Prima pri,int id) {
      String sql="update prima set estado='"+pri.getEstado()+"' where id="+id;
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
         String sql="delete from prima where id="+id; 
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }
      
    
}
