
package DAO;

import Bean.Produto;
import java.sql.SQLException;
import java.util.ArrayList;

interface ProdutoDAOint {
    public void cadastrar(Produto produto) throws SQLException;
    public ArrayList<Produto> listarTodos(String tipo) throws SQLException;
    public Produto produtoPorId(int id) throws SQLException;
    public String getPrecoUnidade(int id) throws SQLException;
    public String getPrecoCento(int id) throws SQLException;
}
