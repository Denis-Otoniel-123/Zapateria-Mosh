package Bean;
public class loginBean{
    private String url;
    private String dri;
    private String usu;
    private String cla;
    
    public loginBean(){
        this.url="jdbc:mysql://localhost/pymeurban";
        this.dri="com.mysql.jdbc.Driver";
        this.usu="root";
        this.cla="";
    }
    
    public String getUrl(){return url;}
    public String getDri(){return dri;}
    public String getUsu(){return usu;}
    public String getCla(){return cla;}
}