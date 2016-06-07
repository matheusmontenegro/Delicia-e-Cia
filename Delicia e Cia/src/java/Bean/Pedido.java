
package Bean;

import java.sql.Timestamp;


public class Pedido {
    private int idPedido;
    private Timestamp data_hora;
    private double valorTotal;
    public ProdutoPedido produtoPedido;
    private int pessoaId;

    /**
     * @return the valorTotal
     */
    public double getValorTotal() {
        return valorTotal;
    }

    /**
     * @param valorTotal the valorTotal to set
     */
    public void setValorTotal(double valorTotal) {
        this.valorTotal = valorTotal;
    }

    /**
     * @return the pessoaId
     */
    public int getPessoaId() {
        return pessoaId;
    }

    /**
     * @param pessoaId the pessoaId to set
     */
    public void setPessoaId(int pessoaId) {
        this.pessoaId = pessoaId;
    }

    /**
     * @return the produtoPedido
     */
    public ProdutoPedido getProdutoPedido() {
        return produtoPedido;
    }

    /**
     * @param produtoPedido the produtoPedido to set
     */
    public void setProdutoPedido(ProdutoPedido produtoPedido) {
        this.produtoPedido = produtoPedido;
    }

    /**
     * @return the idPedido
     */
    public int getIdPedido() {
        return idPedido;
    }

    /**
     * @param idPedido the idPedido to set
     */
    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    /**
     * @return the data_hora
     */
    public Timestamp getData_hora() {
        return data_hora;
    }

    /**
     * @param data_hora the data_hora to set
     */
    public void setData_hora(Timestamp data_hora) {
        this.data_hora = data_hora;
    }
}
