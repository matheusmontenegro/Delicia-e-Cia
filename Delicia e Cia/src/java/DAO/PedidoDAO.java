
package DAO;

import Bean.Pedido;
import Conexao.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedHashMap;

public class PedidoDAO implements PedidoDAOint {
    private Connection connection;
    public PedidoDAO() throws ClassNotFoundException, SQLException{
        this.connection = Conexao.getConnection();
    }
    
    public int insertPedido(Double valorTotal, int idPessoa) throws SQLException{
        //Insert Into Pedido Table
        String sql = "Insert into pedido (valor, id_pessoa) Values (?,?);";
        PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        stmt.setDouble(1, valorTotal);
        stmt.setInt(2, idPessoa);        
        stmt.execute();
        ResultSet rs = stmt.getGeneratedKeys();
        int id = 0;
        if(rs.next()){
            id = rs.getInt("id");
        }
        return id;
    }
    public void insertProdutoPedido(int idPedido, int idProduto, int qtd, double valorProduto) throws SQLException{
        String sql = "INSERT INTO produto_pedido "
                + "(produto_id, pedido_id, quantidade, preco_total) "
                + "VALUES (?, ?, ?, ?);";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setDouble(1, idProduto);
        stmt.setInt(2, idPedido);
        stmt.setInt(3, qtd); 
        stmt.setDouble(4, valorProduto);   
        stmt.execute();
        stmt.close();
    }
    public LinkedHashMap<Integer, Pedido> getHistorico(int idPessoa) throws SQLException{
        LinkedHashMap<Integer, Pedido> pedidos = new LinkedHashMap<>();
        
        String sql = "SELECT id, data_hora, valor FROM pedido WHERE id_pessoa = ?;";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setInt(1, idPessoa);
        stmt.execute();
        ResultSet rs = stmt.getResultSet();        
        while(rs.next()){
            Pedido pedido = new Pedido();
            pedido.setIdPedido(rs.getInt(1));
            pedido.setData_hora(rs.getTimestamp(2));
            pedido.setPessoaId(idPessoa);
            pedido.setValorTotal(rs.getDouble(3));            
            pedidos.put(pedido.getIdPedido(), pedido);
        }        
        return pedidos;
        
    }
    
    
    
}
