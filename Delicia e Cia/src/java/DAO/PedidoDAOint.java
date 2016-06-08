
package DAO;

import Bean.CompraDetalhes;
import Bean.Pedido;
import java.sql.SQLException;
import java.util.LinkedHashMap;

public interface PedidoDAOint {
    public int insertPedido(Double valorTotal, int idPessoa) throws SQLException;
    public void insertProdutoPedido(int idPedido, int idProduto, int qtd, double valorProduto) throws SQLException;
    public LinkedHashMap<Integer, Pedido> getHistorico(int idPessoa) throws SQLException;
    public LinkedHashMap<Integer, CompraDetalhes> getCompraDetails(int idPedido) throws SQLException;
}
