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
<%
     Producto p=ProductoDB.obtenerProducto(Integer.parseInt(request.getParameter("id")));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DeliPollo</title>
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
%><%if(sesionOK.getAttribute("perfil")!=null){
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
        <h2 align="center">Actualizar Productos</h2>
        <form action="ServletControlador" method="post">
           <table border="0" width="400" align="center">
              <tr>
                   <td>Código: </td>
         <td><input type="text" name="txtCodigo" value="<%= p.getCodigoProducto()%>" readonly></td>
               </tr><tr>
                   <td>Nombre: </td>
                 <td><input type="text" name="txtNombre" value="<%= p.getNombre()%>"> </td>
               </tr><tr>
                   <td>Precio: </td>
                   <td><input type="text"  name="txtPrecio" value="<%= p.getPrecio()%>">       
                   </td>
               </tr><tr>
               <th colspan="2"><input type="submit" value="Actualizar" name="btnActualizar" /></th>
               </tr>
                <input type="hidden" name="accion" value="ModificarProducto" />
        </form> 
    </body>
</html>
