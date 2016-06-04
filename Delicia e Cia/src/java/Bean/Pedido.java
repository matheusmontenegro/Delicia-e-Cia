
package Bean;


public class Pedido {
    private int idPedido;
    private int qtdDoces;
    private int qtdSalgados;
    private int valorTotal;
    private int pessoaId;

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
     * @return the qtdDoces
     */
    public int getQtdDoces() {
        return qtdDoces;
    }

    /**
     * @param qtdDoces the qtdDoces to set
     */
    public void setQtdDoces(int qtdDoces) {
        this.qtdDoces = qtdDoces;
    }

    /**
     * @return the qtdSalgados
     */
    public int getQtdSalgados() {
        return qtdSalgados;
    }

    /**
     * @param qtdSalgados the qtdSalgados to set
     */
    public void setQtdSalgados(int qtdSalgados) {
        this.qtdSalgados = qtdSalgados;
    }

    /**
     * @return the valorTotal
     */
    public int getValorTotal() {
        return valorTotal;
    }

    /**
     * @param valorTotal the valorTotal to set
     */
    public void setValorTotal(int valorTotal) {
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
}
