
package Bean;

import java.sql.Timestamp;

public class CompraDetalhes {
    private Timestamp dataHora;
    private double valorTotal;
    private int quantidade;
    private double valorTotalProduto;
    private String nomeProduto;

    /**
     * @return the dataHora
     */
    public Timestamp getDataHora() {
        return dataHora;
    }

    /**
     * @param dataHora the dataHora to set
     */
    public void setDataHora(Timestamp dataHora) {
        this.dataHora = dataHora;
    }

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
     * @return the quantidade
     */
    public int getQuantidade() {
        return quantidade;
    }

    /**
     * @param quantidade the quantidade to set
     */
    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    /**
     * @return the valorTotalProduto
     */
    public double getValorTotalProduto() {
        return valorTotalProduto;
    }

    /**
     * @param valorTotalProduto the valorTotalProduto to set
     */
    public void setValorTotalProduto(double valorTotalProduto) {
        this.valorTotalProduto = valorTotalProduto;
    }

    /**
     * @return the nomeProduto
     */
    public String getNomeProduto() {
        return nomeProduto;
    }

    /**
     * @param nomeProduto the nomeProduto to set
     */
    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }
}
