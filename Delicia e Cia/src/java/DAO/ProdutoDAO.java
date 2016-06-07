
package DAO;

import Bean.Produto;
import Conexao.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProdutoDAO implements ProdutoDAOint{
    private Connection connection;
    public ProdutoDAO() throws ClassNotFoundException, SQLException{
        this.connection = Conexao.getConnection();
    }
    @Override
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
    
    @Override
    public ArrayList<Produto> listarTodos(String tipo) throws SQLException{
        
        ArrayList<Produto> produtos = new ArrayList<>();
        
        String sql = "SELECT * FROM produto where tipo = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1, tipo);
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next()){
            Produto produto = new Produto();
            produto.setIdProduto(rs.getInt(1));
            produto.setNomeProduto(rs.getString(2));
            produto.setDescricao(rs.getString(3));
            produto.setTipo(rs.getString(4));
            produto.setQuantidade(rs.getInt(5));
            produto.setFoto(rs.getString(6));
            produto.setPrecoUnidade(rs.getString(7));
            produto.setPrecoCento(rs.getString(8));
            produtos.add(produto);
        }
        return produtos;
    }
    @Override
    public Produto produtoPorId(int id) throws SQLException{
                
        String sql = "SELECT * FROM produto where id = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        Produto produto = new Produto();
        while(rs.next()){
            
            produto.setIdProduto(rs.getInt(1));
            produto.setNomeProduto(rs.getString(2));
            produto.setDescricao(rs.getString(3));
            produto.setTipo(rs.getString(4));
            produto.setQuantidade(rs.getInt(5));
            produto.setFoto(rs.getString(6));
            produto.setPrecoUnidade(rs.getString(7));
            produto.setPrecoCento(rs.getString(8));

        }
        return produto;
    }
    @Override
    public String getPrecoUnidade(int id) throws SQLException{
        String sql = "SELECT preco_unidade FROM produto WHERE id = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        rs.next();
        return rs.getString("preco_unidade");
    }
    @Override
    public String getPrecoCento(int id) throws SQLException{
        String sql = "SELECT preco_cento FROM produto WHERE id = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        rs.next();
        return rs.getString("preco_cento");
    }
    
}
