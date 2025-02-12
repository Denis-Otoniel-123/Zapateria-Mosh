package DAO;
import Bean.loginBean;
import java.sql.*;
public class loginDAO {
    loginBean BD=new loginBean();
    String sql="";
    Connection cn;
    PreparedStatement ps;
    ResultSet rs;
    public loginDAO(){
        
    }
    public String Validar(String usu, String cla){
        String tipo="";
        try {
            Class.forName(BD.getDri());
            cn=DriverManager.getConnection(BD.getUrl(), BD.getUsu(), BD.getCla());
            sql="SELECT rol FROM usuario WHERE usu='"+usu+"' AND password='"+cla+"'";
            ps=cn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                tipo=rs.getString(1);
            }
            cn.close();
            rs.close();
            return tipo;
        } catch (SQLException | ClassNotFoundException e){return tipo;}
    }
     
}