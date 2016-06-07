
package Servlets;

import Bean.Pedido;
import DAO.PedidoDAO;
import DAO.PessoaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "ServletComprar", urlPatterns = {"/ServletComprar"})
public class ServletComprar extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();      
        HttpSession session = request.getSession();
        LinkedHashMap<Integer, Pedido> compra = (LinkedHashMap<Integer, Pedido>) session.getAttribute("compra");
        int idPessoa = 0;
        int idPedido = 0;
        try {
            PessoaDAO pessoaDao = new PessoaDAO();
            String login = (String) session.getAttribute("login");
            idPessoa = pessoaDao.getId(login);
            PedidoDAO pedidoDao = new PedidoDAO();
            double valor = Double.parseDouble(request.getParameter("totalCompra"));
                if(idPessoa != 0){
                    idPedido = pedidoDao.insertPedido(valor, idPessoa);
                }         
            for(Map.Entry<Integer, Pedido> entry : compra.entrySet()){
                int id = entry.getKey();   
                Pedido pedido = entry.getValue();
                System.out.println(idPedido);
                System.out.println(id);
                System.out.println(pedido.produtoPedido.getQuantidade());
                System.out.println(pedido.produtoPedido.getPrecoTotal());
                pedidoDao.insertProdutoPedido(idPedido, id, pedido.produtoPedido.getQuantidade(), pedido.produtoPedido.getPrecoTotal());                    
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletComprar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletComprar.class.getName()).log(Level.SEVERE, null, ex);
        }
        session.setAttribute("compra", null);
        session.setAttribute("carrinho", null);
        out.println("<script>alert('Compra realizada com sucesso! Obrigado!');</script>");
        out.println("<script>location.replace('index.jsp')</script>");
    }

}
