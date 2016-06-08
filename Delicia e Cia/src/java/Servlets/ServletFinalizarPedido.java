
package Servlets;

import Bean.Pedido;
import Bean.Produto;
import Bean.ProdutoPedido;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "ServletFinalizarPedido", urlPatterns = {"/ServletFinalizarPedido"})
public class ServletFinalizarPedido extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession();
          if(session.getAttribute("carrinho")!= null){
            LinkedHashMap<Integer, Produto> produtos = (LinkedHashMap<Integer, Produto>)session.getAttribute("carrinho");
            LinkedHashMap<Integer, Pedido> compra = new LinkedHashMap<>();
            double totalCompra = 0;
                for(Map.Entry<Integer, Produto> entry : produtos.entrySet()){
                    Pedido pedido = new Pedido();
                    int id = entry.getKey();
                    Produto produto = entry.getValue();
                    ProdutoPedido produtoPedido = new ProdutoPedido();
                    double quantidade = Double.parseDouble(request.getParameter(Integer.toString(id)));
                    double preco = Double.parseDouble(produto.getPrecoUnidade());
                    double precoCento = Double.parseDouble(produto.getPrecoCento());
                    double valorProduto = 0;
                    if(quantidade < 100){
                        valorProduto = preco * quantidade;
                    }else if(quantidade >= 100){
                        double qtd = quantidade / 100.0;
                        int centena = (int) qtd;
                        double temp = (qtd-centena)*100;
                        temp = Math.round(temp);
                        int dezena = (int)temp;           
                        valorProduto = (centena * precoCento)+(dezena * preco);
                        
                    }
                    totalCompra = valorProduto + totalCompra;
                    produtoPedido.setProduto(produto);
                    produtoPedido.setPrecoTotal(valorProduto);
                    produtoPedido.setQuantidade((int)quantidade);
                    pedido.setProdutoPedido(produtoPedido);
                    pedido.setValorTotal(totalCompra);
                    compra.put(id, pedido);
                }
                
                request.setAttribute("total", totalCompra);
                session.setAttribute("compra", compra);
                RequestDispatcher rd = request.getRequestDispatcher("finalizarPedido.jsp");
                rd.forward(request, response);        
        }else{
            out.println("<script>alert('Carrinho Vazio!');</script>");
            out.println("<script>history.go(-1)</script>");
            //RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            //rd.forward(request, response);  
        }
    }
}
