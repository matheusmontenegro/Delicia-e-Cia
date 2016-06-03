
package Servlets;

import Bean.Pessoa;
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



@WebServlet(name = "ServletCadastro", urlPatterns = {"/ServletCadastro"})
public class ServletCadastro extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           PrintWriter out = response.getWriter();
           
           Pessoa pessoa = new Pessoa();
            pessoa.setNome(request.getParameter("name"));
            pessoa.setCpf(request.getParameter("cpf"));
            pessoa.setRg(request.getParameter("rg"));
            pessoa.setTelefone(request.getParameter("telefone"));
            pessoa.setEndereco(request.getParameter("endereco"));
            pessoa.setSenha(request.getParameter("password"));
            pessoa.setLogin(request.getParameter("login"));
            pessoa.setFoto_perfil(request.getParameter("foto"));
            pessoa.setEmail(request.getParameter("email"));
            
        try { 
            PessoaDAO pessoaDAO = new PessoaDAO();
            String msg = pessoaDAO.cadastrar(pessoa);
            out.print("<script>alert('"+msg+"');");
            out.print("location.replace('index.jsp');</script>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletCadastro.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletCadastro.class.getName()).log(Level.SEVERE, null, ex);
        }     
    }


}
