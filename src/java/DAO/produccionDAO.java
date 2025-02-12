

package DAO;

import Bean.produccion;
import Interfaz.CRUDProduccion;
import UTIL.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *

 */
public class produccionDAO implements CRUDProduccion{
      ConexionBD cn=new ConexionBD();
               Connection con;
               PreparedStatement ps;
               ResultSet rs;
           
               produccion p=new produccion();
    
    @Override
    public List Listado() {
        ArrayList<produccion> list=new ArrayList<>();
        String sql="SELECT * FROM detalle_ingreso_produccion ORDER BY fecha DESC";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                produccion prod=new produccion();
                prod.setId(rs.getInt("id"));
                prod.setIdproducto(rs.getInt("idproducto"));
                prod.setCantidad(rs.getInt("cantidad"));
              prod.setFecha(rs.getString("fecha"));
               prod.setEstado(rs.getString("estado"));
            
                list.add(prod);
            }
   
        } catch (Exception e) {
            
        }
        return list;
    }
   
     public static String getProduccionEstado(int cod) {
     
         
        try {
            String sql="select estado from detalle_ingreso_produccion where id="+cod;
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
    public boolean add(produccion pro) {
      
        String sql="insert into detalle_ingreso_produccion(idproducto,cantidad,fecha,estado)"
               + "values('"+pro.getIdproducto()+"','"+pro.getCantidad()+"','"+pro.getFecha()+"','"+pro.getEstado()+"')";
       
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            
        } catch (Exception e) {
        }
 
       
       return false;
    }

   @Override
    public produccion list(int id) {
        String sql="select * from detalle_ingreso_produccion where id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
          
                p.setId(rs.getInt("id"));
                p.setIdproducto(rs.getInt("idproducto"));
                p.setCantidad(rs.getInt("cantidad"));
              p.setFecha(rs.getString("fecha"));
            
            }
            
        } catch (Exception e) {
            
        }
        return p;
    }

   
    @Override
    public boolean Edit(produccion ped) {
      String sql="update detalle_ingreso_produccion set idproducto='"+ped.getIdproducto()+"',cantidad='"+ped.getCantidad()+"',fecha='"+ped.getFecha()+"' where id="+ped.getId();
          try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
     public boolean Editestado(produccion ped,int id) {
      String sql="update detalle_ingreso_produccion set estado='"+ped.getEstado()+"' where id="+id;
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
         String sql="delete from detalle_ingreso_produccion where id="+id; 
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    } 
    

   
    
}
