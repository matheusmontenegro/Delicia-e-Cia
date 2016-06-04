
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
       
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        
        if(session.getAttribute("carrinho") != null){
            ArrayList<Integer> ids = (ArrayList<Integer>) session.getAttribute("carrinho");
            ids.add(id);
            out.println("<script>alert('Produto adicionado ao carrinho.');</script>");
        }else{
            ArrayList<Integer> ids = new ArrayList<>();
            ids.add(id);
            session.setAttribute("carrinho", ids);
            out.println("<script>alert('Produto adicionado ao carrinho.');</script>");
        }
        out.println("<script>history.go(-1);</script>");
    }
}

