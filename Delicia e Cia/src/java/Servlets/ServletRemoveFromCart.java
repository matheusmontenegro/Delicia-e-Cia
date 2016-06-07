
package Servlets;

import Bean.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ServletRemoveFromCart", urlPatterns = {"/ServletRemoveFromCart"})
public class ServletRemoveFromCart extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       PrintWriter out = response.getWriter();
       HttpSession session = request.getSession();
       if(session.getAttribute("carrinho") != null){
            int idToDelete =  Integer.parseInt(request.getParameter("idToDelete"));
            LinkedHashMap<Integer, Produto> produtos = new LinkedHashMap<>();
            produtos = (LinkedHashMap<Integer, Produto>) session.getAttribute("carrinho");
            produtos.remove(idToDelete);
            out.println("<script>alert('Produto Removido.');</script>");
            out.println("<script>location.replace('pedido.jsp');</script>");
            session.setAttribute("carrinho", produtos);
       }else{
           out.println("<script>location.replace('index.jsp');</script>");
       }
    }
}
