
package Servlets;

import DAO.PessoaDAO;
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
import javax.servlet.http.HttpSession;

@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        
        try {
            PessoaDAO pessoaDAO = new PessoaDAO();
            if(pessoaDAO.login(login, password)){
                HttpSession session =request.getSession(); 
                String nome = pessoaDAO.getUserName(login);
                
                if(pessoaDAO.isAdmin(login)){
                    out.print("<script>alert('Bem-vindo "+nome+"!');</script>");
                    out.print("<script>location.replace('admin.jsp');</script>");   
                    session.setAttribute("admin",nome); 
                    session.setMaxInactiveInterval(120);
                }else{
                    session.setAttribute("nome",nome); 
                    session.setAttribute("admin",null); 
                    session.setMaxInactiveInterval(120);
                    out.print("<script>alert('Bem-vindo "+nome+"!');</script>");
                    out.print("<script>location.replace('index.jsp');</script>");   
                }
            }else{
                out.print("<script>alert('Login e/ou senha incorreto(s)');</script>");
                out.print("<script>location.replace('index.jsp');</script>");             
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletLogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
