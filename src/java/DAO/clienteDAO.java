
package DAO;

import Bean.Cliente;
import Interfaz.CRUDCliente;
import UTIL.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class clienteDAO implements CRUDCliente{
         ConexionBD cn=new ConexionBD();
               Connection con;
               PreparedStatement ps;
               ResultSet rs;
               Cliente p=new Cliente();
               
              
               
      public static String getcliente(int cod) {
     
         
        try {
            String sql="select nombre from persona where id="+cod;
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
        public static String getDNI(int cod) {
     try {
       String sql="select num_documento from persona where id="+cod;
       Connection connection=ConexionBD.Conectar();
       PreparedStatement prepare=connection.prepareStatement(sql);
       ResultSet resultSet=prepare.executeQuery();
     if(resultSet.next()) {
       return resultSet.getString("num_documento");

       }
     return "--";

     } catch (Exception e) {
       return "--";
     }
   }     
    
    public static String getDireccion(int cod) {
     try {
       String sql="select direccion from persona where id="+cod;
       Connection connection=ConexionBD.Conectar();
       PreparedStatement prepare=connection.prepareStatement(sql);
       ResultSet resultSet=prepare.executeQuery();
     if(resultSet.next()) {
       return resultSet.getString("direccion");

       }
     return "--";

     } catch (Exception e) {
       return "--";
     }
   }    
       public static String getemail(int cod) {
     try {
       String sql="select email from persona where id="+cod;
       Connection connection=ConexionBD.Conectar();
       PreparedStatement prepare=connection.prepareStatement(sql);
       ResultSet resultSet=prepare.executeQuery();
     if(resultSet.next()) {
       return resultSet.getString("email");

       }
     return "--";

     } catch (Exception e) {
       return "--";
     }
   }    
               
    @Override
    public List Listado() {
        ArrayList<Cliente> list=new ArrayList<>();
        String sql="select * from persona";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                Cliente per=new Cliente();
                per.setId(rs.getInt("id"));
                per.setNombre(rs.getString("nombre"));
                per.setTipo_documento(rs.getString("tipo_documento"));
                per.setNum_documento(rs.getString("num_documento"));
                per.setDireccion(rs.getString("direccion"));
                per.setTelefono(rs.getString("telefono"));
                per.setEmail(rs.getString("email"));

                list.add(per);
            }
   
        } catch (Exception e) {
            
        }
        return list;
    }

    @Override
    public Cliente list(int id) {
       ArrayList<Cliente> list=new ArrayList<>();
        String sql="select *from persona where id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                
               p.setId(rs.getInt("id"));
                p.setNombre(rs.getString("nombre"));
                p.setTipo_documento(rs.getString("tipo_documento"));
                p.setNum_documento(rs.getString("num_documento"));
                p.setDireccion(rs.getString("direccion"));
                p.setTelefono(rs.getString("telefono"));
                p.setEmail(rs.getString("email"));

                list.add(p);
            }
   
        } catch (Exception e) {
            
        }
        return p;
    
    }

    @Override
    public boolean add(Cliente cli) {
    String sql="INSERT INTO persona(nombre,tipo_documento,num_documento,direccion,telefono,email)"
               + "VALUES('"+cli.getNombre()+"','"+cli.getTipo_documento()+"','"+cli.getNum_documento()+"','"+cli.getDireccion()+"','"+cli.getTelefono()+"','"+cli.getEmail()+"')";
       
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            
        }catch (Exception e) {
        }
 
       
       return false;
    }

    @Override
    public boolean Edit(Cliente cli) {
        String sql="update persona set nombre='"+cli.getNombre()+"',tipo_documento='"+cli.getTipo_documento()+"',num_documento='"+cli.getNum_documento()+"',direccion='"+cli.getDireccion()+"',telefono='"+cli.getTelefono()+"',email='"+cli.getEmail()+"' where id="+cli.getId();
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
       String sql="delete from persona where id="+id; 
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }

}
