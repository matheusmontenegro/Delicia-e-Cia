<%@page import="Bean.Pedido"%>
<%@page import="Bean.Pessoa"%>
<%@page import="DAO.PessoaDAO"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="Bean.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>
<script>
  $(document).ready(function(){
    $(".button-collapse").sideNav();
    $('select').material_select();
  });
</script>
<script type="text/javascript">
  function qtdReplace(id, qtd){
    if(qtd<1){
      alert('Insira uma quantidade válida');
      document.getElementById("id"+id).value = 1;  
      document.getElementById(id).value = 1;  
    }else{
      document.getElementById(id).value = qtd;
    }
  }
</script>
  <title>D&C Pedido</title>
</head>
<body>
    <%
        if(session.getAttribute("admin") != null){
                out.println("<script>alert('Desculpe, você não tem privilégios para acessar esta página.')</script>");
                out.println("<script>location.replace('index.jsp')</script>");
        }else{
            if (session.getAttribute("nome") != null) {
            }else{
                out.println("<script>location.replace('index.jsp')</script>");
            }
        }

    %>

<nav class="grey darken-2 z-depth-3">
  <div class="nav-wrapper container grey darken-2">
    <a href="#!" class="brand-logo"><img src="img/logo.png" style="width:70px;"></a>
<!-- Botão do Menu Mobile -->
    <a href="#" data-activates="mobile-demo" class="button-collapse"><img src="img/menuButton.png" style="width:30px; margin-top: 15px;"></a>
<!-- Opções da Navbar -->
        <%  
            if (session.getAttribute("login") != null) {
              PessoaDAO pessoaDao = new PessoaDAO();
              Pessoa pessoa = pessoaDao.getPessoa(session.getAttribute("login").toString()); 
              pageContext.setAttribute("pessoa", pessoa);
            }
        %>
    <ul class="right hide-on-med-and-down">
      <li class="waves-effect waves-yellow"><a href="index.jsp">Início</a></li>
      <li class="waves-effect waves-yellow"><a href="userHome.jsp">Minha Página</a></li>
      <li class="waves-effect waves-yellow"><a href="historico.jsp">Histórico de Compras</a></li>
      <li class="waves-effect waves-yellow"><a href="pedido.jsp">Carrinho</a></li>
      <li class="waves-effect waves-yellow" id="logoutButton"><a href="ServletLogout" class="white-text">Sair</a></li>
      <li><div class="chip"><img src="perfilImg/${pessoa.getFoto_perfil()}" alt="Usuário da Sessão">${pessoa.getNome()}</li>
    </ul>
<!-- OpÃ§Ãµes do Menu Mobile -->
    <ul class="side-nav" id="mobile-demo">
    <li style="display:inline-block;"><div class="chip hoverable"><img src="perfilImg/${pessoa.getFoto_perfil()}" alt="Usuário da Sessão">${pessoa.getNome()}</li>
      <li class="waves-effect waves-yellow"><a href="index.jsp">Início</a></li>
      <li class="waves-effect waves-yellow"><a href="userHome.jsp">Minha Página</a></li>
      <li class="waves-effect waves-yellow"><a href="historico.jsp">Histórico de Compras</a></li>
      <li class="waves-effect waves-yellow"><a href="pedido.jsp">Carrinho</a></li>
      <li class="waves-effect waves-yellow" id="logoutButtonMobile"><a href="ServletLogout">Sair</a></li>
    </ul>
  </div>
</nav>

<div class="row container">
  <div class="section col s10 offset-s1">
    <div class="row">
        <div class="card hoverable col s12">
            <div class="card-content">
            <span class="card-title">Finalizar Compra</span>
              <%
                  LinkedHashMap<Integer, Pedido> compra = (LinkedHashMap<Integer, Pedido>) session.getAttribute("compra");
                  pageContext.setAttribute("compra", compra);
              %>           
              <div class="row">
                <table class="striped highlight">
                  <thead>
                    <tr>
                        <th>Produto</th>
                        <th>Preço da Unidade</th>
                        <th>Preço do Cento</th>
                        <th>Quantidade</th>
                        <th>Valor do Produto</th>                        
                    </tr>
                  </thead>
                  <tbody>
              <c:forEach var="pedido" items="${compra}">
                  <tr>
                    <td><c:out value='${pedido.value.produtoPedido.produto.getNomeProduto()}'/></td>
                    <td>R$ <c:out value='${pedido.value.produtoPedido.produto.getPrecoUnidade()}'/></td>
                    <td>R$ <c:out value='${pedido.value.produtoPedido.produto.getPrecoCento()}'/></td>
                    <td><c:out value='${pedido.value.produtoPedido.getQuantidade()}'/></td> 
                    <td>R$ <c:out value='${pedido.value.produtoPedido.getPrecoTotal()}'/></td>
                  </tr>
              </c:forEach>
                  <td colspan="4" style="text-align:right;"><b>Total</b></td>
                  <td><b>R$ ${total}</b></td>
                  </tbody>
                </table>                 
              </div>


              <div class="card-action">
                <form method="post" action="ServletComprar">
                  <input type="numeric" style="display:none;" name="totalCompra" value="${total}" />
                  <button class="waves-effect waves-light btn-large yellow darken-2" type="submit">Concluir Compra</button>
                  <button class="waves-effect waves-red btn-large white black-text" onClick="history.go(-1);">Voltar</button>
                </form>
              </div>



            </div>
          
       </div>
    </div>
  </div>
</div>

  
</body>
</html>