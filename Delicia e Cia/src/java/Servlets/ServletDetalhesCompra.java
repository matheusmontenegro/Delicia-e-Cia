
package Servlets;

import Bean.CompraDetalhes;
import DAO.PedidoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ServletDetalhesCompra", urlPatterns = {"/ServletDetalhesCompra"})
public class ServletDetalhesCompra extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int idPedido = Integer.parseInt(request.getParameter("idPedido"));
        System.out.println(idPedido);
        LinkedHashMap<Integer, CompraDetalhes> compra = new LinkedHashMap<>();
        try {
            PedidoDAO pedidoDao = new PedidoDAO();            
            compra = pedidoDao.getCompraDetails(idPedido);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletDetalhesCompra.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletDetalhesCompra.class.getName()).log(Level.SEVERE, null, ex);
        }
        session.setAttribute("detalhes", compra);
        RequestDispatcher rd = request.getRequestDispatcher("detalhesCompra.jsp");
        rd.forward(request, response);
       
    }
}
