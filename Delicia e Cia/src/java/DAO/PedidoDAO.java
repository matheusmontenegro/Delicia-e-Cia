
package DAO;

import Conexao.Conexao;
import java.sql.Connection;
import java.sql.SQLException;

public class PedidoDAO implements PedidoDAOint {
    private Connection connection;
    public PedidoDAO() throws ClassNotFoundException, SQLException{
        this.connection = Conexao.getConnection();
    }
    
    
    
}
