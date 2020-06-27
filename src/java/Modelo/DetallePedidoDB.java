package Modelo;

import Utils.Conexion;
import java.sql.*;
import java.util.ArrayList;

public class DetallePedidoDB {
        public static ArrayList<DetallePedido> obtenerDetallePedido(int num) {
        
       ArrayList<DetallePedido> lista = new ArrayList<DetallePedido>();
        try {
            CallableStatement cl = Conexion.getConexion().
                    prepareCall("{call sp_detallepedido(?)}");
            cl.setInt(1, num);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                DetallePedido v = new DetallePedido(rs.getInt(1),
                        rs.getInt(2),rs.getDouble(3),rs.getDouble(4));
                lista.add(v);
            }
        }catch (Exception e) {System.out.println(e);}
        return lista;
    }
}
