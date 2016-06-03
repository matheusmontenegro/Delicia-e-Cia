
package DAO;

import Bean.Produto;
import Conexao.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProdutoDAO {
    private Connection connection;
    public ProdutoDAO() throws ClassNotFoundException, SQLException{
        this.connection = Conexao.getConnection();
    }
    public void cadastrar(Produto produto) throws SQLException{
    
        String sql = "INSERT INTO public.produto"
                    + "(nome_produto, descricao, tipo, quantidade, preco_unidade, "
                    + "preco_cento, foto) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, produto.getNomeProduto());
            stmt.setString(2, produto.getDescricao());
            stmt.setString(3, produto.getTipo());
            stmt.setInt(4, produto.getQuantidade());
            stmt.setString(5, produto.getPrecoUnidade());
            stmt.setString(6, produto.getPrecoCento());
            stmt.setString(7, produto.getFoto());
            stmt.execute();
            stmt.close();  
        } catch (SQLException e) {
            e.printStackTrace();   
        }
    }
}
