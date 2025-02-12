/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.proveedor;
import UTIL.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *

 */
public class proveedorDAO {
     ConexionBD cn=new ConexionBD();
               Connection con;
               PreparedStatement ps;
               ResultSet rs;
               proveedor p=new proveedor();
    

    public proveedor list(int id) {
        String sql="select * from proveedor where idpersona="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                
               p.setId(rs.getInt("idpersona"));
                p.setContato(rs.getString("contacto"));
                p.setTelefono_contacto(rs.getString("telefono_contacto"));
              
            }
   
        } catch (Exception e) {
            
        }
        return p;
    
    }

    public boolean add(proveedor cli) {
    String sql="{CALL insertproveedor('"+cli.getNombre()+"','"+cli.getTipo_documento()+"','"+cli.getNum_documento()+"','"+cli.getDireccion()+"','"+cli.getTelefono()+"','"+cli.getEmail()+"','"+cli.getContato()+"','"+cli.getTelefono_contacto()+"')}";
       
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            
        }catch (Exception e) {
        }
 
       
       return false;
    }

    public boolean Edit(proveedor cli) {
        String sql="update proveedor set contacto='"+cli.getContato()+"',telefono_contacto='"+cli.getTelefono_contacto()+"' where idpersona="+cli.getId();
          try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

 public List listado() {
     ArrayList<proveedor> lista=new ArrayList<>();
     String sql="SELECT * FROM proveedor ORDER BY idpersona DESC";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                proveedor pro=new proveedor();
               pro.setId(rs.getInt("idpersona"));
                pro.setContato(rs.getString("contacto"));
                pro.setTelefono_contacto(rs.getString("telefono_contacto"));
              lista.add(pro);
            }
   
        } catch (Exception e) {
            
        }
        return lista;
    
    }
 
  public boolean Eliminar(int id) {
      String sql="delete from proveedor where idpersona="+id; 
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
     return false;
    }
    
}
