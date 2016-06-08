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
                out.println("<script>alert('Faça login para poder acessar o carrinho.')</script>");
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
            <span class="card-title">Carrinho</span>
            <!-- <form method="post" action="ServletComprar"> -->
              <%
                
                LinkedHashMap<Integer, Produto> produtos = (LinkedHashMap<Integer, Produto>)session.getAttribute("carrinho");
                pageContext.setAttribute("produtos", produtos);
                
                
              %>
              
              <div class="row">
                <table class="striped highlight">
                  <thead>
                    <tr>
                        <th>Produto</th>
                        <th>Preço da Unidade</th>
                        <th>Preço do Cento</th>
                        <th>Quantidade</th>
                    </tr>
                  </thead>
                  <tbody>
              <c:forEach var="produto" items="${produtos}">
                  <tr>
                    <td><c:out value='${produto.value.getNomeProduto()}'/></td>
                    <td>R$ <c:out value='${produto.value.getPrecoUnidade()}'/></td>
                    <td>R$ <c:out value='${produto.value.getPrecoCento()}'/></td>
                    <td><input type="number" name="<c:out value='${produto.value.getIdProduto()}'/>" id="id<c:out value='${produto.value.getIdProduto()}'/>" min="1" value="1" onChange="qtdReplace(<c:out value='${produto.value.getIdProduto()}'/>, this.value);"/></td> 
                    <td>
                        <form method="post" action="ServletRemoveFromCart">
                            <input type="text" style="display:none;" name="idToDelete" value="<c:out value='${produto.value.getIdProduto()}'/>">    
                            <button type="submit" style="width:150px;" class="waves-effect waves-light btn red darken-2">Remover Produto</button>
                        </form>
                    </td>
                  </tr>
              </c:forEach>
                  </tbody>
                </table>
              <form method="post" action="ServletFinalizarPedido">
                 <c:forEach var="produto" items="${produtos}">
                    <input style="display:none;" type="text" value="1" id="<c:out value='${produto.value.getIdProduto()}'/>" name="<c:out value='${produto.value.getIdProduto()}'/>" />  
                 </c:forEach>
              </div>
              <div class="card-action">
                  <button class="waves-effect waves-light btn-large yellow darken-2" type="submit">Fechar Pedido</button>
                  <button class="waves-effect waves-red btn-large white black-text" type="reset">Cancelar</button>
              </div>
              </form>
            </div>
          
       </div>
    </div>
  </div>
</div>

  
</body>
</html>