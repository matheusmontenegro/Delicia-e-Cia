package Servlets;

import Bean.Produto;
import DAO.ProdutoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ServletCadProduto", urlPatterns = {"/ServletCadProduto"})
public class ServletCadProduto extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String nomeProduto = request.getParameter("nomeProduto");
        String tipo = request.getParameter("tipoProduto");
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        String descricao = request.getParameter("descricao");
        String precoUnidade = request.getParameter("precoUnidade");
        String precoCento = request.getParameter("precoCento");
        String foto = request.getParameter("foto");
        
        Produto produto = new Produto();
        produto.setTipo(tipo);
        produto.setNomeProduto(nomeProduto);
        produto.setQuantidade(quantidade);
        produto.setDescricao(descricao);
        produto.setPrecoUnidade(precoUnidade);
        produto.setPrecoCento(precoCento);
        produto.setFoto(foto);
        
        try {
            ProdutoDAO produtoDao = new ProdutoDAO();
            produtoDao.cadastrar(produto);
            out.println("<script>alert('Produto cadastrado com sucesso!')</script>");
            out.println("<script>location.replace('cadastro.jsp')</script>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletCadProduto.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletCadProduto.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }


}
