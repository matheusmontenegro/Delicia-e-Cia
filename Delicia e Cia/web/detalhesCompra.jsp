<%@page import="Bean.CompraDetalhes"%>
<%@page import="DAO.PedidoDAO"%>
<%@page import="Bean.Pessoa"%>
<%@page import="DAO.PessoaDAO"%>
<%@page import="java.util.LinkedHashMap"%>
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
  });
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
      <li class="waves-effect waves-yellow"><a href="index.jsp">Home</a></li>
      <li class="waves-effect waves-yellow"><a href="userHome.jsp">Minha Página</a></li>
      <li class="waves-effect waves-yellow"><a href="#">Hitórico de Pedidos</a></li>
      <li class="waves-effect waves-yellow"><a href="pedido.jsp">Carrinho</a></li>
      <li class="waves-effect waves-yellow" id="logoutButton"><a href="ServletLogout" class="white-text">Logout</a></li>
      <li><div class="chip"><img src="perfilImg/${pessoa.getFoto_perfil()}" alt="Usuário da Sessão">${pessoa.getNome()}</li>
    </ul>
<!-- OpÃ§Ãµes do Menu Mobile -->
    <ul class="side-nav" id="mobile-demo">
    <li style="display:inline-block;"><div class="chip hoverable"><img src="perfilImg/${pessoa.getFoto_perfil()}" alt="Usuário da Sessão">${pessoa.getNome()}</li>
      <li class="waves-effect waves-yellow"><a href="index.jsp">Home</a></li>
      <li class="waves-effect waves-yellow"><a href="userHome.jsp">Minha Página</a></li>
      <li class="waves-effect waves-yellow"><a href="#">Histórico de Pedidos</a></li>
      <li class="waves-effect waves-yellow"><a href="#">Carrinho</a></li>
      <li class="waves-effect waves-yellow" id="logoutButtonMobile"><a href="ServletLogout">Logout</a></li>
    </ul>
  </div>
</nav>

<div class="row container">
  <div class="section col s10 offset-s1">
    <div class="row">
        <div class="card hoverable col s12">
            <div class="card-content">
            <span class="card-title">Detalhes da Compra</span>
              <%
                  LinkedHashMap<Integer, CompraDetalhes> compra = (LinkedHashMap<Integer, CompraDetalhes>) session.getAttribute("detalhes");
                  CompraDetalhes detalhes = new CompraDetalhes();
                  detalhes = compra.get(1);
                  pageContext.setAttribute("dataHora", detalhes.getDataHora());
                  pageContext.setAttribute("total", detalhes.getValorTotal());
                  pageContext.setAttribute("compra", compra);
              %>           
              <div class="row">
                <table class="striped highlight">
                  <thead>
                    <tr>
                        <th>Quantidade</th>
                        <th>Nome do Produto</th>
                        <th>Valor</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="compra" items="${compra}">
                        <tr>
                          <td><c:out value='${compra.value.getQuantidade()}'/></td>
                          <td><c:out value='${compra.value.getNomeProduto()}'/></td>
                          <td>R$ <c:out value='${compra.value.getValorTotalProduto()}'/></td>
                        </tr>
                    </c:forEach>
                        <tr>
                            <td colspan="2" style="text-align:right;"><b>Total da Compra</b></td>
                            <td><b>R$ <c:out value='${total}'/></b></td>
                        </tr>
                  </tbody>
                </table>     
                <p>Data/Hora: ${dataHora}</p>
              </div>
              <div class="card-action">
                  <button class="waves-effect waves-red btn-large white black-text" onClick="location.replace('historico.jsp')">Voltar</button>
              </div>
            </div>          
       </div>
    </div>
  </div>
</div> 
</body>
</html>