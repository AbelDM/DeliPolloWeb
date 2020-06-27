<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
        
    <h2 align="center">Registrar Producto</h2>
    
    <form class="form-horizontal" action="ServletControlador" method="get">
        <table borer="0" width="350" align="center">
        <%
        String img=request.getParameter("img");
    %>
    <tr>
        <td>Nombre: </td>
        <td><input type="text" name="txtNombre" ></td>
    </tr> 
    <tr>
        <td>Precio: </td>
        <td><input type="text" name="txtPrecio" value="0"> </td>
    </tr> 
    <tr>
        <th colspan="2">
            <input type="submit" value="Registrar" name="CargarImagen"/>
        </th>
    </tr>                                                                             
     <input type="hidden" name="txtImagen" value="<%=img%>"/>
      
     <input type="hidden" name="accion" value="RegistrarProducto"/>
        </table>  
    </form> 
    </body>
</html>
