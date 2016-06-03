package Conexao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class Conexao {
    private static Connection connection = null;
    private Conexao(){}
        public static Connection getConnection() throws ClassNotFoundException, SQLException{
            if(!(connection instanceof Connection)){
                Class.forName("org.postgresql.Driver");
                connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/loginex", "postgres", "postgres");
            }
            return connection;
        }
        public static void closeConnection() throws SQLException{
            if(connection instanceof Connection){
                connection.close();
            }
        } 
}