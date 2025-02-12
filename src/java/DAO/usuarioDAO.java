
package DAO;

import Bean.usuario;
import Interfaz.CRUDUsuario;
import UTIL.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class usuarioDAO implements CRUDUsuario{
     ConexionBD cn=new ConexionBD();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    usuario U=new usuario();
    
  
    @Override
    public List Listado() {
        ArrayList<usuario> list=new ArrayList<>();
        String sql="select * from usuario";

   try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {     
                
                usuario usu=new usuario();
                usu.setId(rs.getInt("id"));
                usu.setIdempleado(rs.getInt("idempleado"));
                usu.setUsu(rs.getString("usu"));
                usu.setPassword(rs.getString("password")); 
                usu.setRol(rs.getString("rol"));
                list.add(usu);
            }
        } catch (Exception e) {
            
        }
        return list;
    
    }

    @Override
    public usuario list(int id) {
      ArrayList<usuario> list=new ArrayList<>();
  String sql="select * from usuario where id="+id;
        
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) { 
                 
                U.setId(rs.getInt("id"));
                U.setIdempleado(rs.getInt("idempleado"));
                U.setUsu(rs.getString("usu"));
                U.setPassword(rs.getString("password")); 
                U.setRol(rs.getString("rol"));
                list.add(U);
            }
            
        } catch (Exception e) {
            
        }
        return U;
    }

    @Override
    public boolean add(usuario usu) {
      
        String sql="INSERT INTO usuario(idempleado,usu,password,rol)"
               + "VALUES('"+usu.getIdempleado()+"','"+usu.getUsu()+"','"+usu.getPassword()+"','"+usu.getRol()+"')";
       
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            
        }catch (Exception e) {
        }
 
       return false;
    }

    @Override
    public boolean Edit(usuario usu) {
          String sql="update usuario set idempleado='"+usu.getIdempleado()+"',usu='"+usu.getUsu()+"',password='"+usu.getPassword()+"',rol='"+usu.getRol()+"' where id="+usu.getId();
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
      String sql="delete from usuario where id="+id; 
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
     return false;
    }
       
}
