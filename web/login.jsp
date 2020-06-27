<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
    String usu = "";
    String nom = "";
    HttpSession sesionOK = request.getSession();

    if (sesionOK.getAttribute("perfil") != null) {
        nom = (String) sesionOK.getAttribute("nom") + " " + (String) sesionOK.getAttribute("ape");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesión</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/estilos.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/flaticon.css"> 
    </head>
    <body>

        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">DeliPollo Logo</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp">Catálogo</a></li>
                            <%
                                if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("Admin")) {
                            %>
                        <li><a href="registrarProducto.jsp">Registrar Producto</a></li>
                            <%
                                }
                                if (sesionOK.getAttribute("perfil") != null) {
                            %>
                        <li><a href="registrarPedido.jsp">Registrar pedidos</a></li>
                            <%
                                }
                                if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("Admin")) {
                            %>
                        <li><a href="ServletControlador?accion=MostrarPedidos">Consultar Pedidos</a></li>
                            <%
                                }
                            %>
                            <%if (sesionOK.getAttribute("perfil") != null) {
                            %>
                        <li><a href="ServletLogueo?accion=cerrar">Cerrar Sesión</a></li>
                            <%
                                }
                            %>
                    </ul>      
                    <ul class="nav navbar-nav navbar-right">
                        <%if (sesionOK.getAttribute("perfil") != null) {
                        %>
                        <li><%out.println("Bienvenido : " + nom);%>
                        </li>
                        <%
                            }
                        %>

                        <%
                            if (sesionOK.getAttribute("perfil") == null) {
                        %>
                        <li><a href="login.jsp">Iniciar Sesion</a></li>
                            <% } %>
                    </ul>
                </div>
            </div>
        </nav>
        <%-- <table border="0" width="1000" align="center">
             <tr bgcolor="skyblue">
                 <th align="left"><a href="index.jsp">Catálogo</a></th>
                     <%
                         if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("Admin")) {
                     %>
                 <th><a href="registrarProducto.jsp">Registrar Producto</a></th>
                     <%
                         }
                         if (sesionOK.getAttribute("perfil") != null) {
                     %>
                 <th><a href="registrarPedido.jsp">Registrar pedidos</a></th>
                     <%
                         }
                         if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("Admin")) {
                     %>
                 <th><a href="ServletControlador?accion=MostrarPedidos">Consultar Pedidos</a></th>
                     <%
                         }
                     %><%if (sesionOK.getAttribute("perfil") != null) {
                     %>
                 <th><a href="ServletLogueo?accion=cerrar">Cerrar Sesión</a></th>
                 <th width="200"><%out.println("Bienvenido : " + nom);%>
                 </th>
                 <%
                     }
                 %>

                <%
                    if (sesionOK.getAttribute("perfil") == null) {
                %>
                <th width="200"><a href="login.jsp">Iniciar Sesion</a></th>
                    <% } %>
            </tr>
        </table>
        --%>


        
        <h2 align="center">Iniciar Sesión</h2>
        <table border="0" width="300" align="Center">
            <form action="ServletLogueo" method="post">
                <input type="hidden" name="accion" value="loguin"/>
                <tr>
                    <td>Usuario:</td>
                    <td><input type="text" placeholder="Usuario" name="txtUsu"></td>
                </tr>
                <tr>
                    <td>Passoword:</td>
                    <td> <input type="password" placeholder="Password" name="txtPas"></td>
                </tr>                  
                <tr>
                    <th colspan="2">
                        <input type="submit" name="btn" value="Iniciar Sesion"> 
                    </th>
                </tr> 
            </form>
        </table>
        

        <h4 align="center">
            <%
                if (request.getAttribute("msg") != null) {
                    out.println(request.getAttribute("msg"));
                }
            %>
        </h4>
    </body>
</html>

