package Modelo;

import java.sql.*;
import java.util.ArrayList;
import Utils.Conexion;

public class ProductoDB {
    
    public static ArrayList<Producto> obtenerProducto() {
        ArrayList<Producto> lista = new ArrayList<Producto>();
        try {
            CallableStatement cl=Conexion.getConexion().prepareCall("{call listarProductos()}");
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                Producto p = new Producto(rs.getInt(1),rs.getString(2),
                        rs.getDouble(3),rs.getString(4));
                lista.add(p);
            }
        } catch (Exception e) {}
        return lista;
    }
    
    public static Producto obtenerProducto(int codigo) {
        Producto p=null;
        try {
            CallableStatement  cl = Conexion.getConexion().prepareCall("{CALL sp_ProductoCod(?)}");
            cl.setInt(1, codigo);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                p=new Producto(rs.getInt(1), rs.getString(2), 
                        rs.getDouble(3), rs.getString(4));
            }
        }catch (Exception e) {}
        return p;
    }
    public static boolean actualizarProducto(Producto varproducto) {
        boolean rpta = false;
        try {
            Connection cn = Conexion.getConexion();
            CallableStatement cl = cn.prepareCall( "{call sp_actualizarPro(?,?,?)}");
            cl.setInt(1, varproducto.getCodigoProducto());
            cl.setString(2, varproducto.getNombre());
            cl.setDouble(3, varproducto.getPrecio());
            int i=cl.executeUpdate();
            if(i==1){
            rpta = true;
            }else{
            rpta = false;
            }
        } catch (Exception e) {}
        return rpta;
    }
    
    public static boolean insertarProducto(Producto p) {
        boolean rpta = false;
        try {
            Connection cn = Conexion.getConexion();
            CallableStatement cl = cn.prepareCall("{CALL sp_insertarPro(?,?,?)}");
            cl.setString(1, p.getNombre());
            cl.setDouble(2, p.getPrecio());
            cl.setString(3, p.getImagen());
            int i=cl.executeUpdate();
            if(i==1){
                rpta=true;
            }else{
                rpta=false;
            }
        } catch (Exception e) { }
        return rpta;
    } 
    
    
    
    
}
