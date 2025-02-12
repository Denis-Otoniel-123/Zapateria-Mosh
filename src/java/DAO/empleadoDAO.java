
package DAO;

import Bean.empleado;
import Interfaz.CRUDEmpleado;
import UTIL.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *

 */
public class empleadoDAO implements CRUDEmpleado{
    ConexionBD cn=new ConexionBD();
               Connection con;
               PreparedStatement ps;
               ResultSet rs;
               empleado p=new empleado();
               

               
               
               
    public static String getEmpleadoNombre(int cod) {
     try {
       String sql="select nombre from empleado where id="+cod;
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
    
    public static String getEmpleadoDireccion(int cod) {
     try {
       String sql="select direccion from empleado where id="+cod;
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
    
    public static String getEmpleadoSueldo(int cod) {
     try {
       String sql="select sueldo from empleado where id="+cod;
       Connection connection=ConexionBD.Conectar();
       PreparedStatement prepare=connection.prepareStatement(sql);
       ResultSet resultSet=prepare.executeQuery();
     if(resultSet.next()) {
       return resultSet.getString("sueldo");

       }
     return "--";

     } catch (Exception e) {
       return "--";
     }
   }     
              
              
    @Override
    public List Listado() {
        ArrayList<empleado> list=new ArrayList<>();
        String sql="select * from empleado";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                empleado emple=new empleado();
                emple.setId(rs.getInt("id"));
                emple.setNombre(rs.getString("nombre"));
                emple.setDni(rs.getString("dni"));
                emple.setSueldo(rs.getDouble("sueldo"));
                emple.setTelefono(rs.getString("telefono"));
                emple.setDireccion(rs.getString("direccion"));
                emple.setEmail(rs.getString("email"));

                list.add(emple);
            }
   
        } catch (Exception e) {
            
        }
        return list;
    }

    @Override
    public empleado list(int id) {
       
        String sql="select * from empleado where id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                
                p.setId(rs.getInt("id"));
               p.setNombre(rs.getString("nombre"));
                p.setDni(rs.getString("dni"));
                p.setSueldo(rs.getDouble("sueldo"));
                p.setTelefono(rs.getString("telefono"));
                p.setDireccion(rs.getString("direccion"));
                p.setEmail(rs.getString("email"));

            }
   
        } catch (Exception e) {
            
        }
        return p;
    
    }

    @Override
    public boolean add(empleado empl) {
    String sql="INSERT INTO empleado(nombre,dni,sueldo,telefono,direccion,email)"
               + "VALUES('"+empl.getNombre()+"','"+empl.getDni()+"','"+empl.getSueldo()+"','"+empl.getTelefono()+"','"+empl.getDireccion()+"','"+empl.getEmail()+"')";
       
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            
        }catch (Exception e) {
        }
 
       
       return false;
    }

    @Override
    public boolean Edit(empleado emple) {
        String sql="update empleado set nombre='"+emple.getNombre()+"',dni='"+emple.getDni()+"',sueldo='"+emple.getSueldo()+"',telefono='"+emple.getTelefono()+"',direccion='"+emple.getDireccion()+"',email='"+emple.getEmail()+"' where id="+emple.getId();
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
       String sql="delete from empleado where id="+id; 
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }
    
}
