
package Servlets;

import Bean.Produto;
import DAO.ProdutoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "ServletPedido", urlPatterns = {"/ServletPedido"})
public class ServletPedido extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("idDelete"));
       out.println("<script>alert('"+id+"')</script>");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            ProdutoDAO produtoDAO = new ProdutoDAO();
            Produto produto;
            produto = produtoDAO.produtoPorId(id);
            
            HttpSession session = request.getSession();

            if(session.getAttribute("carrinho") != null){
                LinkedHashMap<Integer, Produto> produtos = (LinkedHashMap<Integer, Produto>)session.getAttribute("carrinho");
               if(!produtos.containsKey(id)){
                   produtos.put(id, produto);
                   out.println("<script>alert('Produto adicionado ao carrinho.');</script>");
               }else{
                   out.println("<script>alert('Este Produto Já Foi Adicionado Ao Carrinho.');</script>");
               }  
               
            }else{
                LinkedHashMap<Integer, Produto> produtos = new LinkedHashMap<>();
                produtos.put(id, produto);
                
                session.setAttribute("carrinho", produtos);
                out.println("<script>alert('Produto adicionado ao carrinho.');</script>");
            }
            out.println("<script>history.go(-1);</script>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletPedido.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletPedido.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}

