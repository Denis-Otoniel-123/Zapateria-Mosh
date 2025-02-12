/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.diseño;
import UTIL.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *

 */
public class diseñoDAO {
    
     ConexionBD cn=new ConexionBD();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    diseño c=new diseño();
    
    
    public List Listado() {
     
        ArrayList<diseño> list=new ArrayList<>();
        String sql="SELECT * FROM diseño ORDER BY id DESC";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                diseño cat=new diseño();
                cat.setId(rs.getInt("id"));
                cat.setNombre(rs.getString("nombre"));
                cat.setEstado(rs.getString("estado"));
                list.add(cat);
            }
            
        } catch (Exception e) {
            
        }
        return list;
    }
    
     public List ListadoEstadoActivos() {
     
        ArrayList<diseño> list=new ArrayList<>();
        String sql="select * from diseño where estado='Activo'";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                diseño cat=new diseño();
                cat.setId(rs.getInt("id"));
                cat.setNombre(rs.getString("nombre"));
                list.add(cat);
            }
            
        } catch (Exception e) {
            
        }
        return list;
    }
       public static String estado(int cod) {
     
         
        try {
            String sql="select estado from diseño where id="+cod;
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
     
    public static String getdiseño(int cod) {
     
         
        try {
            String sql="select nombre from diseño where id="+cod;
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
 public static String getdiseñoEstado(int cod) {
     
         
        try {
            String sql="select estado from diseño where id="+cod;
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
    public diseño list(int id) {
      
        String sql="select * from diseño where id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
          
                c.setId(rs.getInt("id"));
                c.setNombre(rs.getString("nombre"));
            
            }
            
        } catch (Exception e) {
            
        }
        return c;
    }

    public boolean add(diseño cat) {
    
      String sql="insert into diseño(nombre,estado)values('"+cat.getNombre()+"','"+cat.getEstado()+"')";
         
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            
        } catch (Exception e) {
        }
 
       
       return false;
    }

    public boolean Edit(diseño cat) {
      String sql="update diseño set nombre='"+cat.getNombre()+"'where id="+cat.getId();
        
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
      public boolean Estado(diseño cat,int id) {
      String sql="update diseño set estado='"+cat.getEstado()+"'where id="+id;
        
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }


    public boolean Eliminar(int id) {
     String sql="delete from diseño where id="+id; 
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }
   
}
