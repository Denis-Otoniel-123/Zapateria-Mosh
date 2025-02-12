/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.marca;
import UTIL.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *

 */
public class marcaDAO {
     ConexionBD cn=new ConexionBD();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    marca c=new marca();
    
    
    public List Listado() {
     
        ArrayList<marca> list=new ArrayList<>();
        String sql="SELECT * FROM marca ORDER BY id DESC";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                marca cat=new marca();
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
     
        ArrayList<marca> list=new ArrayList<>();
        String sql="select * from marca where estado='Activo'";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                marca cat=new marca();
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
            String sql="select estado from marca where id="+cod;
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
       
        
     
   
           
     
    public static String getmarca(int cod) {
     
         
        try {
            String sql="select nombre from marca where id="+cod;
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
 public static String getmarcaEstado(int cod) {
     
         
        try {
            String sql="select estado from marca where id="+cod;
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
    public marca list(int id) {
      
        String sql="select * from marca where id="+id;
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

    public boolean add(marca cat) {
    
      String sql="insert into marca(nombre,estado)values('"+cat.getNombre()+"','"+cat.getEstado()+"')";
         
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            
        } catch (Exception e) {
        }
 
       
       return false;
    }

    public boolean Edit(marca cat) {
      String sql="update marca set nombre='"+cat.getNombre()+"'where id="+cat.getId();
        
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
      public boolean Estado(marca cat,int id) {
      String sql="update marca set estado='"+cat.getEstado()+"'where id="+id;
        
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }


    public boolean Eliminar(int id) {
     String sql="delete from marca where id="+id; 
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }
   
  
}
