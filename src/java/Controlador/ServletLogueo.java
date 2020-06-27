
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import Utils.Conexion;

@WebServlet(name = "ServletLogueo", urlPatterns = {"/ServletLogueo"})
public class ServletLogueo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion=request.getParameter("accion");
        if(accion.equals("loguin")){
        String usu=request.getParameter("txtUsu");
        String pas=request.getParameter("txtPas");
        try{
            CallableStatement cl=Conexion.getConexion().prepareCall("{call sp_loguin(?,?)}");
            cl.setString(1, usu);
            cl.setString(2, pas);
            ResultSet rs=cl.executeQuery();

            if(rs.next()){
                HttpSession sesionOK=request.getSession();
                sesionOK.setAttribute("perfil", (String)rs.getString(5));
                sesionOK.setAttribute("nom", (String)rs.getString(3));
                sesionOK.setAttribute("ape", (String)rs.getString(2));
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }else{
                request.setAttribute("msg", "Error de Usu o pas");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }catch(Exception e){System.out.print(e);}
     }else if(accion.equals("cerrar")){
            HttpSession sesionOk = request.getSession();       
            request.getSession().removeAttribute("perfil");
            request.getSession().removeAttribute("nom");
            request.getSession().removeAttribute("ape");
            sesionOk.invalidate();
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }else if(accion.equals("Cancelar")){
            HttpSession sesion= request.getSession();       
            request.getSession().removeAttribute("carrito");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}