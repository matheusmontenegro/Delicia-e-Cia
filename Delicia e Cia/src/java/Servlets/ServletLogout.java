
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sun.rmi.server.Dispatcher;

@WebServlet(name = "ServletLogout", urlPatterns = {"/ServletLogout"})
public class ServletLogout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out=response.getWriter();  
              
            HttpSession session=request.getSession();  
            session.invalidate();  
              
            out.print("<script>alert('Você foi desconectado!');</script>");  
            out.print("<script>location.replace('index.jsp');</script>");  
            out.close(); 
            
            
    }



}
