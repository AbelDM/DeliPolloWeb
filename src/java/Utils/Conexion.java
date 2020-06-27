package Utils;
import java.sql.*;

public class Conexion {

    public static Connection getConexion(){
        
         Connection cn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost/delipollo",
                    "root", "");
            System.out.print("Conexion Satisfactoria");
        } catch (Exception e) { System.out.print("Error de Conexion: "+e); }
        return cn;
        
    }
    
    
    public static void main(String[] args) {
        Conexion.getConexion();
    }
    
}
