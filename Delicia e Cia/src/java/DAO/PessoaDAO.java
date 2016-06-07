
package DAO;

import Bean.Pessoa;
import Conexao.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PessoaDAO implements PessoaDAOint{
    private Connection connection;
    public PessoaDAO() throws ClassNotFoundException, SQLException{
        this.connection = Conexao.getConnection();
    }
    @Override
    public boolean login(String login, String password) throws SQLException{
        String sql = "select * from pessoa where login = ? and senha = ?";
        int row = 0;
        PreparedStatement stmt = connection.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        stmt.setString(1, login);
        stmt.setString(2, password);
        stmt.execute();
        ResultSet rs = stmt.getResultSet();
        rs.last();
        row = rs.getRow();
        stmt.close();
        if(row == 0) {
            return false;
        }else{
            return true;
        }
    }
    @Override
    public String getUserName(String login) throws SQLException{
        String sql = "select nome from pessoa where login = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1, login);
        stmt.execute();
        ResultSet rs = stmt.getResultSet();
        rs.next();
        String nome = rs.getString(1);
        stmt.close();
        return nome;
    }
    @Override
    public boolean cpfCheck(String cpf) throws SQLException{
        String sqlCPF = "select * from pessoa where cpf = ?";
        int rowCpf = 0;
        
        PreparedStatement stmtCpf = connection.prepareStatement(sqlCPF, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); 
        stmtCpf.setString(1, cpf);
        stmtCpf.execute();
        ResultSet rsCpf = stmtCpf.getResultSet();
        rsCpf.last();
        rowCpf = rsCpf.getRow();
        stmtCpf.close();
        if(rowCpf == 0){
                return true;
            }else{
                return false;
            }
    }
    @Override
    public boolean rgCheck(String rg) throws SQLException{
        String sqlRG = "select * from pessoa where rg = ?";
        int rowRg = 0;
        
        PreparedStatement stmtRG = connection.prepareStatement(sqlRG, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); 
        stmtRG.setString(1, rg);
        stmtRG.execute();
        ResultSet rsRg = stmtRG.getResultSet();
        rsRg.last();
        rowRg = rsRg.getRow();
        stmtRG.close();
        if(rowRg == 0){
                return true;
            }else{
                return false;
            }
    }
    @Override
    public boolean isAdmin(String login) throws SQLException{
        String sql = "select admin from pessoa where login = ?";
        
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1, login);
        stmt.execute();
        ResultSet rs = stmt.getResultSet();
        rs.next();
        int admin = rs.getInt(1);
        if(admin == 1){
            return true;
        }else{
            return false;
        }
    }
    @Override
    public boolean loginCheck(String login) throws SQLException{
        String sqlLogin = "select * from pessoa where login = ?";
        int rowLogin = 0;
        
        PreparedStatement stmtLogin = connection.prepareStatement(sqlLogin, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); 
        stmtLogin.setString(1, login);
        stmtLogin.execute();
        ResultSet rsLogin = stmtLogin.getResultSet();
        rsLogin.last();
        rowLogin = rsLogin.getRow();
        stmtLogin.close();
        if(rowLogin == 0){
                return true;
            }else{
                return false;
            }
    }

    @Override
    public String cadastrar(Pessoa pessoa) throws SQLException{
        String retorno = null;
        if(rgCheck(pessoa.getRg())){
            if(cpfCheck(pessoa.getCpf())){
                if(loginCheck(pessoa.getLogin())){
                    String sql = "insert into pessoa (nome, cpf, login, senha, endereco, telefone, foto_perfil, email, rg) values(?,?,?,?,?,?,?,?,?)";
                    try {
                        PreparedStatement stmt = connection.prepareStatement(sql);
                        stmt.setString(1, pessoa.getNome());
                        stmt.setString(2, pessoa.getCpf());
                        stmt.setString(3, pessoa.getLogin());
                        stmt.setString(4, pessoa.getSenha());
                        stmt.setString(5, pessoa.getEndereco());
                        stmt.setString(6, pessoa.getTelefone());
                        stmt.setString(7, pessoa.getFoto_perfil());
                        stmt.setString(8, pessoa.getEmail());
                        stmt.setString(9, pessoa.getRg());
                        stmt.execute();
                        stmt.close();  
                    } catch (SQLException e) {
                        e.printStackTrace();   
                    }
                    retorno = "Usuário cadastrado com sucesso!";
                }else{
                    retorno = "O Login informado já está cadastrado!";
                }
            }else{
                retorno = "O CPF informado já está cadastrado";
            }
        }else{
            retorno = "O RG informado já está cadastrado.";
        }
        return retorno;
    }  
    @Override
    public Pessoa getPessoa(String login) throws SQLException{
        String sql = "select * from pessoa where login = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1, login);
        stmt.execute();
        ResultSet rs = stmt.getResultSet();
        rs.next();
        Pessoa pessoa = new Pessoa();
        pessoa.setNome(rs.getString(2));
        pessoa.setCpf(rs.getString(3));
        pessoa.setLogin(rs.getString(4));
        pessoa.setEndereco(rs.getString(6));
        pessoa.setTelefone(rs.getString(7));
        pessoa.setFoto_perfil(rs.getString(8));
        pessoa.setRg(rs.getString(9));
        stmt.close();
        return pessoa;
    }
    @Override
    public int getId(String login) throws SQLException{
        String sql = "select id from pessoa where login = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1, login);
        stmt.execute();
        ResultSet rs = stmt.getResultSet();
        rs.next();
        int id = rs.getInt("id");
        stmt.close();
        return id;
    }
}
