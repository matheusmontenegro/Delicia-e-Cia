
package DAO;

import Bean.Pessoa;
import java.sql.SQLException;


interface PessoaDAOint {
    
    public String cadastrar(Pessoa pessoa) throws SQLException; //cadastro de usuário
        public boolean cpfCheck(String cpf) throws SQLException; //Verificação do cpf no banco para cadastro
        public boolean rgCheck(String rg) throws SQLException; //verificação do rg no banco para cadastro
        public boolean loginCheck(String login) throws SQLException; //verificação do login no banco para cadastro
    public boolean login(String login, String password) throws SQLException; //Validação do login
    public String getUserName(String login) throws SQLException; //Requisição do nome do Usuário após logado
    public boolean isAdmin(String login) throws SQLException; //verificação de permissão do usuário logado
    public Pessoa getPessoa(String login) throws SQLException;//Busca dos dados do usuário
    public int getId(String login) throws SQLException;
}   
