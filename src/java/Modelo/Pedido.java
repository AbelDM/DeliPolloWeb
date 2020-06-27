package Modelo;

import java.sql.Timestamp;

public class Pedido {
    private int codigoPedido;
    private String cliente;
    private Timestamp fecha;

    public Pedido(int codigoPedido, String cliente,
            Timestamp fecha) {
        this.codigoPedido = codigoPedido;
        this.cliente = cliente;
        this.fecha = fecha;
    }
    public Pedido() {

    }
    public int getCodigoPedido() {
        return codigoPedido;
    }

    public void setCodigoPedido(int codigoPedido) {
        this.codigoPedido = codigoPedido;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }

    
    
}
