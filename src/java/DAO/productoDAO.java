
package DAO;


import Bean.producto;
import Interfaz.CRUDProducto;
import UTIL.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class productoDAO implements CRUDProducto{
                ConexionBD cn=new ConexionBD();
               Connection con;
               PreparedStatement ps;
               ResultSet rs;
               producto p=new producto();

               
  public static String getProducto(int cod) {
     
         
        try {
            String sql="select nombre from producto where id="+cod;
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
 
      public List ListadoStockMinimo() {
         ArrayList<producto> list=new ArrayList<>();
        String sql="select * from producto where stock<10 AND estado='activo'";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                producto prod=new producto();
                prod.setNombre(rs.getString("nombre"));
                prod.setStock(rs.getInt("stock"));
             
            
                list.add(prod);
            }
        } catch (Exception e) {
            
        }
        return list;
    }
      
        public List ListadoStockmaximoyActivo() {
         ArrayList<producto> list=new ArrayList<>();
        String sql="select * from producto where stock>10 AND estado='activo'";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                producto prod=new producto();
                  prod.setId(rs.getInt("id"));
                 prod.setIdcategoria(rs.getInt("idcategoria"));
                 prod.setIdmarca(rs.getInt("idmarca"));
                  prod.setIddiseño(rs.getInt("iddiseño"));
                prod.setNombre(rs.getString("nombre"));
                prod.setPrecio_venta(rs.getDouble("precio_venta"));
                prod.setStock(rs.getInt("stock"));
                prod.setDescripcion(rs.getString("descripcion"));
                 prod.setEstado(rs.getString("estado"));
                   prod.settalla(rs.getString("talla"));
             
            
                list.add(prod);
            }
        } catch (Exception e) {
            
        }
        return list;
    } 
      
    @Override
    public List Listado() {
         ArrayList<producto> list=new ArrayList<>();
        String sql="select * from producto ORDER BY id desc ";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                producto prod=new producto();
                prod.setId(rs.getInt("id"));
                prod.setIdcategoria(rs.getInt("idcategoria"));
                     prod.settalla(rs.getString("talla"));
                 prod.setIdmarca(rs.getInt("idmarca"));
                  prod.setIddiseño(rs.getInt("iddiseño"));
                prod.setNombre(rs.getString("nombre"));
                prod.setPrecio_venta(rs.getDouble("precio_venta"));
                prod.setStock(rs.getInt("stock"));
                prod.setDescripcion(rs.getString("descripcion"));
                 prod.setEstado(rs.getString("estado"));
             
            
                list.add(prod);
            }
   
        } catch (Exception e) {
            
        }
        return list;
    }
     public List ListadoEstadoActivo() {
         ArrayList<producto> list=new ArrayList<>();
        String sql="select * from producto where estado='Activo'";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                producto prod=new producto();
                prod.setId(rs.getInt("id"));
                prod.setNombre(rs.getString("nombre"));
                list.add(prod);
            }
   
        } catch (Exception e) {
            
        }
        return list;
    }

    @Override
    public producto list(int id) {
    
        String sql="select * from producto where id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
          
                p.setId(rs.getInt("id"));
                p.setIdcategoria(rs.getInt("idcategoria"));
                        p.settalla(rs.getString("talla"));
                p.setIdmarca(rs.getInt("idmarca"));
                p.setIddiseño(rs.getInt("iddiseño"));
                p.setNombre(rs.getString("nombre"));
                p.setPrecio_venta(rs.getDouble("precio_venta"));
                p.setStock(rs.getInt("stock"));
                p.setDescripcion(rs.getString("descripcion"));
            
            }
            
        } catch (Exception e) {
            
        }
        return p;
    }

    @Override
    public boolean add(producto prod) {
    String sql = "INSERT INTO producto(idcategoria, idmarca, iddiseño, nombre, precio_venta, stock, talla, descripcion, estado) "
               + "VALUES ('" + prod.getIdcategoria() + "', '" + prod.getIdmarca() + "', '" + prod.getIddiseño() + "', '" + prod.getNombre() + "', '" + prod.getPrecio_venta() + "', '" + prod.getStock() + "', '" + prod.gettalla() + "', '" + prod.getDescripcion() + "', '" + prod.getEstado() + "')";
    
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.executeUpdate();
        return true; // Si se ejecuta correctamente, devuelve true
    } catch (Exception e) {
        e.printStackTrace(); // Imprime el error en caso de que ocurra
    }
    
    return false; // Si falla, devuelve false
}


    @Override
    public boolean Edit(producto prod) {
      String sql="update producto set idcategoria='"+prod.getIdcategoria()+"',idmarca='"+prod.getIdmarca()+"',iddiseño='"+prod.getIddiseño()+"',talla='"+prod.gettalla()+"',nombre='"+prod.getNombre()+"',precio_venta='"+prod.getPrecio_venta()+"',stock='"+prod.getStock()+"',descripcion='"+prod.getDescripcion()+"' where id="+prod.getId();
          try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public boolean editEstado(producto prod,int id) {
      String sql="update producto set estado='"+prod.getEstado()+"' where id="+id;
          try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
     public static String estado(int cod) {
     
         
        try {
            String sql="select estado from producto where id="+cod;
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
    public boolean Eliminar(int id) {
         String sql="delete from producto where id="+id; 
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }
    
}
