<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*" %>
<%@page import="java.util.*" %>
<%@page session="true"%>
<%
    String usu="";
    String nom="";
    HttpSession sesionOK=request.getSession();
    
if(sesionOK.getAttribute("perfil")!=null)
    nom=(String)sesionOK.getAttribute("nom")+" "+(String)sesionOK.getAttribute("ape");
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="0" width="1000" align="center">
            <tr bgcolor="skyblue">
                <th><a href="index.jsp">Catálogo</a></th>
                <%
                        if(sesionOK.getAttribute("perfil")!=null && sesionOK.getAttribute("perfil").equals("Admin")){
                    %>
                <th><a href="registrarProducto.jsp">Registrar Producto</a></th>
                <%
                    }
                        if(sesionOK.getAttribute("perfil")!=null){
                    %>
                <th><a href="registrarPedido.jsp">Registrar Pedidos</a></th>
                <%
                    }
                        if(sesionOK.getAttribute("perfil")!=null && sesionOK.getAttribute("perfil").equals("Admin")){
                    %>
                <th><a href="ServletControlador?accion=MostrarPedidos">Consultar Pedidos</a></th>
                <%
                    }
%> <%if(sesionOK.getAttribute("perfil")!=null){
                    %>
                <th><a href="ServletLogueo?accion=cerrar">Cerrar Sesión</a></th>
                <th width="200"><%out.println("Bienvenido : "+nom);%>
                </th>
                <%
                    }
                %>
                
                <%
               if(sesionOK.getAttribute("perfil")==null){
               %>
                <th width="200"><a href="login.jsp">Iniciar Sesion</a></th>
                <% } %>
            </tr>
        </table>
        <h2 align="center">Carrito de Compras</h2>
        <form method="post" action="ServletControlador">
<input type="hidden" name="accion" value="RegistrarPedido" />
<table border="1" align="center" width="450">
    <input type="hidden" name="txtCliente" value="<%
             if(sesionOK.getAttribute("perfil")!=null)
                out.println(nom);%>" readonly="readonly"></th>

    <tr style="background-color: skyblue; color: black; font-weight: bold">
        <td width="180">Nombre</td>
        <td>Precio</td><td>Cantidad</td>
        <td>Descuento</td><td>Sub. Total</td>
    </tr>
       <%
    double total=0;
        ArrayList<DetallePedido> lista = 
                (ArrayList<DetallePedido>)session.getAttribute("carrito");
        
        if(lista!=null){
            
            for (DetallePedido d : lista) {
    %>
                    <tr>
                        <td><%= d.getProducto().getNombre()%></td>
                        <td><%= d.getProducto().getPrecio()%></td>
                        <td><%= d.getCantidad()%></td>
                        <td><%=String.format("%.2f",d.getDescuento())%></td>
                        <td><%=String.format("%.2f",(d.getProducto().getPrecio() * d.getCantidad())-d.getDescuento())%></td>
                    </tr>
    <%
    
    
    total=total+(d.getProducto().getPrecio() * d.getCantidad())-d.getDescuento();
                    }
                }
    %>
    <tr>
       
        <th colspan="4" align="right">Total</th>
         <th><%=String.format("%.2f",total)%></th>
    </tr>
    <tr >
        <th colspan="5">
            <input type="submit" value="Registrar Pedido" name="btnPedido" /></th>
    </tr>
</table>
     <input type="hidden" name="total" value="<%=total%>" />
</form>
</div>
    <h3 align="center"><a href="index.jsp">Seguir Comprando</a> || 
        <a href="ServletLogueo?accion=Cancelar">Cancelar Compra</a>
    
    </h3>
  </div>

        
        
    </body>
</html>
