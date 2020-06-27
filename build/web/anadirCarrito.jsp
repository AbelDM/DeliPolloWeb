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

    if (sesionOK.getAttribute("perfil") == null) {
%>
<jsp:forward page="login.jsp"/>
<%
} else {
usu = (String)sesionOK.getAttribute("perfil");
}
%>

<!DOCTYPE html>
<%
    Producto p=ProductoDB.obtenerProducto(Integer.parseInt(request.getParameter("id")));
%>
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
                <th><a href="registrarPedido.jsp">Registrar pedidos</a></th>
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
        <h2 align="center">Añadir producto a Carrito</h2>
    <form action="ServletControlador">               
 <table border="0" width="500" align="center">

    <tr>
        <th rowspan="5"><img src="img/<%=p.getImagen()%>" width="140" height="140"></th>
        <th></th>
        <th><input type="hidden" name="txtCodigo" value="<%=p.getCodigoProducto()%>" readonly></th>
        </tr><tr>
        <th>Nombre</th>
        <th><input type="text" name="txtNombre" value="<%=p.getNombre()%>" readonly >  </th>
        </tr><tr>
        <th>Precio</th>
        <th><input type="text"  name="txtPrecio" value="<%=p.getPrecio()%>" readonly /></th>
        </tr><tr>
        <th>Cantidad</th>
        <th><input type="number" value="0" min="0" name="txtCantidad" value="0" /></th>
        </tr>
        <tr>
        <th colspan="3"><input type="submit" value="Añadir" name="btnAñadir"></th>
        </tr>
        <input type="hidden" name="accion" value="AnadirCarrito" />
                        
 </table> </form>
</body>
</html>
