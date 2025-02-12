package UTIL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConexionBD {
   static Connection con;
    
    
   public ConexionBD () {
     try {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pymeurban","root","");
            System.out.println("conecto exitoso");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("ERROR"+e);
        }    
      
 }   

 public Connection getConnection(){
  
        return con;
        
    }
  public static Connection Conectar(){
  
        return con;
        
    }
 
 
 public void desconectar(){
        con = null;
    }
 
  public   static void  main(String  args[])  
  {
      ConexionBD obj=new ConexionBD();
        obj.getConnection();   
       
  }     

    public Statement createStatement() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
