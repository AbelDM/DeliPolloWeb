package Modelo;

import java.sql.*;
import java.util.ArrayList;
import Utils.Conexion;
import javax.swing.JOptionPane;

public class PedidoDB {
    public static boolean insertarPedido(Pedido varpedido, ArrayList<DetallePedido> d) {
        boolean rpta = false;
        try {
            Connection cn = Conexion.getConexion();
            CallableStatement cl = cn.prepareCall("{call sp_RegistrarPedido(?,?)}");
            cl.registerOutParameter(1, Types.INTEGER);
            cl.setString(2, varpedido.getCliente());
            int i=cl.executeUpdate();
            
            int i2=0;
            varpedido.setCodigoPedido(cl.getInt(1));
            CallableStatement cl2 = cn.prepareCall("{CALL sp_RegistrarDetalle(?,?,?,?)}");
            for (DetallePedido aux : d) {
            cl2.setInt(1, varpedido.getCodigoPedido());
            cl2.setInt(2, aux.getCodigoProducto());
            cl2.setDouble(3, aux.getCantidad());
            cl2.setDouble(4, aux.getDescuento());
            i2=cl2.executeUpdate();
            }
            if(i2==1){
                rpta=true;
            }
        }catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);}
        return rpta;
    }
    
     public static ArrayList<Pedido> obtenerPedidos() {
        ArrayList<Pedido> lista = new ArrayList<Pedido>();
        try {
            CallableStatement cl=Conexion.getConexion().prepareCall("{call sp_pedidos()}");
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                Pedido v=new Pedido(rs.getInt(1), rs.getString(2), 
                        rs.getTimestamp(3));
                lista.add(v);
            }
        } catch (Exception e) {System.out.println("pedidos-->"+e);}
        return lista;
    }
    
}
