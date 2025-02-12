
package DAO;

import Bean.categoria;
import Interfaz.CRUDCategoria;
import UTIL.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class categoriaDAO implements CRUDCategoria{
    ConexionBD cn=new ConexionBD();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    categoria c=new categoria();
    
    @Override
    public List Listado() {
     
        ArrayList<categoria> list=new ArrayList<>();
        String sql="select * from categoria";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                categoria cat=new categoria();
                cat.setCodigo(rs.getInt("id"));
                cat.setNombre(rs.getString("nombre"));
                cat.setEstado(rs.getString("estado"));
                list.add(cat);
            }
            
        } catch (Exception e) {
            
        }
        return list;
    }
    
     public List ListadoEstadoActivos() {
     
        ArrayList<categoria> list=new ArrayList<>();
        String sql="select * from categoria where estado='Activo'";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                categoria cat=new categoria();
                cat.setCodigo(rs.getInt("id"));
                cat.setNombre(rs.getString("nombre"));
                list.add(cat);
            }
            
        } catch (Exception e) {
            
        }
        return list;
    }
       public static String estado(int cod) {
     
         
        try {
            String sql="select estado from categoria where id="+cod;
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
     
    public static String getCategoria(int cod) {
        try {
            String sql="select nombre from categoria where id="+cod;
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
 public static String getCategoriaEstado(int cod) {
     
         
        try {
            String sql="select estado from categoria where id="+cod;
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
    public categoria list(int id) {
      
        String sql="select * from categoria where id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
          
                c.setCodigo(rs.getInt("id"));
                c.setNombre(rs.getString("nombre"));
            
            }
            
        } catch (Exception e) {
            
        }
        return c;
    }

    @Override
    public boolean add(categoria cat) {
    
      String sql="insert into categoria(nombre,estado)values('"+cat.getNombre()+"','"+cat.getEstado()+"')";
         
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            
        } catch (Exception e) {
        }
 
       
       return false;
    }

    @Override
    public boolean Edit(categoria cat) {
      String sql="update categoria set nombre='"+cat.getNombre()+"'where id="+cat.getCodigo();
        
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
      public boolean Estado(categoria cat,int id) {
      String sql="update categoria set estado='"+cat.getEstado()+"'where id="+id;
        
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
     String sql="delete from categoria where id="+id; 
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }
   
  
}
