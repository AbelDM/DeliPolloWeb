package Modelo;

public class DetallePedido {
    
    private int codigoPedido;
    private int codigoProducto;
    private double cantidad;
    private double descuento;
    private Producto producto;
    private Pedido pedido;

    public DetallePedido(int codigoPedido, int codigoProducto, 
            double cantidad, double descuento) {
        this.codigoPedido = codigoPedido;
        this.codigoProducto = codigoProducto;
        this.cantidad = cantidad;
        this.descuento = descuento;
    }
    public DetallePedido(int codigoPedido, int codigoProducto, 
            double cantidad, double descuento, Producto producto, 
            Pedido pedido) {
        this.codigoPedido = codigoPedido;
        this.codigoProducto = codigoProducto;
        this.cantidad = cantidad;
        this.descuento = descuento;
        this.producto = producto;
        this.pedido = pedido;
    }
    public DetallePedido() {

    }
    public int getCodigoPedido() {
        return codigoPedido;
    }

    public void setCodigoPedido(int codigoPedido) {
        this.codigoPedido = codigoPedido;
    }

    public int getCodigoProducto() {
        return codigoProducto;
    }

    public void setCodigoProducto(int codigoProducto) {
        this.codigoProducto = codigoProducto;
    }

    public double getCantidad() {
        return cantidad;
    }

    public void setCantidad(double cantidad) {
        this.cantidad = cantidad;
    }

    public double getDescuento() {
        return descuento;
    }

    public void setDescuento(double descuento) {
        this.descuento = descuento;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }

}
    
 